# Generated from: catkin_simple/cmake/catkin_simple-extras.cmake.em

if(_CATKIN_SIMPLE_EXTRAS_INCLUDED_)
  return()
endif()
set(_CATKIN_SIMPLE_EXTRAS_INCLUDED_ TRUE)

include(CMakeParseArguments)

# cmake dir in develspace
set(catkin_simple_CMAKE_DIR "/home/kittiwut/tutorial_ws/src/catkin_simple/cmake")

macro(catkin_simple)
  # Arguments
  # ALL_DEPS_REQUIRED -- Add the "REQUIRED" flag when calling
  #                      FIND_PACKAGE() for each dependency
  cmake_parse_arguments(cs_args "ALL_DEPS_REQUIRED" "" "" ${ARGN})

  if(TARGET ${PROJECT_NAME}_package)
    message(WARNING "Could not create target '${${PROJECT_NAME}_package}' for project ${PROJECT_NAME}, as it already exists.")
  endif()
  add_custom_target(${PROJECT_NAME}_package)
  set(${PROJECT_NAME}_TARGETS)
  set(${PROJECT_NAME}_LIBRARIES)

  find_package(catkin REQUIRED)
  # call catkin_package_xml() if it has not been called before
  if(NOT _CATKIN_CURRENT_PACKAGE)
    catkin_package_xml()
  endif()

  set(${PROJECT_NAME}_CATKIN_BUILD_DEPENDS)
  set(${PROJECT_NAME}_CATKIN_BUILD_DEPENDS_EXPORTED_TARGETS)
  foreach(dep ${${PROJECT_NAME}_BUILD_DEPENDS})
    # If this flag is defined, add the "REQUIRED" flag
    # to all FIND_PACKAGE calls
    if(cs_args_ALL_DEPS_REQUIRED)
      find_package(${dep} REQUIRED)
    else()
      find_package(${dep} QUIET)
    endif()

    if(${dep}_FOUND_CATKIN_PROJECT)
      list(APPEND ${PROJECT_NAME}_CATKIN_BUILD_DEPENDS ${dep})
      list(APPEND ${PROJECT_NAME}_CATKIN_BUILD_DEPENDS_EXPORTED_TARGETS ${${dep}_EXPORTED_TARGETS})
    endif()
  endforeach()

  # Let find_package(catkin ...) do the heavy lifting
  find_package(catkin REQUIRED COMPONENTS ${${PROJECT_NAME}_CATKIN_BUILD_DEPENDS})

  # add include directory if available
  set(${PROJECT_NAME}_LOCAL_INCLUDE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/include)
  if(NOT IS_DIRECTORY ${${PROJECT_NAME}_LOCAL_INCLUDE_DIR})
    set(${PROJECT_NAME}_LOCAL_INCLUDE_DIR)
  endif()
  include_directories(${${PROJECT_NAME}_LOCAL_INCLUDE_DIR} ${catkin_INCLUDE_DIRS})

  # perform action/msg/srv generation if necessary
  if(message_generation_FOUND_CATKIN_PROJECT)
    set(${PROJECT_NAME}_DO_MESSAGE_GENERATION FALSE)
    # add action files if available
    set(${PROJECT_NAME}_LOCAL_ACTION_DIR ${CMAKE_CURRENT_SOURCE_DIR}/action)
    if(NOT IS_DIRECTORY ${${PROJECT_NAME}_LOCAL_ACTION_DIR})
      set(${PROJECT_NAME}_LOCAL_ACTION_DIR)
    endif()
    if(${PROJECT_NAME}_LOCAL_ACTION_DIR)
      add_action_files(DIRECTORY action)
      set(${PROJECT_NAME}_DO_MESSAGE_GENERATION TRUE)
    endif()

    # add message files if available
    set(${PROJECT_NAME}_LOCAL_MSG_DIR ${CMAKE_CURRENT_SOURCE_DIR}/msg)
    if(NOT IS_DIRECTORY ${${PROJECT_NAME}_LOCAL_MSG_DIR})
      set(${PROJECT_NAME}_LOCAL_MSG_DIR)
    endif()
    if(${PROJECT_NAME}_LOCAL_MSG_DIR)
      add_message_files(DIRECTORY msg)
      set(${PROJECT_NAME}_DO_MESSAGE_GENERATION TRUE)
    endif()

    # add service files if available
    set(${PROJECT_NAME}_LOCAL_SRV_DIR ${CMAKE_CURRENT_SOURCE_DIR}/srv)
    if(NOT IS_DIRECTORY ${${PROJECT_NAME}_LOCAL_SRV_DIR})
      set(${PROJECT_NAME}_LOCAL_SRV_DIR)
    endif()
    if(${PROJECT_NAME}_LOCAL_SRV_DIR)
      add_service_files(DIRECTORY srv)
      set(${PROJECT_NAME}_DO_MESSAGE_GENERATION TRUE)
    endif()

    # generate messages if necessary
    if(${PROJECT_NAME}_DO_MESSAGE_GENERATION)
      # identify all build dependencies which contain messages
      set(${PROJECT_NAME}_MSG_PACKAGES)
      foreach(dep ${${PROJECT_NAME}_CATKIN_BUILD_DEPENDS})
        set(${PROJECT_NAME}_MSG_PACKAGE_FILE ${${dep}_DIR}/${dep}-msg-paths.cmake)
        if(EXISTS ${${PROJECT_NAME}_MSG_PACKAGE_FILE})
          list(APPEND ${PROJECT_NAME}_MSG_PACKAGES ${dep})
        endif()
      endforeach()
      generate_messages(DEPENDENCIES ${${PROJECT_NAME}_MSG_PACKAGES})
      # add additional exported targets coming from generate_messages()
      list(INSERT ${PROJECT_NAME}_CATKIN_BUILD_DEPENDS_EXPORTED_TARGETS 0 ${${PROJECT_NAME}_EXPORTED_TARGETS})
    endif()
  endif()
  
  # generate dynamic reconfigure files
  if(dynamic_reconfigure_FOUND_CATKIN_PROJECT)
    set(${PROJECT_NAME}_LOCAL_CFG_DIR ${CMAKE_CURRENT_SOURCE_DIR}/cfg)
    if(IS_DIRECTORY ${${PROJECT_NAME}_LOCAL_CFG_DIR})
      # create a list containing all the cfg files
      file(GLOB ${PROJECT_NAME}_LOCAL_CFG_FILES RELATIVE "${CMAKE_CURRENT_SOURCE_DIR}" "${${PROJECT_NAME}_LOCAL_CFG_DIR}/*.cfg")
      if(${PROJECT_NAME}_LOCAL_CFG_FILES)
        generate_dynamic_reconfigure_options(${${PROJECT_NAME}_LOCAL_CFG_FILES})
        # add build dep on gencfg
        list(APPEND ${PROJECT_NAME}_CATKIN_BUILD_DEPENDS_EXPORTED_TARGETS ${PROJECT_NAME}_gencfg)
      endif()
    endif()
  endif()
