cmake_minimum_required(VERSION 3.16)

project(Visuals VERSION 0.4 LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

find_package(Qt6 COMPONENTS Quick REQUIRED)

set(PROJECT_SOURCES
    src/main.cpp
    src/algorithms/linearpfalgorithm.cpp
    src/algorithms/pfalgorithm.cpp
    src/objects/cell.cpp
    src/objects/field.cpp
    src/models/fieldmodel.cpp
    qml/qml.qrc
)

qt_add_executable(${PROJECT_NAME} ${PROJECT_SOURCES})

target_link_libraries(${PROJECT_NAME} PRIVATE Qt6::Quick)
