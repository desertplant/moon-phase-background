2025# moon-phase-background
Change background picture to high resolution picture of the current moon phase from NASA

This bash script downloads a high resolution image of the current moon phase from NASAs Dial-A-Moon website https://svs.gsfc.nasa.gov/5587/, adds it onto a background image of stars, labels the image with the phase in percent and the age of the current moon cycle and sets it as a background image on Linux Mint Cinnamon.

best.tif is an example picture. (Resolution 3840x2160 by default, 5760x3240 is possible too.)

For automatic desktop background updates it is recommended to add the script to Startup applications or set a Cron Job.

The downloaded images are deleted again immediately, as not to pollute storage.

## Requirements:
In Linux Mint Cinnamon most likely pre-installed:
 - bash
 - curl
 - ImageMagick
 - Cinnamon (for other environments please see below under Configuration)
 - 2026 (NASA Link changes every year. Script and files will be updated for 2027)


## Installation:
 1. Download the repository and extract the files in some new folder, anywhere you want. 
 2. Navigate to your new folder in terminal
 3. Make the script executable by entering 
```chmod u+x moonback.sh```

You can then run the script using ```./moonback.sh```. Note that you need to be in the folder to run the script this way. To run it from anywhere add the path to ~/.bashrc file. Instructions for that are here: https://askubuntu.com/questions/153251/launch-shell-scripts-from-anywhere

It will download a 5MB image file and change your desktop background and then delete the downloaded image again (as not to pollute storage space). The file back.tif is your new background image now.

You can add this script moonback.sh to startup applications to automatically load the new moon phase background on startup.

To automatically update in certain time intervals you can set a cron job. Note that there is a new image available once per hour, so running this more often will not result in change. 

## Configuration:
 - **Resolution**: 
    - Default resolution: 3840x2160 
    - for 5760x3240: change `isbig=false` to `isbig=true`
    - many more resolutions available: https://svs.gsfc.nasa.gov/vis/a000000/a005500/a005587/frames/ - adjust url in the code accordingly

- **Positioning**: 
    - size and position of moon and text field customizable by changing imagemagick commands

 - **Background Image**: 
    - best_small.tif is the default background image for `isbig=false` (best.tif for `isbig=true`)
    - can be replaced with different background image

 - **System**: 
    - made for Linux Mint Cinnamon
    - adjustable for other systems by editing line 40
    - for gnome just replace the word cinnamon with gnome in line 40

 ## Uninstall 
  To uninstall simply delete the folder with all the files you downloaded. Don't forget to remove any Cronjobs, launchers or references (f.e. in bashrc or startup applications), you may have created.
 
 
 ## Image Credits:
 The moon phase image is downloaded from NASA's Dial-A-Moon website: https://svs.gsfc.nasa.gov/5187/. Thank you to NASA's Scientific Visualization Studio for creating these high resolution visualizations of the moon and making them available to the public. For more information about how these images were created and on the moon itself, see the the link above.
 
 ## Example Image:
 
 ![back](https://user-images.githubusercontent.com/87530028/126072284-342387cc-6c75-4d2e-8200-64035ced6952.jpg)
