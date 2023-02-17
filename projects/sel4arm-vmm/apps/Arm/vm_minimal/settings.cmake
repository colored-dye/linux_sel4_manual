set(supported "qemu-arm-virt")
if(NOT "${PLATFORM}" IN_LIST supported)
    message(FATAL_ERROR "PLATFORM: ${PLATFORM} not supported.
            Supported: ${supported}")
endif()

set(LibUSB OFF CACHE BOOL "" FORCE)

if(${PLATFORM} STREQUAL "qemu-arm-virt")
    # force cpu
    set(QEMU_MEMORY "2048")
    set(KernelArmCPU cortex-a53 CACHE STRING "" FORCE)
    set(VmInitRdFile ON CACHE BOOL "" FORCE)
endif()
