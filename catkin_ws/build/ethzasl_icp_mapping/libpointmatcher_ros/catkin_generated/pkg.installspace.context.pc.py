# generated from catkin/cmake/template/pkg.context.pc.in
CATKIN_PACKAGE_PREFIX = ""
PROJECT_PKG_CONFIG_INCLUDE_DIRS = "${prefix}/include".split(';') if "${prefix}/include" != "" else []
PROJECT_CATKIN_DEPENDS = "roscpp;sensor_msgs;nav_msgs;tf;tf_conversions;eigen_conversions;libpointmatcher".replace(';', ' ')
PKG_CONFIG_LIBRARIES_WITH_PREFIX = "-lpointmatcher_ros".split(';') if "-lpointmatcher_ros" != "" else []
PROJECT_NAME = "libpointmatcher_ros"
PROJECT_SPACE_DIR = "/home/alongkorn/catkin_ws/install"
PROJECT_VERSION = "0.9.6"
