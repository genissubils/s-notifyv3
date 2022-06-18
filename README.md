# s-notifyv3

- Preview: https://streamable.com/9csra6
- Discord:  https://discord.gg/SNDpBw8E57 

```/es_extended/client/functions.lua
ESX.ShowNotification = function(title, msg, duration)
    TriggerEvent("interface:notify:sendNotification", {
        title = title,
        msg = msg,
        duration = duration or 5000
    })
end
