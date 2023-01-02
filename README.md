# moon-phase-background
Change background picture to high resolution picture of the current moon phase from NASA

I wrote a bash script which downloads a high resolution image of the current moon phase from NASAs Dial-A-Moon website "https://svs.gsfc.nasa.gov/5048", adds it onto a background image of stars, labels the image with the Illumination % and the Age of the Moon Cycle  and sets it as a background image on Linux Mint Cinnamon.

best.tif is an example picture. (Resolution 5641x3650 by default, 8192x5641 is possible too.)

This script won't automatically update your background, it only updates it once each time it is excecuted. But if you want it to update automatically just set a Cron Job or add moonback.sh to startup applications.

Also the downloaded images are deleted again immediately, so they don't clog up your storage.

# Requirements:
If you have cinnamon these are most likely pre-installed.
 - bash
 - curl
 - ImageMagick
 - Linux Mint Cinnamon (**although** you can have it run on most other distros and DEs by editing only 1 line, the one which changes the background picture. See below under configuration. I plan on making this work for all Desktops automatically soon. Also i believe someone forked it and made a version for gnome.)
 - year 2022 (the code only works until the end of 2023, then it needs to be updated, which I will do at the end of 2023)


# Installation:
 1. Download the repository and extract the files in some new folder, anywhere you want. 
 2. Navigate to your new folder in terminal
 3. Make the script executable by entering 
```chmod u+x moonback.sh```

That's it! You can then run the script using ```./moonback.sh```. Note that you need to be in the folder to run the script this way. If you want to run it from anywhere you need to add the path to your ~/.bashr file. Instructions for that are here:https://askubuntu.com/questions/153251/launch-shell-scripts-from-anywhere

It will download a 5MB image file and change your desktop background and then delete the downloaded image again (as not to pollute storage space). The file back.tif is your new background image now. Let me know if you encounter any errors.

You can add this script moonback.sh to startup applications to automatically load the new moon phase background on startup.

And/Or you can have it automatically update in certain time intervalls. To do this you can set a cron job. You should read up on how to do that online. It's pretty easy. Note that there is a new image available once per hour, so running this more often will not result in change. 

# Configuration:
 -**Resolution**: There is an option to get a higher resolution image(8192x5641, default is 5641x3650), it is commented in the code if you want to turn it on. You just have to set **isbig=true** (default setting: isbig=false). You can also set an even lower resoltion but you're going to half to do the work yourself. It's possible though and fairly easy. (To do this just go to NASAS Dial-A Moon website, (link is below), and find the links for downloading the resolution you want and carefully change them in the bash script.)

- **Positioning**: If your display size is different from mine you might have to play around with some settings, (like the text field position).

 - **Background Image**: You can use your own image as a background image. Just make sure it is large enough and it is in the .tif format. Then just replace the best_small.tif file with your image and rename yours to best_small.tif  (Unless you have isbig=on, then best.tif instead of best_small.tif)

 - **System**: If you are not running Linux Mint Cinnamon, all you have to do is edit the gsettings line: (line 40). Find out what command you need to replace the background image on your system. Just google it and its probably better to test it out in the command line first. Then edit the line to work for you. For example, in gnome, I'm pretty sure you only have to replace the word cinnamon to gnome and leave everything else the same. I haven't tested it though.

- **Anything**. You can customize anything else you want! I have added comments to make the code easy to understand. It is very short and simple.
Let me know if you need help configuring anything or want me to add anything.

 # Deinstallation. 
  To uninstall simply delete the folder with all the files you downloaded. Don't forget to remove any Cronjobs, launchers or references (f.e. in bashrc or startup applications), you may have created.
 
 
 # Image Credits:
 The moon phase image is downloaded from NASA's Dial-A-Moon website:https://svs.gsfc.nasa.gov/5048. Thank you to NASA's Scientific Visualization Studio for creating these high resolution visualizations of the moon and making them available to the public. For more information about how these images were created and on the moon itself, see the the link above.
 
 # Example Image:
 
 ![back](https://user-images.githubusercontent.com/87530028/126072284-342387cc-6c75-4d2e-8200-64035ced6952.jpg)
