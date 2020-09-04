Using BERT API
========================

## Adding BERT to application project

All the files that need to be added to an application are found at `bert/embedded/src/bert`. The c file with the user's main method should `include` `readback.h`, `bert.h`, and the design's `mydesign.h` produced by `bert_gen`. If the application project is created after the bsp is configured, the linker flags should already be set properly. If the application will not compile, verify the linker flags:

* `-Wl,--start-group,-lxilfpga,-lxil,-lxilsecure,-lgcc,-lc,--end-group`
*  `-Wl,--start-group,-lxilsecure,-lxil,-lgcc,-lc,--end-group`

The linker flags are found under the project properties. Go to C/C++ Build -> Settings -> ARM v8 gcc linker -> Inferred Options -> Software Platform.

TODO: Example images of linker flags

## TODO
* Increase heap size
* API calls
* ...
