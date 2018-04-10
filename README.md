# AdHoc.cmd
Command-Line Tool for Windows to easily create Ad Hoc networks  
As for now this is for wireless lan only
# Commands
Can also be shown by calling `adhoc usage` or simply `adhoc`
* `adhoc reload`
  + Applies the config to the Ad Hoc network
* `adhoc status` or `adhoc info`
  + Shows the status of the Ad Hoc network
* `adhoc setup`
  + Runs a setup for the Ad Hoc network
  + Can consume ssid and key as parameter
* `adhoc start`
  + Starts the Ad Hoc network
* `adhoc stop`
  + Stops the Ad Hoc network
# Create an Ad Hoc network
Creating an Ad Hoc network with AdHoc.cmd is fairly easy.  
* Download or clone *AdHoc.cmd* and run a command line in the same folder as *AdHoc.cmd*.
* Type `adhoc setup`, hit enter and you will be prompted for a ***SSID*** and for a ***Key***.  
  + The ***SSID*** is the name of your network if you leave it blank it will use the default *SSID* **AdHoc**.  
  + The ***Key*** is nothing else as the password to your network and is by default **123456789**.  
* After the setup has finished you can run your network with `adhoc start`.
# Internet access through your Ad Hoc
To access the Internet through your Ad Hoc network you will need to do some extra steps that are not possible through simple commands on command line.  
* Open up the adapter settings with the command `ncpa.cpl`.
* Right click the adapter that you are personally using to access the internet.
* In the conext menu click on `Properties`.
* Switch on the tab called `Sharing`.
* Tick `Allow other network users to connect through this computer’s Internet connection`.
* On the combobox select the local area network adapter with your chosen SSID.
