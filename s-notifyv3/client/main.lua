local showingNotification = false

function ConvertTextToHTML(msg)
    msg = msg:gsub("~r~", "<span style=color:red;>")
    msg = msg:gsub("~b~", "<span style='color:rgb(0, 213, 255);'>")
    msg = msg:gsub("~g~", "<span style='color:rgb(0, 255, 68);'>")
    msg = msg:gsub("~y~", "<span style=color:yellow;>")
    msg = msg:gsub('~XUBAN~', '<span style = "color: #9D39FC">')
    msg = msg:gsub("~p~", "<span style='color:rgb(220, 0, 255);'>")
    msg = msg:gsub("~f~", "<span style=color:grey;>")
    msg = msg:gsub("~m~", "<span style=color:darkgrey;>")
    msg = msg:gsub("~u~", "<span style=color:black;>")
    msg = msg:gsub("~o~", "<span style=color:gold;>")
    msg = msg:gsub("~s~", "</span>")
    msg = msg:gsub("~w~", "</span>")
    msg = msg:gsub("~b~", "<b>")
    msg = msg:gsub("~n~", "<br>")
    msg = msg:gsub("\n", "<br>")
    return msg
end

function sendNotification(title, msg, duration)
    while showingNotification do
        Wait(200)
    end
    SendNUIMessage({
        action = 'noti';
        withTitle = false;
        title = ConvertTextToHTML(title) or 'Información',
        message = ConvertTextToHTML(msg);
        timeout = duration or 2000;
    })
end

-- EVENTS


RegisterNetEvent("interface:notify:sendNotification", function(data)
    duracion = duration or 5000
    if showingNotification then 
        SetTimeout(duracion, function() 
            sendNotification(data.title, data.msg, data.duration)
        end)
    else
        sendNotification(data.title, data.msg, data.duration)
    end
end)

RegisterNUICallback('notification_boolean', function(boolean)
    showingNotification = boolean
end)


function SendTriggerNotification(title, msg, duration)
    TriggerEvent("interface:notify:sendNotification", {
        title = title,
        msg = msg,
        duration = duration or 5000
    })
end

exports('sendNotify', function(title, msg, timeouts)
    SendTriggerNotification(title, msg, timeouts)
end)

RegisterCommand('subilsNotify', function()
    SendTriggerNotification('Este es un titulo', 'Este es tu mensaje hijo de puta', 5000)
end)