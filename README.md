# Simracing on Linux

## Why?
- I like racing but I cannot afford to die (or worse) on an accident, so...simulation it is.
- I like the challenge of learning how to drive fast. Learning by doing, I choose you!
- I have a Budget. 0 is that Budget right now, so I have to work with what I have around: 
  - Laptop running Linux 
    - This is the main difference with other guides online.
  - G29 steering wheel
    - This may mean you have to adapt this guide to your wheel.
  - A copy of GTR2 from Steam
- I also like the challenge of making stuff work on Linux. 
- Maybe someone on the interwebs can benefit from my findings as I progress on Both of the above challenges.

  
# How I make the game work on Wine
- Almost vanilla Ubuntu 22.04 on a Dell XPS 9360
- Installed Steam
- Bought GTR2 and installed it
- Copied the install folder from steam's to wine's
cp -r $HOME/.steam/debian-installation/steamapps/common/GTR\ 2\ -\ FIA\ GT\ Racing\ Game $HOME/.wine/drive_c/GTR2
- install proper libraries
  - when you run wine you may be asked to, but DO NOT INSTALL MONO JUST YET!
winetricks dxvk
winetricks videomemorysize=default
winetricks dotnet45
wine vcredist_x86.exe -> get it from Microsoft, look for Visual C++ 2010
winecfg -> auto capture mouse, enable virtual desktop (set size)
wine GTR2Config.exe -> set your screen resolution, no vertical sync no antialiasing

ATTENTION: I am running without the Anniversary HQ mod! (somehow FFB seems to work better...if I set it to rumblepad(yes, it's weird))

# How I configure FFB on Linux
- install oversteer https://github.com/berarma/oversteer
- git clone https://github.com/berarma/oversteer.git
  - cd oversteer
  - meson build
  - cd build
  - ninja install
  - restart the system
- install new-lg4ff https://github.com/berarma/new-lg4ff
- I chose the DKMS method:
  - Install DMKS packages from apt
  - Download the repo into /usr/src/new-lg4ff
  - sudo dkms install /usr/src/new-lg4ff
    - IMPORTANT: Choose a DMKS Password that is easy to type on US-Layout Keyboard (I failed several times because mine is QWERTZ)
  - restart and enter the previous password (Again, here you probably have a US Layout)

# How I make proper HUDs show up

Install XD Tool
Install MoTeC (which version?)
Configure my PLR (where did I get this info from?)
Set resolution to XXX:YYY-32bit
Set wine to Windows XP (tried also with winetricks)
...and still it doesn't work UNLESS you overwrite your GTR2.exe with the one from HQ Anniversary:
Copy your GTR2.exe to GTR2.exe.original
Download HQ Anniversary from https://esport-racing.de/gtr2-16th-anniversary-patch/
Open the Compressed file and extract ONLY the GTR2.exe into your GTR2 folder (in other words, overwrite yours)

# Improving performance: 4GB Patch - SPOILER could not open the executable
- Download the patch
- Make a copy of GTR2.exe
- Run the patch with wine

# Challenges
- Get proper Force Feedback
  - So far I configure FFB on oversteer and set Force on GTR2 to Rumblepad
  - Maybe having GHub on wine would help
    - But GHub cannot detect my G29 wheel
## Installing logi hub - DID NOT GET TO INSTALL YET
sudo winetricks --self-update
winetricks -q dotnet471 # yes, probably a newer version would be better, but this is the one I got working...until I test others
wine lghub_installer_2021.3.5164.exe # got it from https://support.logi.com/hc/en-us/articles/360025298133


# Troubleshooting:
##  ERROR:
  0024:err:msvcrt:_invalid_parameter (null):0 (null): (null) 0
  0024:err:module:loader_init "mfc100.dll" failed to initialize, aborting
  ----
  SOLUTION #1:
  Copy over all files from ./GTR2/dlls to the main directory of your GTR2 installation
  
  SOLUTION #2
  Made another copy of the folder
  Installed Power and Glory
  copied over all .dll on P&G's folder to my GTR2 folder
  
