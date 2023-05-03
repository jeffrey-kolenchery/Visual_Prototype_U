cmake_minimum_required(VERSION 3.5)

project(qml VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

#find_package(Qt6 6.4 REQUIRED COMPONENTS Quick)
find_package(Qt6 6.4 REQUIRED COMPONENTS Quick Multimedia)


qt_standard_project_setup()

set(CMAKE_AUTORCC ON)

qt_add_executable(appqml
    src.qrc
    main.cpp
)


qt_add_qml_module(appqml
    URI qml
    VERSION 1.0
    QML_FILES Main.qml
src.qrc
)




set_target_properties(appqml PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appqml
    PRIVATE Qt6::Quick
    Qt6::Multimedia
)

install(TARGETS appqml
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})
