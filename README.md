# s-notifyv3
Mensaje del extended:

```/es_extended/client/functions.lua
ESX.ShowNotification = function(title, msg, duration)
    TriggerEvent("interface:notify:sendNotification", {
        title = title,
        msg = msg,
        duration = duration or 5000
    })
end
