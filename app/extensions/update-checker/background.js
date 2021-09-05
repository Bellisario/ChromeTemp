if (chrome)
    var browser = chrome;

var debug = false;

(async function () {
    var version = await fetch(browser.runtime.getURL('version.txt'));
    version = await version.text();
    if (version === 'default' && debug === false)
        return console.log('Not checking for updates:\nChromeTemp is running from source (dev mode).');
    console.log('Checking for updates...');
    var latest = await fetch('https://github.com/Bellisario/ChromeTemp/releases/latest');
    latest = latest.url.replace('https://github.com/Bellisario/ChromeTemp/releases/tag/', '');
    console.log('Current version:', version, '\nLatest version:', latest);
    if (version !== latest) {
		console.log('Update available.');
		await new Promise(r => setTimeout(r, 10000));
		notification = browser.notifications.create('chrome-temp.updater', {
            title: 'ChromeTemp Update Available',
            message: 'Click here to open the download page.',
            iconUrl: browser.runtime.getURL('chrome-temp.png'),
            type: 'basic',
            requireInteraction: true
        });
		browser.notifications.onClicked.addListener(function () {
			browser.notifications.clear('chrome-temp.updater');
			browser.tabs.create({url: 'https://github.com/Bellisario/ChromeTemp/releases/latest'});
		});
	} else {
		console.log('No update found.');
	};
})();

browser.browserAction.onClicked.addListener(function () {
    browser.tabs.create({
        url: 'https://github.com/Bellisario/ChromeTemp/releases/latest'
    });
});
