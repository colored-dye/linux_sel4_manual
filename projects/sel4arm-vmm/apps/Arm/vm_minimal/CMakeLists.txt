cmake_minimum_required(VERSION 3.7.2)

project(manual-arm-qemu-vm C)

if("${KernelARMPlatform}" STREQUAL "qemu-arm-virt")
    message("sel4arm-vmm/apps/Arm/vm_minimal")
    # set(cpp_flags "-DKERNELARMPLATFORM_QEMU-ARM-VIRT")
    file(
        GLOB
            deps
            main.c
            vmlinux.h
            vmlinux.c
            ${KernelARMPlatform}/vmconf.h
            ${KernelARMPlatform}/vmconf.c
    )

    add_executable(manual-arm-qemu-vm EXCLUDE_FROM_ALL ${deps})

    target_link_libraries(
        manual-arm-qemu-vm
        PUBLIC
            muslc
            sel4
            sel4runtime
            sel4allocman
            sel4vka
            sel4utils
            sel4rpc
            sel4sync
            sel4muslcsys
            sel4arm-vmm
            sel4_autoconf
            sel4arm-amm_Config
    )
else()
    message("Platform not supported")
endif()
