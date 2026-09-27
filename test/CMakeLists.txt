add_subdirectory(gtest EXCLUDE_FROM_ALL)

add_executable(asteroids_tests main.cpp)
target_link_libraries(asteroids_tests PRIVATE GTest::gtest)

enable_testing()
add_test(NAME asteroids_tests COMMAND asteroids_tests)
