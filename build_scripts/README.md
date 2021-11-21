# How to build data:

* Prerequisites:

You need to build data tools from mc2 repository. And copy executeables in `build_scripts` folder.

* Windows (GNU Make required):

`make all`

* Linux:

`make all BUILD_PLATFORM=linux`


# How to clean data:

* Windows (GNU Make required):

`make clean`

* Linux:

`make clean BUILD_PLATFORM=linux`


# Move data to where you've build a game

You'll need to copy next files to the game directory:

* data
* assets
* \*.cfg
* \*.fst

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
    ├── options.cfg
    ├── orgprefs.cfg
    ├── prefs.cfg
    ├── shaders
    │   ├── gos_text.frag
    │   ├── gos_text.vert
    │   ├── gos_tex_vertex.frag
    │   ├── gos_tex_vertex_lighted.frag
    │   ├── gos_tex_vertex_lighted.vert
    │   ├── gos_tex_vertex.vert
    │   ├── gos_vertex.frag
    │   ├── gos_vertex_lighted.frag
    │   ├── gos_vertex_lighted.vert
    │   ├── gos_vertex.vert
    │   ├── include
    │   ├── object_tex.frag
    │   └── object_tex.vert
    ├── sniff.dat
    ├── system.cfg
    ├── testtxm.tga
    ├── textures.fst
    └── tgl.fst

