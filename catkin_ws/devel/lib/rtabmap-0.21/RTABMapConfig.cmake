include(CMakeFindDependencyMacro)

# Mandatory dependencies
find_dependency(OpenCV COMPONENTS core calib3d imgproc highgui stitching photo video OPTIONAL_COMPONENTS aruco xfeatures2d nonfree gpu cudafeatures2d)

if(EXISTS "${CMAKE_CURRENT_LIST_DIR}/RTABMap_guiTargets.cmake")
    find_dependency(PCL 1.7 COMPONENTS common io kdtree search surface filters registration sample_consensus segmentation visualization)
    
    if(5 EQUAL 6)
        find_dependency(Qt6 COMPONENTS Widgets Core Gui OpenGL)
    elseif(5 EQUAL 5)
        find_dependency(Qt5 COMPONENTS Widgets Core Gui OpenGL)
    else() # Qt4
        find_dependency(Qt4 COMPONENTS QtCore QtGui)
    endif()
    set(RTABMap_QT_VERSION 5)
ELSE()
    find_dependency(PCL 1.7 COMPONENTS common io kdtree search surface filters registration sample_consensus segmentation)
ENDIF()
set(RTABMap_DEFINITIONS ${PCL_DEFINITIONS})
add_definitions(${RTABMap_DEFINITIONS}) # To include -march=native if set

# Optional dependencies
IF(EXISTS "${CMAKE_CURRENT_LIST_DIR}/Modules")
    list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/Modules")
ENDIF()

IF(1)
    IF(WIN32)
        find_dependency(RealSense2)
    ELSE()
        find_dependency(realsense2)
    ENDIF()
ENDIF()

IF(0)
    IF(WIN32)
        find_dependency(K4A)
    ELSE()
        find_dependency(k4a)
        find_dependency(k4arecord)
    ENDIF()
ENDIF()

IF(0)
 find_dependency(depthai 2)
ENDIF()

IF(1)
  find_dependency(octomap)
ENDIF()

IF(0)
  find_dependency(grid_map_core)
ENDIF()

IF(0)
  find_dependency(Python3 COMPONENTS Interpreter Development NumPy)
ENDIF()

# Provide those for backward compatibilities (e.g., catkin requires them to propagate dependencies)
set(RTABMap_INCLUDE_DIRS "")
set(RTABMap_LIBRARIES "")
set(RTABMap_TARGETS "")

set(_RTABMap_supported_components utilite core gui)

foreach(_comp ${_RTABMap_supported_components})
  if(EXISTS "${CMAKE_CURRENT_LIST_DIR}/RTABMap_${_comp}Targets.cmake")
    include("${CMAKE_CURRENT_LIST_DIR}/RTABMap_${_comp}Targets.cmake")
    set(RTABMap_${_comp}_FOUND True)
    set(RTABMap_TARGETS
      ${RTABMap_TARGETS}
      rtabmap::${_comp})
    get_target_property(RTABMap_${_comp}_INCLUDE_DIRS rtabmap::${_comp} INTERFACE_INCLUDE_DIRECTORIES)
    get_target_property(RTABMap_${_comp}_LIBRARIES rtabmap::${_comp} INTERFACE_LINK_LIBRARIES)
    set(RTABMap_INCLUDE_DIRS 
      ${RTABMap_INCLUDE_DIRS}
      ${RTABMap_${_comp}_INCLUDE_DIRS})
    set(RTABMap_LIBRARIES 
      ${RTABMap_LIBRARIES}
      rtabmap::${_comp})
    if(RTABMap_${_comp}_LIBRARIES)
      set(RTABMap_LIBRARIES 
        ${RTABMap_LIBRARIES}
        ${RTABMap_${_comp}_LIBRARIES})
    endif()
  else()
    set(RTABMap_${_comp}_FOUND False)
  endif()
endforeach()

include("${CMAKE_CURRENT_LIST_DIR}/RTABMapTargets.cmake")

foreach(_comp ${RTABMap_FIND_COMPONENTS})
  if (NOT ";${_RTABMap_supported_components};" MATCHES ";${_comp};")
    set(RTABMap_${_comp}_FOUND False)
    if(${RTABMap_FIND_REQUIRED_${_comp}})
      set(RTABMap_FOUND False)
      set(RTABMap_NOT_FOUND_MESSAGE "Unsupported or not found required component: ${_comp}")
    endif()
  endif()
endforeach()
