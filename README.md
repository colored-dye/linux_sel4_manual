Run Linux VM on seL4, QEMU ARM64 platform, without CAmkES or relevant dependencies.

Core code by reference to https://github.com/dornerworks/sel4-armv8-vmm.

## 0. Steps

1. Manually implement a generic seL4 application.
2. Build a VMM.
3. Incorporate Linux VM.


## 1. Library structure difference

The project by Dornerworks(https://github.com/dornerworks/sel4-armv8-vmm) was written in 2014, many of whose libraries are now deprecated, and archived under the GitHub account "SEL4PROJ".

----

Try 10.0.x version's seL4_projects_libs.

The 11.0.x version libraries have bugs, whose fixes are in `diffs/` directory.
