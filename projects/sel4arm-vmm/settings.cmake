cmake_minimum_required(VERSION 3.7.2)

if(EXISTS "${CMAKE_CURRENT_LIST_DIR}/apps/Arm/${MANUAL_VM_APP}")
    set(AppArch "Arm" CACHE STRING "" FORCE)
else()
    message(FATAL_ERROR "App does not exist for supported architecture")
endif()

if(AppArch STREQUAL "Arm")
    set(MANUAL_ARM_LINUX_DIR "${CMAKE_CURRENT_LIST_DIR}/linux" CACHE STRING "")

    set(project_dir "${CMAKE_CURRENT_LIST_DIR}/../../")
    file(GLOB project_modules ${project_dir}/projects/*)
    list(
        APPEND
            CMAKE_MODULE_PATH
            ${project_dir}/kernel
            ${project_dir}/tools/seL4/cmake-tool/helpers/
            ${project_dir}/tools/seL4/elfloader-tool/
            ${project_modules}
    )
    include(application_settings)
    
    include(${CMAKE_CURRENT_LIST_DIR}/easy-settings.cmake)

    set(KernelArch "arm" CACHE STRING "" FORCE)
    if(AARCH64)
        set(KernelSel4Arch "aarch64" CACHE STRING "" FORCE)
    else()
        message(FATAL_ERROR "Not configred as Aarch64")
    endif()
    set(KernelArmHypervisorSupport ON CACHE BOOL "" FORCE)
    set(KernelRootCNodeSizeBits 18 CACHE STRING "" FORCE)
    set(KernelArmVtimerUpdateVOffset OFF CACHE BOOL "" FORCE)
    set(KernelArmDisableWFIWFETraps ON CACHE BOOL "" FORCE)

    set(CapDLLoaderMaxObjects 90000 CACHE STRING "" FORCE)

    set(CAmkESCPP OFF CACHE BOOL "" FORCE)

    ApplyCommonReleaseVerificationSettings(${RELEASE} FALSE)

    if(NOT MANUAL_VM_APP)
        message(
            FATAL_ERROR
            "MANUAL_VM_APP is not defined. PASS MANUAL_VM_APP to specify the VM application to build e.g. vm_minimal"
        )
    endif()

    include("${CMAKE_CURRENT_LIST_DIR}/apps/Arm/${MANUAL_VM_APP}/settings.cmake")

    correct_platform_strings()

    find_package(seL4 REQUIRED)
    sel4_configure_platform_settings()
    sel4_import_kernel()

    find_package(elfloader-tool REQUIRED)
    ApplyData61ElfLoaderSettings(${KernelARMPlatform} ${KernelSel4Arch})
    elfloader_import_project()

    if(NUM_NODES MATCHES "^[0-9]+$")
        set(KernelMaxNumNodes ${NUM_NODES} CACHE STRING "" FORCE)
    else()
        set(KernelMaxNumNodes 1 CACHE STRING "" FORCE)
    endif()


endif()
