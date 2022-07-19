function playerLoginFunc(username, password)
local account = getAccount ( username, password ) 
	if ( account ~= false ) then 
		logIn ( source, account, password ) 
		triggerClientEvent("succesLogin", root)
	else
		triggerClientEvent("errorLogin", root)
	end
end
addEvent("playerLogin", true)
addEventHandler("playerLogin", root, playerLoginFunc)






function registerPlayer (rpsetname, username, password )
        --if(password ~= "" and password ~= nil and username ~= "" and username ~= nil) then
            local account = getAccount (username)
			if (account == false) then
				local accountAdded = addAccount(username,password) -- Developed: Xra#0001
				print("Voce esta kayıt")
           		--exports.fn_main:intoNewPlayer(rpsetname, username, password)
           		 --triggerClientEvent("succesRegister", root, true, rpsetname, username, password)
           	else
           		print("Esta conta ve esta kaydı!")
           	end

       -- else	
           -- triggerClientEvent("succesRegister", root, false)
       -- end
end
addEvent("regPlayer", true)
addEventHandler("regPlayer", root, registerPlayer)
