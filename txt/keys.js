/**
 * Control keys events
 * For the moment, this is just for preventing brains mix-ups
 * with saving and indenting...
 * Beware of order!
 */
document.addEventListener('keydown', e => {
    if (e.ctrlKey && e.key === 's') {
        showNotification('Saved !')
        e.preventDefault()
    } else if (e.ctrlKey && e.key === 'ArrowUp') {
        switchToPreviousTab()
        e.preventDefault()
    } else if (e.ctrlKey && e.key === 'ArrowDown') {
        switchToNextTab()
        e.preventDefault()
    } else if (e.key === 'Tab') {
        insertFourSpaces()
        e.preventDefault()
    } else if (e.ctrlKey && e.key === 'e') {
        frameText()
        e.preventDefault()
    } else if (e.ctrlKey && e.key === '?') {
        showShortcuts()
        e.preventDefault()
    } else if (e.key === 'Escape') {
        hideShortcuts()
        e.preventDefault()
    }
});


function insertFourSpaces() {
    currentSelection = document.getSelection()
    inNode = currentSelection.anchorNode
    selectionStart = currentSelection.anchorOffset
    selectionEnd = currentSelection.focusOffset

    if (inNode.nodeValue !== null && inNode.nodeType === Node.TEXT_NODE) {
        if (currentSelection.type === 'Caret') // insert 4 space
            newContent = inNode.nodeValue.slice(0, selectionStart) + '    ' + inNode.nodeValue.slice(selectionStart)
        /**
         * Indentation of block not supported yet:
         * needs to manage multiple line selection correctly
         */
        // else if (currentSelection.type === 'Range') // indent selection:
        //     newContent = '   ' + inNode.nodeValue

        inNode.nodeValue = newContent
    }
}

function frameText() {
    currentSelection = document.getSelection()
    inNode = currentSelection.anchorNode

    if (inNode.nodeValue !== null) {
        newContent =
            '╔═' + '═'.repeat(inNode.nodeValue.length) + '═╗\n'
            + '║ ' + inNode.nodeValue + ' ║\n'
            + '╚═' + '═'.repeat(inNode.nodeValue.length) + '═╝'

        inNode.nodeValue = newContent
    }
}
