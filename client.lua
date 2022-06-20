sx,sy = guiGetScreenSize()
x,y = (sx/1680), (sy/1050)

editBoxLogin = guiCreateEdit(530*x, 480*y, 220*x, 30*y, "login", false) -- Developed: 𝙓𝙧𝙖#1955
editBoxPass = guiCreateEdit(530*x, 540*y, 220*x, 30*y, "password", false)
editBoxPass_c = guiCreateEdit(530*x, 582*y, 220*x, 30*y, "password_c", false)

guiSetAlpha(editBoxLogin, 0)
guiSetAlpha(editBoxPass, 0)
guiSetAlpha(editBoxPass_c, 0)

regEditNick = guiCreateEdit(530*x, 455*y, 220*x, 30*y, "Nick", false)
regEditLogin = guiCreateEdit(530*x, 505*y, 220*x, 30*y, "reg_login", false)
regEditPassword = guiCreateEdit(530*x, 555*y, 220*x, 30*y, "reg_password", false) -- Developed: 𝙓𝙧𝙖#1955
regEditPassword_c = guiCreateEdit(530*x, 605*y, 220*x, 30*y, "reg_password_c", false)

guiSetAlpha(regEditNick, 0)
guiSetAlpha(regEditLogin, 0)
guiSetAlpha(regEditPassword, 0)
guiSetAlpha(regEditPassword_c, 0)


guiEditSetMaxLength ( regEditNick, 20 )
guiEditSetMaxLength ( regEditLogin, 15 )
guiEditSetMaxLength ( regEditPassword, 15 )
guiEditSetMaxLength ( regEditPassword_c, 15 )
guiSetVisible(regEditNick,false)
guiSetVisible(regEditLogin,false)
guiSetVisible(regEditPassword,false)
guiSetVisible(regEditPassword_c,false)


guiEditSetMasked ( editBoxPass, true )
guiSetVisible(editBoxLogin,false)
isShow = true
guiEditSetMaxLength ( editBoxLogin, 15 ) -- Developed: 𝙓𝙧𝙖#1955
guiEditSetMaxLength ( editBoxPass, 15 )
guiSetVisible(editBoxPass,false)
line = 530
lineAnim = 2
alphaEror = 0
error = "none"
loginState = "none"
alphaSuccesAnimation = 0
alphaSucces = 0


selectedLoginTab = 1
addEventHandler("onClientResourceStart", resourceRoot, function()
	guiSetVisible(editBoxLogin,true)
	guiSetVisible(editBoxPass,true)
	isShow = true
	showCursor(true)
	showChat(false)
	guiSetInputMode("no_binds")

end)

title = dxCreateFont("fonts/regular.ttf", 25*x)
sub = dxCreateFont("fonts/regular.ttf", 20*x)
mer = dxCreateFont("fonts/myriad.ttf", 25*x)


function isCursorOverRectangle(x,y,w,h)
	if isCursorShowing() then
		local mx,my = getCursorPosition() -- relative
		local cursorx,cursory = mx*sx,my*sy
		if cursorx > x and cursorx < x + w and cursory > y and cursory < y + h then -- Developed: 𝙓𝙧𝙖#1955
			return true
		end
	end
return false
end


