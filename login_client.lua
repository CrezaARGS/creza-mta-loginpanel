

local resoureName = getResourceName(getThisResource())
local sx, sy = guiGetScreenSize()
local notification = false
local link = "http://mta/"..resoureName.."/html/login.html"
local initBrowser = guiCreateBrowser(0, 0, sx, sy, true, false, false)
local browser = guiGetBrowser(initBrowser)
guiSetInputMode("no_binds_when_editing")

addEventHandler("onClientBrowserCreated", browser, 
	function()
		fadeCamera(false,0)
		loadBrowserURL(source, link)
	end
)

addEventHandler("onClientBrowserDocumentReady", browser,
    function ()
		fadeCamera(true)
		showCursor(true)
		local username, password = loginFile("get")
		if not (username == "" or password == "") then
			executeBrowserJavascript(source, "document.getElementById('loginUser').value = '" .. username .. "'");
			executeBrowserJavascript(source, "document.getElementById('loginPass').value = '" .. password .. "'");
			executeBrowserJavascript(source, "document.getElementById('loginSave').checked = true");
		else
			executeBrowserJavascript(source, "document.getElementById('loginSave').checked = false");
		end
    end
)

addEvent("onClientPlayerLogin", true)
addEventHandler("onClientPlayerLogin", resourceRoot,
	function()
		if isTimer ( notification ) then killTimer ( notification ) end
		destroyElement(initBrowser)
		showCursor(false)
	end
)

addEvent("submitLogin", true)
addEventHandler("submitLogin", resourceRoot,
	function(username, password, checksave)
		triggerServerEvent("onRequestLogin", resourceRoot, username, password, checksave)
	end
)

addEvent("submitRegister", true)
addEventHandler("submitRegister", resourceRoot,
	function(username, password, repassword)
		triggerServerEvent("onRequestRegister", resourceRoot, username, password, repassword)
	end
)

function loginFile(action, username, password)
	local xml = xmlLoadFile ("@login.xml")
	if not xml then xml = xmlCreateFile("@login.xml", "login") end
	
	local usernameNode = xmlFindChild (xml, "username", 0)
	local passwordNode = xmlFindChild (xml, "password", 0)
	
	if not usernameNode then usernameNode = xmlCreateChild(xml, "username") end
	if not passwordNode then passwordNode = xmlCreateChild(xml, "password") end	
	
	if (action == "get") then
		if usernameNode and passwordNode then
			return xmlNodeGetValue(usernameNode), xmlNodeGetValue(passwordNode)
		else
			return "", ""
		end
	elseif (action == "set") then
		xmlNodeSetValue (usernameNode, tostring(username))
		xmlNodeSetValue (passwordNode, tostring(password))
		xmlSaveFile(xml)
	elseif (action == "remove") then
		xmlNodeSetValue (usernameNode, "")
		xmlNodeSetValue (passwordNode, "")
		xmlSaveFile(xml)
	end
	xmlUnloadFile (xml)
end
addEvent("useLoginFile", true)
addEventHandler("useLoginFile", resourceRoot, loginFile)

addEvent("setNotification",true)
addEventHandler("setNotification",resourceRoot,
	function(text)
		local js = "<div class='error-box alert'> <div class='msg'>"..tostring(text).."</div> <p><a class='toggle-alert' href='#' onclick='closeAlert()'></a></p> </div>"
		executeBrowserJavascript(browser, 'document.getElementById("alert").innerHTML = "' .. js ..'"')
		if isTimer ( notification ) then killTimer ( notification ) end
		notification = setTimer(
			executeBrowserJavascript,
			5000,
			1,
			browser,
			'document.getElementById("alert").innerHTML = ""'
		)
	end
)

local musicas = {"sfx/musica.mp3","sfx/doka.mp3","sfx/alaska.mp3","sfx/poc.mp3"} --Adicione suas musicas aqui
function loadData()
    som = playSound(musicas[math.random(1,#musicas)],true)
	setSoundVolume(som, 1)
end
loadData()

function pMusica()
    stopSound(som)
end
addEvent("useLoginFile",true)
addEventHandler("useLoginFile",root,pMusica) -- Developed: 𝙓𝙧𝙖#1955

