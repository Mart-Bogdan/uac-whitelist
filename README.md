# uac-whitelist
Tool to bypass UAC warnings, still not compromising security. 

Tihis application allows you to specify list of application, which can be run with elevated privilegues wihout uer prompt. But to add app to whitelist you have to poses admin rights.

## Architecture
Background [windows service](http://en.wikipedia.org/wiki/Windows_service) is runing on your system all the time, 
once you want to launch something with admin rights -- you run small client app, whitch asks Service to run that app. 
Service is checking if that app is allowed to be run with admin rights and launches that app isnide user's session 
(services have SessionID=0, first logged in user's SessionID=1, second user's SessionID=2 )

basicaly you can configure your application shortcut tu lauch this way:

    uac-run <my-exe-file.exe> [arguments..]


#It's not working yet!

I do have algorithm and gathered documentation how to implement this, but still hadn't time to implent it yet. 
