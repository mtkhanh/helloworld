cmake_minimum_required(VERSION 3.15)
project(hello_world_project)

# Set C++ standard to C++14
set(CMAKE_CXX_STANDARD 14)

# Enable code coverage and debugging flags for debug build
set(CMAKE_BUILD_TYPE Debug)
set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} --coverage -O0 -g")

# Enable optimization flags for release build
set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -O3")

# Add main.cpp as the source file for the main executable
add_executable(main src/main.cpp)

# Add subdirectory for Google Test
add_subdirectory(libs/googletest)

# Enable testing
enable_testing()

add_executable(
  test_main
  tests/test_main.cpp
)
target_link_libraries(
  test_main
  GTest::gtest_main
)

include(GoogleTest)
gtest_discover_tests(test_main)

# Add custom target for generating code coverage reports using gcovr
add_custom_target(coverage
    COMMAND gcovr -r ${CMAKE_SOURCE_DIR} --html --html-details -o coverage/index.html
    WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
    COMMENT "Generating code coverage report"
)
