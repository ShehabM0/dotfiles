### Installation
---
##### Pick a patch
`https://[st | dwm].suckless.org/patches/<patch_name>/<patch_file>.diff`
##### Installing it
`patch -p1 < <patch_file>.diff`

##### Patch Strip Levels
Assume paths are `a/config.def.h` and `b/config.def.h`
`-p0`
No components are stripped, The paths are used as-is.
Resulting path: a/config.def.h and b/config.def.h
`-p1`
The first component (e.g., a/ or b/) is stripped.
Resulting path: config.def.h
