# moon-phase-background
Change background picture to high resolution picture of the current moon phase from NASA

I wrote a bash script which takes a high resolution image of the current moon phase from NASAs Dial-A-Moon website "https://svs.gsfc.nasa.gov/vis/a000000/a004800/a004874/", adds it onto a background image of stars, labels the image with the Illumination % and the Age of the Moon Cycle  and sets it as a background image on Linux Mint Cinnamon.

best.tif is an example picture.

This script won't automatically update your background, only when excecuted. But if you want it to update automatically just set a Cron Job.

Also the downloaded images are deleted again immediately, so they don't clog up your storage.

# Requirements:
 - bash
 - curl
 - ImageMagick
 - Linux Mint Cinnamon (although if you know how to replace the background image on your current Computer you only need to replace 2 lines in the script.)

# Installation:
Just download all the files and put them in some folder. Then run the script in that folder using ./moonback.sh

I made mine excecutable from anywhere and added a cron job to automatically update the background every 12 hours. (If you don't know how to do that, google it it's easy.

# Configuration:
There is an option to get a higher resolution image, it is highlighted in the code if you want to turn it on.
Other than that i have added a lot of comments to make the code easy to understand. 
It is very short and simple so you can configure anything you want, you can change the background, the configuration the text, anything really.

# Let me know if you find any issues, or give me feedback or customization ideas.