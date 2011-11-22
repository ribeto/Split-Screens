## Split Screens

Split Screens goal is to show a simple example of displaying different contents on an external display from your iPhone or iPad. You can test the project in the simulator choosing one of the options from Hardware > TV Out. Another way is to connect a hdmi device using [Apple Digital AV Adapter](http://store.apple.com/us/product/MC953ZM/A). 

By far the coolest option is to use the new feature in iPad 2 and iPhone 4S Airplay mirroring. Airplay mirroring is really misnamed, which prompted me to write this little example.  Only if you enable mirroring on your device will you get the UIScreenDidConnectNotification and UIScreenDidDisconnectNotification to fire. Also to use the external display with airplay you can't just use the MPVolumeView and show the route picker.  Choosing airplay from the route picker will only put video, photos, etc on the screen and you won't be able overlay anything on top.

By default airplay mirroring will just mirror you screens. Setting up a separate UIWindow for the external screen will make airplay mirroring behave like connecting an external adapter to your device.

* * *

## Screenshots


#### Device Only

![Device Only](https://github.com/ribeto/Split-Screens/raw/master/readmeImages/deviceOnly.png)

#### Device With External Screen Connected

![Device With Screen](https://github.com/ribeto/Split-Screens/raw/master/readmeImages/deviceWithExternalConnected.png)  ![External Screen](https://github.com/ribeto/Split-Screens/raw/master/readmeImages/externalDisplay.png)


