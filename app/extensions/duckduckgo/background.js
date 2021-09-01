if (chrome)
    var browser = chrome;

chrome.tabs.onUpdated.addListener(
    function (tabId, changeInfo, tab) {
    // console.log(changeInfo);
    if (changeInfo.url) {
        if (changeInfo.url === 'chrome://newtab/') {
            chrome.tabs.create({
                active: true,
                url: 'https://start.duckduckgo.com/'
            }, function (tab) {});
            chrome.tabs.remove(tabId, function () {});
        };
    };
});
browser.browserAction.onClicked.addListener(function () {
    if (confirm('Do you want uninstall this extension?\nIf you uninstall it, DuckDuckGo won\'t be your default search engine.')) {
        chrome.tabs.create({
            active: true,
            url: 'chrome://newtab/'
        }, function (tab) {});
        chrome.management.uninstallSelf();
    }
});
