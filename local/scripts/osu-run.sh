#!/usr/bin/env bash

export PATH="$HOME/wine-osu3/bin:$PATH"
#export PATH="$HOME/wine-custom/bin:$PATH"
export WINEARCH=win32
export WINEPREFIX="$HOME/.wineosu"
export WINEESYNC=1

export vblank_mode=0
export __GL_SYNC_TO_VBLANK=0
export WINE_GL_LATENCY_REDUCTION=1
export WINE_OPENGL_LATENCY_REDUCTION=1

export STAGING_AUDIO_DURATION=13333
export STAGING_AUDIO_PERIOD=13333
#cd "$HOME/hdd2/osu/"
cd "$HOME/hdd/osunew/"
wine osu\!.exe
