
addEvent("onRequestLogin",true)
addEventHandler("onRequestLogin",resourceRoot,
	function(username,password,checksave)
		if not (username == "") then
			if not (password == "") then
				local account = getAccount ( username, password )
				if ( account ~= false ) then
					logIn(client,account,password)
					triggerClientEvent (client,"onClientPlayerLogin",resourceRoot)
					if checksave and checksave == "1" then
						triggerClientEvent(client,"useLoginFile",resourceRoot,"set",username,password)
					else
						triggerClientEvent(client,"useLoginFile",resourceRoot,"remove",username,password)
					end
				else
					triggerClientEvent(client,"setNotification",resourceRoot,"Yanlış kullanıcı adı veya parola...")
				end
			else
				triggerClientEvent(client,"setNotification",resourceRoot,"Şifrenizi girin...")
			end
		else
			triggerClientEvent(client,"setNotification",resourceRoot,"Kullanıcı adınızı girin...")
		end
	end
)

addEvent("onRequestRegister",true)
addEventHandler("onRequestRegister",resourceRoot,
	function(username,password,repassword)
		if not (username == "") then
			if not (password == "") then
				if not (repassword == "") then
					if password == repassword then
						local account = getAccount (username) -- Developed: 𝙓𝙧𝙖#1955
						if (account == false) then
							local accountAdded = addAccount(tostring(username),tostring(password))
							if (accountAdded) then
								logIn(client,accountAdded,password)
								triggerClientEvent(client,"onClientPlayerLogin",resourceRoot)
								triggerClientEvent(client,"useLoginFile",resourceRoot,"set",username,password)
								outputChatBox("*Başarılı bir şekilde kayıt oldunuz...! ( Kullanıcı adınız: #ee8a11" .. username .. " #FFFFFF| Şifreniz: #ee8a11" .. password .. "#FFFFFF )",client,255,255,255,true)
							else
								triggerClientEvent(client,"setNotification",resourceRoot,"Lütfen farklı bir kullanıcı adı veya şifre girin...")
							end
						else
							triggerClientEvent(client,"setNotification",resourceRoot,"Bu hesap zaten önceden oluşturulmuş...!")
						end
					else
						triggerClientEvent(client,"setNotification",resourceRoot,"Parolalar uyuşmuyor...!")
					end
				else 
					triggerClientEvent(client,"setNotification",resourceRoot,"Şifrenizi doğrulayınız...!") -- Developed: 𝙓𝙧𝙖#1955
				end
			else
				triggerClientEvent(client,"setNotification",resourceRoot,"Yeni hesabınız için bir şifre girin...!")
			end
		else
			triggerClientEvent(client,"setNotification",resourceRoot,"Hesap oluşturmak için lütfen bir kullanıcı adı girin...!")
		end
	end
)