endmacro()

macro(cs_add_targets_to_package)
  add_dependencies(${PROJECT_NAME}_package ${ARGN})
  list(APPEND ${PROJECT_NAME}_TARGETS ${ARGN})
endmacro()

macro(cs_add_executable _target)
  if(${_target} STREQUAL ${PROJECT_NAME}_package)
    message(WARNING "Could not create executable with name '${_target}' as '${PROJECT_NAME}_package' is reserved for the top level target name for this project.")
  endif()
  cmake_parse_arguments(cs_add_executable_args "NO_AUTO_LINK;NO_AUTO_DEP" "" "" ${ARGN})
  add_executable(${_target} ${cs_add_executable_args_UNPARSED_ARGUMENTS})
  if(NOT cs_add_executable_args_NO_AUTO_LINK)
    target_link_libraries(${_target} ${catkin_LIBRARIES})
  endif()
  if(NOT cs_add_executable_args_NO_AUTO_DEP)
    if(NOT "${${PROJECT_NAME}_CATKIN_BUILD_DEPENDS_EXPORTED_TARGETS}" STREQUAL "")
      add_dependencies(${_target} ${${PROJECT_NAME}_CATKIN_BUILD_DEPENDS_EXPORTED_TARGETS})
    endif()
  endif()
  cs_add_targets_to_package(${_target})
endmacro()

