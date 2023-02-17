# Install script for directory: /home/colored-dye/linux_sel4_manual/projects/seL4_projects_libs

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/colored-dye/linux_sel4_manual/build/staging")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Debug")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "TRUE")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/colored-dye/linux_sel4_manual/build/sel4_projects_libs/libsel4arm-vmm/cmake_install.cmake")
  include("/home/colored-dye/linux_sel4_manual/build/sel4_projects_libs/libsel4vchan/cmake_install.cmake")
  include("/home/colored-dye/linux_sel4_manual/build/sel4_projects_libs/libsel4dma/cmake_install.cmake")
  include("/home/colored-dye/linux_sel4_manual/build/sel4_projects_libs/libsel4bga/cmake_install.cmake")
  include("/home/colored-dye/linux_sel4_manual/build/sel4_projects_libs/libsel4keyboard/cmake_install.cmake")
  include("/home/colored-dye/linux_sel4_manual/build/sel4_projects_libs/libsel4pci/cmake_install.cmake")
  include("/home/colored-dye/linux_sel4_manual/build/sel4_projects_libs/libsel4vmmcore/cmake_install.cmake")

endif()

