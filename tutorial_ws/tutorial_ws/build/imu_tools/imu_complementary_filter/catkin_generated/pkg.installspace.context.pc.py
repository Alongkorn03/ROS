# generated from catkin/cmake/template/pkg.context.pc.in
CATKIN_PACKAGE_PREFIX = ""
PROJECT_PKG_CONFIG_INCLUDE_DIRS = "${prefix}/include".split(';') if "${prefix}/include" != "" else []
PROJECT_CATKIN_DEPENDS = "geometry_msgs;message_filters;roscpp;sensor_msgs;std_msgs;tf".replace(';', ' ')
PKG_CONFIG_LIBRARIES_WITH_PREFIX = "-lcomplementary_filter".split(';') if "-lcomplementary_filter" != "" else []
PROJECT_NAME = "imu_complementary_filter"
PROJECT_SPACE_DIR = "/home/kittiwut/tutorial_ws/install"
PROJECT_VERSION = "1.2.5"
