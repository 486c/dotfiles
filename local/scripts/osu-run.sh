#!/usr/bin/env bash
#export PATH="$HOME/.wineosu/osuwine/bin:$PATH" #Use custom WINE version to run osu!
export PATH="/opt/wine-osu/bin:$PATH"
export WINEARCH=win32
export WINEPREFIX="$HOME/.wineosu"
#export WINEPREFIX="$HOME/Downloads/opt/wine-osu/"
#export WINEFSYNC=1

#VSync. For some reason, some people had been getting input latency issues and for some reason, the fix is to set VSync to off.
export vblank_mode=0 #For AMD, Intel and others
export __GL_SYNC_TO_VBLANK=0 #For NVIDIA proprietary and open source >=500

#export STAGING_AUDIO_DURATION=13333 # 0.667ms at 48KHz
#export STAGING_AUDIO_PERIOD=13333 # 0.667ms at 48KHz
#export STAGING_AUDIO_DURATION=26666 # 0.667ms at 48KHz
#export STAGING_AUDIO_PERIOD=26666 # 0.667ms at 48KHz
#start osu!

#cd "$HOME/hdd/osu!/"


cd "$HOME/hdd/osunew/"
#cd "$HOME/hdd/osu!/"
#cd "$HOME/hdd/mania/"
wine osu\!.exe
