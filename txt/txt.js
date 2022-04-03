
// fun with favicon
let emoji = '📎️'

function setFavicon(emoji) {
    let svg = `<svg xmlns="http://www.w3.org/2000/svg" width="64" height="64"><text dx="-8" dy="48" x="10" y="10">${emoji}</text><style><![CDATA[text{font-size: 64px;}]]></style ></svg>`
    document.querySelector('link[rel="icon"]').setAttribute('href', 'data:image/svg+xml;utf8,' + svg)
}
setFavicon(emoji)
// --------------
const key = 'notes'
let activeKey = key

const article = document.querySelector('pre')
const ul = document.querySelector('ul')

article.innerHTML = localStorage[key] ? localStorage[key] : '…'
article.focus()

// init if no file
if (!localStorage) { localStorage[key] = '…' }
// load files
Object.keys(localStorage).sort().forEach(item => {
    li = document.createElement('li')
    let filename = item.replace('notes', '')
    li.innerHTML = filename === '' ? '...' : filename
    if (filename === '') li.classList += 'active'
    li.setAttribute('data-key', key + filename)
    ul.appendChild(li)
})

// save file
article.addEventListener('keyup', function (e) { localStorage[activeKey] = article.innerHTML });

// add new file
function createFile(filename) {
    filename = '.' + filename;
    if (localStorage.hasOwnProperty(key + filename)) {
        alert("Name already exists!")
        return
    }
    li = document.createElement('li')
    // TODO check duplicates
    // TODO warning if exists
    li.innerHTML = filename
    li.setAttribute('data-key', key + filename)
    initFileChanger(li)
    ul.appendChild(li)

    localStorage[key + filename] = '...'
    changeFile(li)
    e.target.value = ''
}
document.querySelector('input[name = "filename"]').addEventListener('keyup', function (e) {
    if (e.keyCode === 13) { createFile(e.target.value) }
})

document.querySelector('#new').addEventListener('click', function (e) {
    filename = document.querySelector('input[name=filename]').value
    createFile(filename)
})

const changeFile = function (li) {
    // change active file
    let active = document.querySelector('li.active')
    if (active) active.removeAttribute('class')
    li.classList += 'active' // get new file
    activeKey = li.dataset.key
    if (localStorage.hasOwnProperty(activeKey)) {
        article.innerHTML = localStorage[activeKey]
    } else { // default
        activeKey = key
        article.innerHTML = localStorage[key]
    }
}

// read and select files
const initFileChanger = function (li) {
    li.addEventListener('click', function (e) {
        changeFile(e.target)
    })
}
document.querySelectorAll('li').forEach(li => initFileChanger(li))

// delete files / reset
document.querySelector('#delete').addEventListener('click', function (e) {
    if (activeKey === key) {
        article.innerHTML = '…'
    } else {
        // delete current file if active
        localStorage.removeItem(activeKey)
        document.querySelector(`li[data-key="${activeKey}"]`).remove()
    }
})

// export
document.querySelector('#export').addEventListener('click', function (e) {
    const content = JSON.stringify(localStorage)

    var downloadElement = document.createElement('a');
    downloadElement.style.display = 'none';
    downloadElement.setAttribute('href', 'data:application/json;charset=utf-8,' + encodeURIComponent(content));
    downloadElement.setAttribute('download', 'notes_export.json');

    document.body.appendChild(downloadElement);
    downloadElement.click();
    document.body.removeChild(downloadElement);
})