# 指定构建此项目所需的CMake最低版本为3.16
cmake_minimum_required(VERSION 3.16)

# 设置项目名称为QtProject，版本为0.1，指定使用C++语言
# QtProject 可以使用 ${PROJECT_NAME} 变量来引用项目名称,该名称就是QtProject，可直接替换
# project(QtProject VERSION 0.1 LANGUAGES CXX) 
project(QtProjectApp VERSION 0.1 LANGUAGES CXX)

# 要求使用指定的C++标准
set(CMAKE_CXX_STANDARD_REQUIRED ON)
# 自动处理moc，uic和rcc等Qt工具
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTORCC ON)

# 打印变量值：
set(MY_VARIABLE "Hello CMake")
message(STATUS "MY_VARIABLE = ${MY_VARIABLE}")
message(WARNING "MY_VARIABLE WARNING = ${MY_VARIABLE}")

# 打印项目内置的变量值：
message(STATUS "CMAKE_SOURCE_DIR = ${CMAKE_SOURCE_DIR}")
message(STATUS "CMAKE_BINARY_DIR = ${CMAKE_BINARY_DIR}")
message(STATUS "CMAKE_CURRENT_SOURCE_DIR = ${CMAKE_CURRENT_SOURCE_DIR}")
message(STATUS "CMAKE_CURRENT_BINARY_DIR = ${CMAKE_CURRENT_BINARY_DIR}")
message(STATUS "CMAKE_VERSION = ${CMAKE_VERSION}")
# 打印环境变量值：
message(STATUS "PATH = $ENV{PATH}")
 

# 查找Qt6库，要求最低版本为6.5，并包含Quick组件，以后需要使用到其他Qt组件时可以在这里添加
find_package(Qt6 6.5 REQUIRED COMPONENTS Quick)
# 联想：以后自己制作的库，如何让别的项目调用？，也通过find_package来查找

# 设置Qt的标准项目设置
qt_standard_project_setup(REQUIRES 6.5)

# 设置包含的头文件路径
include_directories(
    ${CMAKE_CURRENT_SOURCE_DIR}/src/inherit
)

# 添加可执行文件的源代码路径
set(SRC_FILES
    src/inherit/DataManager.h  src/inherit/DataManager.cpp
)

# 可执行文件配置，可执行文件名称为QtProject，源文件为main.cpp
# 后面有添加的.cpp .h文件，也在此处添加
qt_add_executable(${PROJECT_NAME}
    main.cpp
    ${SRC_FILES} # 添加源代码文件
)

# ？如何在CMake文件中进行属性变量的打印
# 设置可执行文件的版本信息
# 打印${PROJECT_NAME}变量内容，和当前路径
# message(STATUS "Project Name: ${PROJECT_NAME}")
# message(STATUS "Current Path: ${CMAKE_CURRENT_SOURCE_DIR}")

# 为项目QtProject添加QML模块支持，QML的URI为QtProject，版本为1.0
# URI是qml模块的唯一标识符，当设置C++与qml交互时需要使用到
# QML_FILES指定了QML文件的路径
qt_add_qml_module(${PROJECT_NAME}
    URI QtProject
    VERSION 1.0
    # QML_FILES
    #     Main.qml
    RESOURCES res.qrc
)

# 设置其他平台的属性，macOS和Windows平台的属性
set_target_properties(${PROJECT_NAME} PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appQtProject
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

# 设置链接库，将Qt6::Quick库链接到可执行文件appQtProject
target_link_libraries(${PROJECT_NAME} PRIVATE 
    Qt6::Quick
    Qt6::Core
)

# 设置程序编译输出路径
message(STATUS "PROJECT_SOURCE_DIR = ${PROJECT_SOURCE_DIR}")
set(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/output)

# 安装配置
include(GNUInstallDirs)
install(TARGETS ${PROJECT_NAME}
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
