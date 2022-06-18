$(() => {
    // Vars
    var audio = new Audio('sound.mp3');
    const title         = document.getElementById('header-title')
    const message       = document.getElementById('message')
    const notification  = document.getElementsByClassName('container')
    const eventListener = window.addEventListener
    const setThing      = $
    // Event Listener
    setThing(notification).css({"right": "-5%", "opacity": "0"})
    eventListener('message', (event) => {
        const e = event.data;
        if (e.action === 'noti') {
            audio.play();
            setThing.post('https://' + GetParentResourceName() + '/notification_boolean', JSON.stringify(true))
            setThing(message).html(e.message || 'Nada')
            setThing(title).html(e.title || 'Información')
            setTimeout(() => {
                setThing(notification).css({"right": "3%", "opacity": "1"})
            },100)
            setTimeout(() => {
                setThing(notification).css({"right": "-5%", "opacity": "0"})
                setThing.post('https://' + GetParentResourceName() + '/notification_boolean', JSON.stringify(false))
            }, e.timeout);
        }
    })
})