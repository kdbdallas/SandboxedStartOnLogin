SandboxedStartOnLogin
=====================

10.9 (Mavericks) Support
--

Add the ability to have your app start when the user logs in, within a sandboxed app in 10.8 and 10.9


I apologize, but I do not have the time to write up good instructions or create a sample instructions, but hopefully this will still help someone out until then.

I will come back and update when I can.

Basically open your main project in Xcode then open this project in Xcode and grab the project icon/title (top item in the left column) and drag it write below the same one of your main project.

Make sure you add the app this creates as a target dependency of your main project.

Then create a new 'Copy Files' Build Phase. For the Destination choose ''Wrapper' and the subpath 'Contents/Library/LoginItems'
Leave the 'Copy only...' unchecked and add the launcher app as the 'file' for the 'Copy File' you just added.


Here is a link to a similar project (that inspired me).

The launcher code doesn't work in 10.9, but it has a sample project to help you.
[https://github.com/timschroedernet/LaunchAtLoginApp](https://github.com/timschroedernet/LaunchAtLoginApp)

Have fun