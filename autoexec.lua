local env = getrenv()

local function does_env_func_exist(name)
    return env[name] ~= nil
end

local function new_env_func(name, out)
    assert(name, "Missing name")
    if name == "request" then
    	env.syn[name] = out
    	return true
    end
    env[name] = out
end

new_env_func("syn", {})
new_env_func("request", http_request)
new_env_func("getreg", debug.getregistry)
new_env_func("getupvalues", debug.getupvalues)
new_env_func("getupvalue", debug.getupvalue)
new_env_func("setupvalue", debug.setupvalue)
new_env_func("getconstants", debug.getconstants)
new_env_func("getrawmetatable", getrawmetatable)
new_env_func("setreadonly", setreadonly)
new_env_func("newcclosure", newcclosure)
new_env_func("setclipboard", setclipboard)
new_env_func("islclosure", islclosure)
new_env_func("setscriptable", setscriptable)
new_env_func("is_synapse_function", checkclosure)
new_env_func("firetouchinterest", firetouchinterest)
new_env_func("fireclickdetector", fireclickdetector)
new_env_func("getconnections", getconnections)
new_env_func("sethiddenproperty", sethiddenproperty)
new_env_func("getsynasset", getcustomasset)
new_env_func("writefile", writefile)
new_env_func("readfile", readfile)
new_env_func("appendfile", appendfile)
new_env_func("makefolder", makefolder)
new_env_func("isfile", isfile)
new_env_func("isfolder", isfolder)

new_env_func("workspace", game:GetService("Workspace"))
new_env_func("players", game:GetService("Players"))
new_env_func("repl", game:GetService("ReplicatedStorage"))
new_env_func("scriptContext", game:GetService("ScriptContext"))
new_env_func("collection", game:GetService("CollectionService"))
new_env_func("http", game:GetService("HttpService"))
new_env_func("run", game:GetService("RunService"))
new_env_func("uis", game:GetService("UserInputService"))
new_env_func("tp", game:GetService("TeleportService"))
new_env_func("ts", game:GetService("TweenService"))
new_env_func("teams", game:GetService("Teams"))

if does_env_func_exist("global") then
    new_env_func("module", global)
end

new_env_func("does_env_func_exist", does_env_func_exist)
new_env_func("new_env_func", new_env_func)
