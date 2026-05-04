# How to build game data:

## Prerequisites

You need to build data tools from mc2 repository. And copy executeables in `build_scripts` folder.
Those are the necessary tools (they are built along with a game, so no additional actions should not be taken):
 - aseconv
 - makefst
 - makersp
 - pak
 - text\_tool

## Dependencies
 * `ffmpeg` is used to convert movies. You should have it in the Path environment or just puch absolute path in `config.mk`

## Building

* Windows (GNU Make required):

`make all`

* Linux:

`make all BUILD_PLATFORM=linux`


## How to clean data:

* Windows (GNU Make required):

`make clean`

* Linux:

`make clean BUILD_PLATFORM=linux`


## Move data to where you've build a game

You'll need to copy next files to the game directory:

* data
* assets
* \*.cfg
* \*.fst
* testtxm.tga

After this game directory should have following structure:

    ├── art.fst
    ├── assets
    │   └── graphics
    ├── camera.fst
    ├── data
    │   ├── movies
    │   ├── objects
    │   └── sound
    ├── effect.fst
    ├── h2prefs1.cfg
    ├── h2prefs.cfg
    ├── hiprefs1.cfg
    ├── hiprefs.cfg
    ├── insignia.fst
    ├── libmc2res.so
    ├── mc2
    ├── midprefs1.cfg
    ├── midprefs.cfg
    ├── minprefs1.cfg
    ├── minprefs.cfg
    ├── misc.fst
    ├── mission.fst
    ├── prefs.cfg
    ├── shaders
    │   ├── gos_text.frag
    │   ├── gos_text.vert
    │   └── ...
    ├── system.cfg
    ├── testtxm.tga
    ├── textures.fst
    └── tgl.fst

