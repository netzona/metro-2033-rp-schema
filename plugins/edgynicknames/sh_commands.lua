local PLUGIN = PLUGIN

--Credits to whoever wrote the original string replacement code
nut.command.add("setnick", {
	syntax = "[string newnick]",
	onRun = function(client, arguments)
		if SERVER and IsValid(client) then
			local newNick = arguments[1]
			if newNick then
				local oldName = client:Name()
				local newName
				if not string.find(client:Name(), "'") then
					--newName = string.gsub(oldName, " ", " '"..newNick.."' ")
					newName = oldName .. " '"..newNick.."' "
				else
					newName = string.gsub(oldName, "'.*'", "'"..newNick.."'")
				end
				--client:getChar():setVar("charname", newName)
				nut.command.run(client, "charsetname", {client:Name(), newName})
				client:notifyLocalized("edgySetNick", newName)
			else
				client:notifyLocalized("edgySpecifyNick")
			end
		end
	end
})

nut.command.add("removenick", {
	syntax = "[none]",
	onRun = function(client, arguments)
		if SERVER and IsValid(client) then
			local newName = string.gsub(client:Name(), "'.*' ", "")
			--client:getChar():setVar("charname", newName)
			nut.command.run(client, "charsetname", {client:Name(), newName})
			client:notifyLocalized("edgySetDefNick", newName)
		end
	end
})

