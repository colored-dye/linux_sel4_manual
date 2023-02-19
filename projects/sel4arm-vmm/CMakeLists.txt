cmake_minimum_required(VERSION 3.7.2)

add_compile_definitions(CONFIG_ARM_HYPERVISOR_SUPPORT)
add_compile_definitions(GIC_V2_VCPUCTRL_PPTR)

include(settings.cmake)
project(sel4arm-vmm-manual C CXX)

find_package(seL4 REQUIRED)
find_package(sel4_projects_libs REQUIRED)
find_package(elfloader-tool REQUIRED)
find_package(util_libs REQUIRED)
find_package(seL4_libs REQUIRED)
find_package(sel4runtime REQUIRED)

# Set up environment
sel4_import_kernel()
sel4_import_libsel4()

if((NOT Sel4ArmAppAllowSettingsOverride) AND (KernelArchArm))
    ApplyData61ElfLoaderSettings(${KernelPlatform} ${KernelSel4Arch})
endif()
elfloader_import_project()

seL4_libs_import_libraries()
sel4_projects_libs_import_libraries()
util_libs_import_libraries()
sel4runtime_import_project()

add_subdirectory("apps/${AppArch}/${MANUAL_VM_APP}")

include(rootserver)
DeclareRootserver(manual-arm-qemu-vm)
