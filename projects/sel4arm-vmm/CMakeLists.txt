cmake_minimum_required(VERSION 3.7.2)
include(settings.cmake)
project(sel4arm-vmm-manual C CXX ASM)

if(AppArch STREQUAL "Arm")
    # Set up environment
    find_package(sel4_projects_libs REQUIRED)
    sel4_projects_libs_import_libraries()
else()
    message(FATAL_ERROR "Unsupported")
endif()

add_subdirectory("apps/${AppArch}/${MANUAL_VM_APP}")

# GenerateManualRootserver()