function loginDX()
if isShow == true then
	dxDrawImage(0*x, 0*y, 1680*x, 1050*y,"images/background.png", 0,0,0, tocolor(255,255,255,255))
	dxDrawImage(430*x, 300*y, 800*x, 500*y,"images/main.png", 0,0,0, tocolor(255,255,255,255))
	dxDrawText("Vikings",500*x, 270*y, 200*x, 40*y, tocolor(255,255,255,255), 0.8, title)
	dxDrawText("MODS",500*x, 300*y, 200*x, 40*y, tocolor(134,134,134,255), 0.8, title)


	if selectedLoginTab == 1 then
		if isCursorOverRectangle(525*x, 475*y, 230*x, 40*y) then
			if getKeyState("mouse1") then
				selected = "autoriz:login"
			end
		elseif isCursorOverRectangle(530*x, 550*y, 220*x, 30*y) then -- Developed: 𝙓𝙧𝙖#1955
			if getKeyState("mouse1") then
				selected = "autoriz:password"
			end
		elseif isCursorOverRectangle(525*x, 580*y, 230*x, 40*y) then
			if getKeyState("mouse1") then
				selected = "autoriz:c_password"
			end
		end
		if selected == "autoriz:login" then
			dxDrawImage(525*x, 475*y, 230*x, 40*y,"images/editBox.png", 0,0,0, tocolor(49, 61, 79,255), true)
			if getKeyState("mouse1") then
				if guiGetText(editBoxLogin) == "login" then
					guiSetText(editBoxLogin, "")
				end
			end
		else
			dxDrawImage(525*x, 475*y, 230*x, 40*y,"images/editBox.png", 0,0,0, tocolor(49, 61, 79, 255), true)
		end


			if selected == "autoriz:password" then
				dxDrawImage(525*x, 535*y, 230*x, 40*y,"images/editBox.png", 0,0,0, tocolor(49, 61, 79, 255), true)
				if getKeyState("mouse1") then
					if guiGetText(editBoxPass) == "password" then
						guiSetText(editBoxPass, "") -- Developed: 𝙓𝙧𝙖#1955
					end
				end
			else
				dxDrawImage(525*x, 535*y, 230*x, 40*y,"images/editBox.png", 0,0,0, tocolor(49, 61, 79,255), true)
			end


			if selected == "autoriz:c_password" then
				dxDrawImage(525*x, 580*y, 230*x, 40*y,"images/editBox.png", 0,0,0, tocolor(49, 61, 79, 255), true)
				if getKeyState("mouse1") then
					if guiGetText(editBoxPass_c) == "password_c" then
						guiSetText(editBoxPass_c, "")
					end
				end

			else
				dxDrawImage(525*x, 580*y, 230*x, 40*y,"images/editBox.png", 0,0,0, tocolor(49, 61, 79,255), true)
			end
			--if not guiGetText(editBoxPass) == "" then
				if guiGetText(editBoxPass) == guiGetText(editBoxPass_c) then
					dxDrawImage(720*x, 585*y, 30*x, 30*y,"images/succes.png", 0,0,0, tocolor(0, 255, 0, 255), true)
				end
			--end


		if guiGetText(editBoxLogin) == "login" then
			dxDrawText("Digite o login",530*x, 480*y, 200*x, 40*y, tocolor(134,134,134,255), 0.6, title, _,_,false,false,true)
		else
			dxDrawText(guiGetText(editBoxLogin),530*x, 480*y, 200*x, 40*y, tocolor(134,134,134,255), 0.6, title, _,_,false,false,true)
		end
		if guiGetText(editBoxPass) == "password" then
			dxDrawText("Digite a senha",530*x, 540*y, 200*x, 40*y, tocolor(134,134,134,255), 0.6, title, _,_,false,false,true)
		else
			dxDrawText(guiGetText(editBoxPass),530*x, 540*y, 200*x, 40*y, tocolor(134,134,134,255), 0.6, title, _,_,false,false,true)
		end

		if guiGetText(editBoxPass_c) == "password_c" then -- Developed: 𝙓𝙧𝙖#1955
			dxDrawText("Redigite a senha",530*x, 585*y, 200*x, 40*y, tocolor(134,134,134,255), 0.6, title, _,_,false,false,true)
		else
			dxDrawText(guiGetText(editBoxPass_c),530*x, 585*y, 200*x, 40*y, tocolor(134,134,134,255), 0.6, title, _,_,false,false,true)
		end

		if isCursorOverRectangle(580*x, 683*y, 230*x, 40*y) then
			dxDrawImage(550*x, 680*y, 180*x, 30*y,"images/button.png", 0,0,0, tocolor(49, 61, 79, 180), true)
			if getKeyState("mouse1") then
				if guiGetText(editBoxLogin) == "login" then
					alphaAnim = 1
					error = "login"
				else
					if guiGetText(editBoxPass) == guiGetText(editBoxPass_c) then
						triggerServerEvent("playerLogin", localPlayer, guiGetText(editBoxLogin), guiGetText(editBoxPass_c))
					else
						error = "password_c"
						alphaAnim = 1
					end
				end

			end

		else
			dxDrawImage(550*x, 680*y, 180*x, 30*y,"images/button.png", 0,0,0, tocolor(49, 61, 79, 255), true)
		end
			dxDrawText("Entrar",614*x, 683*y, 200*x, 40*y, tocolor(255,255,255,255), 0.5, mer, _,_,false,false,true)
	end
	if selectedLoginTab == 2 then
		if guiGetText(regEditNick) == "Nick" then
			dxDrawText("Digite um apelido",530*x, 455*y, 200*x, 40*y, tocolor(134,134,134,255), 0.6, title, _,_,false,false,true)
		else
			dxDrawText(guiGetText(regEditNick),530*x, 455*y, 200*x, 40*y, tocolor(134,134,134,255), 0.6, title, _,_,false,false,true)
		end

		if selected == "register:nickname" then
			dxDrawImage(525*x, 475*y, 230*x, 40*y,"images/editBox.png", 0,0,0, tocolor(49, 61, 79,255), true)
			if getKeyState("mouse1") then
				if guiGetText(editBoxLogin) == "login" then
					guiSetText(editBoxLogin, "")
				end
			end

		else
			dxDrawImage(525*x, 450*y, 230*x, 40*y,"images/editBox.png", 0,0,0, tocolor(49, 61, 79,255), true)
		end
		if selected == "register:login" then
			dxDrawImage(525*x, 500*y, 230*x, 40*y,"images/editBox.png", 0,0,0, tocolor(49, 61, 79,255), true)
			if getKeyState("mouse1") then
				if guiGetText(editBoxLogin) == "login" then -- Developed: 𝙓𝙧𝙖#1955
					guiSetText(editBoxLogin, "")
				end
			end

		else
			dxDrawImage(525*x, 500*y, 230*x, 40*y,"images/editBox.png", 0,0,0, tocolor(49, 61, 79,255), true)
		end

		if selected == "register:password" then
			dxDrawImage(525*x, 500*y, 230*x, 40*y,"images/editBox.png", 0,0,0, tocolor(49, 61, 79,255), true)
			if getKeyState("mouse1") then
				if guiGetText(editBoxLogin) == "login" then
					guiSetText(editBoxLogin, "")
				end
			end

		else
			dxDrawImage(525*x, 550*y, 230*x, 40*y,"images/editBox.png", 0,0,0, tocolor(49, 61, 79,255), true)
		end
		if selected == "register:password_c" then
			dxDrawImage(525*x, 500*y, 230*x, 40*y,"images/editBox.png", 0,0,0, tocolor(49, 61, 79,255), true)
			if getKeyState("mouse1") then
				if guiGetText(editBoxLogin) == "login" then
					guiSetText(editBoxLogin, "")
				end
			end

		else
			dxDrawImage(525*x, 600*y, 230*x, 40*y,"images/editBox.png", 0,0,0, tocolor(49, 61, 79,255), true)
		end


			
		if isCursorOverRectangle(530*x, 450*y, 200*x, 40*y) then
			if getKeyState("mouse1") then
				if guiGetText(regEditNick) == "Nick" then
					guiSetText(regEditNick, "")
				end
			end
		elseif isCursorOverRectangle(530*x, 500*y, 200*x, 40*y) then
			if getKeyState("mouse1") then
				if guiGetText(regEditLogin) == "reg_login" then
					guiSetText(regEditLogin,  "")
				end
			end
		elseif isCursorOverRectangle(530*x, 550*y, 200*x, 40*y) then
			if getKeyState("mouse1") then
				if guiGetText(regEditPassword) == "reg_password" then
					guiSetText(regEditPassword, "")
				end
			end
		elseif isCursorOverRectangle(530*x, 600*y, 200*x, 40*y) then
			if getKeyState("mouse1") then
				if guiGetText(regEditPassword_c) == "reg_password_c" then
					guiSetText(regEditPassword_c, "")
				end
			end
		end

		-- Developed: 𝙓𝙧𝙖#1955


		if guiGetText(regEditNick) == "Nick" then
			dxDrawText("Primeiro nome ",530*x, 455*y, 200*x, 40*y, tocolor(134,134,134,255), 0.5, title, _,_,false,false,true)
		else
			dxDrawText(guiGetText(regEditNick),530*x, 455*y, 200*x, 40*y, tocolor(134,134,134,255), 0.6, title, _,_,false,false,true)
		end

		if guiGetText(regEditLogin) == "reg_login" then
			dxDrawText("Digite o login",530*x, 505*y, 200*x, 40*y, tocolor(134,134,134,255), 0.6, title, _,_,false,false,true)
		else
			dxDrawText(guiGetText(regEditLogin),530*x, 505*y, 200*x, 40*y, tocolor(134,134,134,255), 0.6, title, _,_,false,false,true)
		end

		if guiGetText(regEditPassword) == "reg_password" then
			dxDrawText("Digite a senha",530*x, 555*y, 200*x, 40*y, tocolor(134,134,134,255), 0.6, title, _,_,false,false,true)
		else
			dxDrawText(guiGetText(regEditPassword),530*x, 555*y, 200*x, 40*y, tocolor(134,134,134,255), 0.6, title, _,_,false,false,true)
		end
		if guiGetText(regEditPassword_c) == "reg_password_c" then
			dxDrawText("Redigite a senha",530*x, 605*y, 200*x, 40*y, tocolor(134,134,134,255), 0.6, title, _,_,false,false,true)
		else
			dxDrawText(guiGetText(regEditPassword_c),530*x, 605*y, 200*x, 40*y, tocolor(134,134,134,255), 0.6, title, _,_,false,false,true)
		end

		--Кнопка создать аккаунт
		if isCursorOverRectangle(580*x, 683*y, 230*x, 40*y) then
			dxDrawImage(550*x, 680*y, 180*x, 30*y,"images/button.png", 0,0,0, tocolor(49, 61, 79, 180), true)
			if getKeyState("mouse1") then
				--triggerServerEvent("regPlayer", localPlayer, guiGetText(regEditNick), guiGetText(regEditLogin), guiGetText(regEditPassword_c))
			end

		else
			dxDrawImage(550*x, 680*y, 180*x, 30*y,"images/button.png", 0,0,0, tocolor(49, 61, 79, 255), true)
		end
			dxDrawText("Registrar",600*x, 683*y, 200*x, 40*y, tocolor(255,255,255,255), 0.5, mer, _,_,false,false,true)
	end


		if lineAnim == 1 then
			line = line + 15
			if line >= 660 then
				line = 660
				selectedLoginTab = 2
				guiSetVisible(editBoxPass, false)
				guiSetVisible(editBoxLogin, false)
				guiSetVisible(editBoxPass_c, false)

				guiSetVisible(regEditNick,true)
				guiSetVisible(regEditLogin,true)
				guiSetVisible(regEditPassword,true)
				guiSetVisible(regEditPassword_c,true)
				selected = "none"
			end
		elseif lineAnim == 2 then
			line = line - 15
			if line <= 530 then
				line = 530
				selectedLoginTab = 1
				selected = "none"
				guiSetVisible(editBoxPass, true)
				guiSetVisible(editBoxLogin, true)
				guiSetVisible(editBoxPass_c, true)

				guiSetVisible(regEditNick,false)
				guiSetVisible(regEditLogin,false)
				guiSetVisible(regEditPassword,false)
				guiSetVisible(regEditPassword_c,false) -- Developed: 𝙓𝙧𝙖#1955

			end
		end


		if isCursorOverRectangle(650*x, 385*y, 200*x, 40*y) then
			if getKeyState("mouse1") then
				lineAnim = 1
			end
		elseif isCursorOverRectangle(542*x, 385*y, 200*x, 40*y) then
			if getKeyState("mouse1") then
				if lineAnim == 1 then
					lineAnim = 2
				end
			end
		end

			dxDrawText("Entrar",542*x, 385*y, 200*x, 40*y, tocolor(255,255,255,255), 0.5, sub, _,_,false,false,true)
			dxDrawText("Registrar",650*x, 385*y, 200*x, 40*y, tocolor(255,255,255,255), 0.5, sub, _,_,false,false,true)
			dxDrawRectangle(505*x, 430*y, 280*x, 2*y, tocolor(49, 61, 79, 255))
			dxDrawRectangle(line*x, 429*y, 60*x, 4*y, tocolor(25, 145, 235, 255))


		if error == "password_c" then
			if alphaAnim == 1 then
				alphaEror = alphaEror + 10 -- Developed: 𝙓𝙧𝙖#1955
				if alphaEror >= 255 then
					alphaAnim = 2
					alphaEror = 255
				end
			elseif alphaAnim == 2 then
				alphaEror = alphaEror - 10
					if alphaEror <= 0 then
						alphaEror = 0
						error = "none"
					end
			end
			dxDrawText("não corresponde",560*x, 650*y, 200*x, 40*y, tocolor(255,0,0,alphaEror), 0.5, mer, _,_,false,false,true)
		end
		if error == "login" then
			if alphaAnim == 1 then
				alphaEror = alphaEror + 10
				if alphaEror >= 255 then
					alphaAnim = 2
					alphaEror = 255
				end
			elseif alphaAnim == 2 then
				alphaEror = alphaEror - 10
					if alphaEror <= 0 then
						alphaEror = 0
						error = "none"
					end
			end
			dxDrawText("Nome de usuário inválido!",560*x, 650*y, 200*x, 40*y, tocolor(255,0,0,alphaEror), 0.5, mer, _,_,false,false,true)
		end


		if alphaSuccesAnimation == 1 then
			alphaSucces = alphaSucces + 10
				if alphaSucces >= 255 then
					alphaSucces = 255
					alphaSuccesAnimation = 2
					--isShow
				end
		elseif alphaSuccesAnimation == 2 then -- Developed: 𝙓𝙧𝙖#1955
			alphaSucces = alphaSucces - 10
				if alphaSucces <= 0 then
					alphaSucces = 0
					isShow = false
					removeEventHandler("onClientRender", root, loginDX)
				guiSetVisible(editBoxPass, false)
				guiSetVisible(editBoxLogin, false)
				guiSetVisible(editBoxPass_c, false)

				guiSetVisible(regEditNick,false)
				guiSetVisible(regEditLogin,false)
				guiSetVisible(regEditPassword,false)
				guiSetVisible(regEditPassword_c,false)
				showChat(true)
				showCursor(false)
				end
		end




		if loginState == "succes" then
			dxDrawText("Autorização bem sucedida!",560*x, 100*y, 200*x, 50*y, tocolor(0,255,0,alphaSucces), 0.5, title)
		elseif loginState == "error" then
			dxDrawText("Erro! Verifique a correção dos dados inseridos!",560*x, 100*y, 200*x, 50*y, tocolor(0,255,0,alphaSucces), 0.5, title)
		end