macro(cs_add_library _target)
  if(${_target} STREQUAL ${PROJECT_NAME}_package)
    message(WARNING "Could not create library with name '${_target}' as '${PROJECT_NAME}_package' is reserved for the top level target name for this project.")
  endif()
  cmake_parse_arguments(cs_add_library "NO_AUTO_LINK;NO_AUTO_DEP;NO_AUTO_EXPORT" "" "" ${ARGN})
  add_library(${_target} ${cs_add_library_UNPARSED_ARGUMENTS})
  if(NOT cs_add_library_NO_AUTO_LINK)
    target_link_libraries(${_target} ${catkin_LIBRARIES})
  endif()
  if(NOT cs_add_library_NO_AUTO_DEP)
    if(NOT "${${PROJECT_NAME}_CATKIN_BUILD_DEPENDS_EXPORTED_TARGETS}" STREQUAL "")
      add_dependencies(${_target} ${${PROJECT_NAME}_CATKIN_BUILD_DEPENDS_EXPORTED_TARGETS})
    endif()
  endif()
  if(NOT cs_add_library_NO_AUTO_EXPORT)
    list(APPEND ${PROJECT_NAME}_LIBRARIES ${_target})
  endif()
  cs_add_targets_to_package(${_target})
endmacro()

macro(cs_install)
  # Install targets (exec's and lib's)
  foreach(_target ${${PROJECT_NAME}_TARGETS})
    get_target_property(${_target}_type ${_target} TYPE)
    message(STATUS "Marking ${${_target}_type} \"${_target}\" of package \"${PROJECT_NAME}\" for installation")
  endforeach()
  install(TARGETS ${${PROJECT_NAME}_TARGETS} ${ARGN}
    ARCHIVE DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
    LIBRARY DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
    RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
  )
  if(EXISTS ${${PROJECT_NAME}_LOCAL_INCLUDE_DIR})
    # Install include directory
    message(STATUS "Marking HEADER FILES in \"include\" folder of package \"${PROJECT_NAME}\" for installation")
    install(DIRECTORY ${${PROJECT_NAME}_LOCAL_INCLUDE_DIR}/
      DESTINATION ${CATKIN_GLOBAL_INCLUDE_DESTINATION}
      FILES_MATCHING PATTERN "*.h" PATTERN "*.hpp"
      PATTERN ".svn" EXCLUDE
    )
  endif()
  # Install shared content located in commonly used folders
  set(_shared_content_folders launch rviz urdf meshes maps worlds Media param)
  foreach(_folder ${_shared_content_folders})
    if(IS_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/${_folder})
      message(STATUS "Marking SHARED CONTENT FOLDER \"${_folder}\" of package \"${PROJECT_NAME}\" for installation")
      install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/${_folder}/
        DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}/${_folder}
      )
    endif()
  endforeach()
endmacro()

macro(cs_install_scripts)
  install(PROGRAMS ${ARGN} DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION})
endmacro()

macro(cs_export)
  cmake_parse_arguments(CS_PROJECT
    "" "" "INCLUDE_DIRS;LIBRARIES;CATKIN_DEPENDS;DEPENDS;CFG_EXTRAS"
    ${ARGN})

  set(${PROJECT_NAME}_CATKIN_RUN_DEPENDS)
  foreach(dep ${${PROJECT_NAME}_RUN_DEPENDS})
    find_package(${dep} QUIET)
    if(${dep}_FOUND_CATKIN_PROJECT)
      list(APPEND ${PROJECT_NAME}_CATKIN_RUN_DEPENDS ${dep})
    endif()
  endforeach()

  catkin_package(
    INCLUDE_DIRS ${${PROJECT_NAME}_LOCAL_INCLUDE_DIR} ${CS_PROJECT_INCLUDE_DIRS}
    LIBRARIES ${${PROJECT_NAME}_LIBRARIES} ${CS_PROJECT_LIBRARIES}
    CATKIN_DEPENDS ${${PROJECT_NAME}_CATKIN_RUN_DEPENDS} ${CS_PROJECT_CATKIN_DEPENDS}
    DEPENDS ${CS_PROJECT_DEPENDS}
    CFG_EXTRAS ${CS_PROJECT_CFG_EXTRAS}
  )
endmacro()
