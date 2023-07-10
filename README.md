# AutoRudder, Created by Useless-Bits.  

Hey everyone! This is AutoRudder, a script I made for the AH-64D Apache in DCS. I created this script because I don’t currently have rudder peddles but still wanted to fly the Apache. Before making this script I knew nothing about Lua code so I decided I would learn the bare basic to try to make it work. And here we are, a AutoRudder script for the Apache.

# Features:  
Self centering. When helicopter starts rotating due to torque the AutoRudder will auto counter to stop rotation.  
Fully rudderless control. (no rudder key binds required! The script controls it for you!)  
AutoRudder controlled turning. Using the key binds for left and right the AutoRudder will control the rotation speed that you set.  
Options file for user specific settings. (turn speed, enable/disable features, speed settings.)  
Speed dependent control. AutoRudder can disable itself at a set speed to not interfere with high speed flight.  
Key bind to disable auto centering for manual control. Or key bind to disable whole system for full manual control.  
AutoRudder works from the pilot seat or the gunner seat.  
And more to come!  

# key binds:  
Left and Right KU Keyboard key. Controls Left and Right rotation of the helicopter.  
Parking brake. Controls AutoRudder as a whole. When set AutoRudder is disabled for manual control.  
Zeroizer (emergency panel one). Disables auto centering while keeping left and right control enabled.  
More to come!  
  
# Roadmap: These may or may not happen, I will be exploring if these are even achievable.  
Change options from on the Apache’s keyboard. And more options.  
Heading hold to ensure the Apache is always facing the same direction.  
More to come! Please suggest what you would like to see and i will see what i can do!  

# READ ME! INSTALLATION GUIDE!  

Open (C:\Users\YourUser\Saved Games\DCS\Scripts)  

IF YOU DONT HAVE A "Export" FILE IN THIS FOLDER  
  
Drag and Drop the AutoRudder, AutoRudderOptions, AutoRudderExport and Export files into this location.  
and your done!

IF THERE IS A "Export" FILE IN THIS FOLDER  
  
Drag and Drop the AutoRudde, AutoRudderOptions, and AutoRudderExport files into this folder,  
Then open the Export file already in your folder with a text editor like notepad.  
Add this line after everything in the Export file. (if there is anything)  

dofile(lfs.writedir() .. "Scripts/AutoRudderExport.lua")  

And your done!  
