if (chrome)
    var browser = chrome;

chrome.tabs.onCreated.addListener(function (tab) {
    // console.log(tab);
    if (tab.pendingUrl === 'chrome://welcome/')
        chrome.tabs.remove(tab.id, function () {});
});
chrome.tabs.onUpdated.addListener(
    function (tabId, changeInfo, tab) {
	// console.log(changeInfo);
    if (changeInfo.url) {
        if (changeInfo.url === 'chrome://flags/')
            chrome.tabs.update(tabId, {
                active: true,
                url: browser.runtime.getURL('pages/flags.html')
            }, function (tab) {});
        if (changeInfo.url === 'chrome://settings/help')
            chrome.tabs.update(tabId, {
                active: true,
                url: browser.runtime.getURL('pages/chrome-settings-help.html')
            }, function (tab) {});
    };
});
fetch(browser.runtime.getURL('pages/uninstall.html'))
.then( response => response.blob() )
.then( blob =>{
    var reader = new FileReader();
    reader.onload = function(){ browser.runtime.setUninstallURL('https://htmlpreview.github.io/?' + this.result) };
    reader.readAsDataURL(blob);
}) ;
// browser.runtime.setUninstallURL('file:///C:/');
browser.browserAction.onClicked.addListener(function () {
    browser.tabs.create({
        url: browser.runtime.getURL('pages/README.html')
    });
});
