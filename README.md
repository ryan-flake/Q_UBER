# Q_UBER
Repository for code related to QPMs automation of Uber task. 

Current functionality includes processing for:
  Riders,
  Drivers

You must have R studio downloaded on your computer to use this repository

To download the repository and code within:

1. Go to "Code" in top portion of the main repository and click "Download Zip" 

2. drag the file to your desktop and open it. 

3. Rename the main file to "Q_UBER"

4. Open the Q_UBER.Rproj file 

5. Go to file and open both the "Riders_Processing.R" and "Drivers_Processing.R"

To Process lists and execute the code:

1. Make sure you have installed the tidyverse and lubridate packages. Enter the below code into the console and press enter.
```{R} 
install.packages("tidyverse")
install.packages("lubridate")
```

2. We now need to place files into the correct folers. On your desktop open the "Q_UBER" file. Then open the "uber_lists" path. You should now have two seperate paths for "Riders" and "Drivers" 

3. We now need to copy all the files into the correct path of either "Riders" or "Dirvers". Use either drag and drop or select all the relevant files in your Downloads and right click to move to the correct location

4. We now need to go through each file and rename it so the R code will read the file. For Riders, the stock download with look like this, "United_States_Riders_0212437221.csv". We need to rename the file to "United_States_Riders_pre.csv". This process will be the same for Drivers.

5. Lastly we need to run the code. Use to following key board comands in the script editor in the top left tile of R stuido. command + a, command + return/enter. This will run the entire Rider_Processing script or Driver_Processing script depending on which is open. 

6. Repeat the previous step for the other script when the console no longer has a stopsign in the right corner of the bottom left tile. 

This will take some time to run and the riders script will take longer as the files are bigger. You will be left with a bunch of processed files in the "Riders" and "Drivers" folders. Use these to upload to the XM Directory





  
