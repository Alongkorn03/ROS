# Install script for directory: /home/alongkorn/catkin_ws/src/ethzasl_icp_mapping/ethzasl_icp_mapper

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/alongkorn/catkin_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "RelWithDebInfo")
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

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ethzasl_icp_mapper/srv" TYPE FILE FILES
    "/home/alongkorn/catkin_ws/src/ethzasl_icp_mapping/ethzasl_icp_mapper/srv/CorrectPose.srv"
    "/home/alongkorn/catkin_ws/src/ethzasl_icp_mapping/ethzasl_icp_mapper/srv/GetBoundedMap.srv"
    "/home/alongkorn/catkin_ws/src/ethzasl_icp_mapping/ethzasl_icp_mapper/srv/GetMode.srv"
    "/home/alongkorn/catkin_ws/src/ethzasl_icp_mapping/ethzasl_icp_mapper/srv/LoadMap.srv"
    "/home/alongkorn/catkin_ws/src/ethzasl_icp_mapping/ethzasl_icp_mapper/srv/MatchClouds.srv"
    "/home/alongkorn/catkin_ws/src/ethzasl_icp_mapping/ethzasl_icp_mapper/srv/SetMode.srv"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ethzasl_icp_mapper/cmake" TYPE FILE FILES "/home/alongkorn/catkin_ws/build/ethzasl_icp_mapping/ethzasl_icp_mapper/catkin_generated/installspace/ethzasl_icp_mapper-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/alongkorn/catkin_ws/devel/include/ethzasl_icp_mapper")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/alongkorn/catkin_ws/devel/share/roseus/ros/ethzasl_icp_mapper")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/alongkorn/catkin_ws/devel/share/common-lisp/ros/ethzasl_icp_mapper")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/alongkorn/catkin_ws/devel/share/gennodejs/ros/ethzasl_icp_mapper")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python3" -m compileall "/home/alongkorn/catkin_ws/devel/lib/python3/dist-packages/ethzasl_icp_mapper")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages" TYPE DIRECTORY FILES "/home/alongkorn/catkin_ws/devel/lib/python3/dist-packages/ethzasl_icp_mapper")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/alongkorn/catkin_ws/build/ethzasl_icp_mapping/ethzasl_icp_mapper/catkin_generated/installspace/ethzasl_icp_mapper.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ethzasl_icp_mapper/cmake" TYPE FILE FILES "/home/alongkorn/catkin_ws/build/ethzasl_icp_mapping/ethzasl_icp_mapper/catkin_generated/installspace/ethzasl_icp_mapper-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ethzasl_icp_mapper/cmake" TYPE FILE FILES
    "/home/alongkorn/catkin_ws/build/ethzasl_icp_mapping/ethzasl_icp_mapper/catkin_generated/installspace/ethzasl_icp_mapperConfig.cmake"
    "/home/alongkorn/catkin_ws/build/ethzasl_icp_mapping/ethzasl_icp_mapper/catkin_generated/installspace/ethzasl_icp_mapperConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ethzasl_icp_mapper" TYPE FILE FILES "/home/alongkorn/catkin_ws/src/ethzasl_icp_mapping/ethzasl_icp_mapper/package.xml")
endif()

