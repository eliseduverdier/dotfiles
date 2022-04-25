/**
 * Shows information
 */
function showNotification(text) {
    let notification = document.querySelector('#notification')
    notification.innerHTML = text
    notification.removeAttribute('hidden')
    setTimeout(function () {
        notification.setAttribute('hidden', 'true')
    }, 2000)
}

function showShortcuts() {
    document.querySelector('#shortcuts').removeAttribute('hidden')
}

function hideShortcuts() {
    document.querySelector('#shortcuts').setAttribute('hidden', true)
}