end
end
addEventHandler("onClientRender", root, loginDX)




function succesLogin()
	loginState = "succes"
	alphaSuccesAnimation = 1
	guiSetInputMode("allow_binds") -- Developed: 𝙓𝙧𝙖#1955
end
addEvent("succesLogin", true)
addEventHandler("succesLogin", root,succesLogin)


function errorLoginPass()
	loginState = "error"
	--alphaSuccesAnimation = 1
end
addEvent("errorLogin", true)
addEventHandler("errorLogin", root,errorLoginPass)


function cancelFalseBinds()
guiSetInputMode("allow_binds")
end
addCommandHandler("allow_binds", cancelFalseBinds)



function stateRegister( state, rpsetname, username, password )
	if state == true then
		register = "succes"
		print("Succes Register")
		exports.fn_main:intoNewPlayer(rpsetname, username, password)
	elseif state == false then
		register = "failed"
		print("Failed Register")
	end
end
addEvent("succesRegister", true)
addEventHandler("succesRegister", root, stateRegister)



addEventHandler( "onClientClick", root, function(button, state)
if selectedLoginTab == 2 then
	if isCursorOverRectangle(580*x, 683*y, 230*x, 40*y) then
		if button == "left" and state == "down" then
			triggerServerEvent("regPlayer", localPlayer, guiGetText(regEditNick), guiGetText(regEditLogin), guiGetText(regEditPassword_c))
		end

	end
end
end)



-- Developed: 𝙓𝙧𝙖#1955