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
            ${project_dir}/tools/cmake-tool/helpers/
            ${project_dir}/tools/elfloader-tool/
            ${project_modules}
    )
    set(SEL4_CONFIG_DEFAULT_ADVANCED ON)

    include(application_settings)
    include(${CMAKE_CURRENT_LIST_DIR}/easy-settings.cmake)

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

    set(KernelArmHypervisorSuppoprt ON CACHE BOOL "" FORCE)

    set(Sel4ArmAppAllowSettingsOverride OFF CACHE BOOL "Allow users to override configuration settings")
    if(NOT Sel4ArmAppAllowSettingsOverride)
        if(KernelPlatformQEMUArmVirt)
            set(SIMULATION ON CACHE BOOL "" FORCE)
        endif()

        if(SIMULATION)
            ApplyCommonSimulationSettings(${KernelSel4Arch})
        endif()

        if(KernelPlatformQEMUArmVirt)
            if(KernelArmExportPCNTUser AND KernelArmExportPTMRUser)
                set(Sel4testHaveTimer ON CACHE BOOL "" FORCE)
            else()
                set(Sel4testHaveTimer OFF CACHE BOOL "" FORCE)
            endif()
        endif()

        ApplyCommonReleaseVerificationSettings(FALSE FALSE)
    endif()
endif()
