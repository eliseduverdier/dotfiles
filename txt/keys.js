document.addEventListener('keydown', e => {
    if (e.ctrlKey && e.key === 's') {
        e.preventDefault();
        console.log('saved !');
        showNotification('Saved !')
    }
    if (e.key === 'Tab') {
        console.log('tab !', e.target.innerHTML);
        e.preventDefault()
        showNotification('Tab !')
    }
});
