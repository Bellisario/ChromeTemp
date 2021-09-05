# ChromeTemp
A Temp Chrome for Windows. Not only a Chrome profile, but a new fresh Chrome for what you want. For example:
> temp things, extensions test and even Chrome flags (but, with flags, make sure to use [Advanced mode](#advanced-mode))!

## Download
[Download the latest version](https://github.com/Bellisario/ChromeTemp/releases/latest/) (called `chrome-temp.zip`) and unpack it where you want. Then run `RUNME.bat` and follow instructions.
### Pay Attention
After file download, make sure to unblock internet download lock: right click on the file, then _Properties_. Now click on _Unblock_ in _Security_ section and click _Ok_ (all this could be a little different in your language).
### Advanced mode
If you need more freedom, you can choose advanced mode:
- disables all extensions (DDG default search engine and ChromeTemp Core Extension).
- allows browser restart (the user chooses when the session ends even after browser close): this makes possible use Chrome flags and update your Chrome also from ChromeTemp.
### Known issues
<details open>
<summary>Every time you run ChromeTemp, you need to allow run twice.</summary>
To resolve, just disable the flag "Always ask before opening this file" (translated in your language).
</details>

## Contribute
Feel free to [contribute](https://github.com/Bellisario/ChromeTemp/pulls) (future goals are preferred, but don't worry to make other), create [an issue](https://github.com/Bellisario/ChromeTemp/issues) or [a new discussion](https://github.com/Bellisario/ChromeTemp/discussions).
### Future Goals
- ~~Check for updates (with _chrome extension_).~~ (Made)
- Prevent user ask to run every time for two times (Currently I don't know how to do. **Help me!!!**).
- Compile batch files (with _bat2exe_).
- Improve graphics for batch and html both.
- **_Feel free to suggest new ones!_**

## For devs
Before continue, [download the source](https://github.com/Bellisario/ChromeTemp/archive/refs/heads/main.zip) and unpack where you want.
### Debug
To debug, you can just run `run.bat` in the app folder.
### Build
To build, run `build.bat`: a zip file called `chrome-temp.zip` will be made in the folder containing `build.bat`.
