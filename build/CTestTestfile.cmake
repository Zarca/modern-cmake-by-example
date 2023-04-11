# CMake generated Testfile for 
# Source directory: /Users/zarca/Desktop/Projects/git/modern-cmake-by-example
# Build directory: /Users/zarca/Desktop/Projects/git/modern-cmake-by-example/build
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(test_1 "/Users/zarca/Desktop/Projects/git/modern-cmake-by-example/test/test.sh")
set_tests_properties(test_1 PROPERTIES  _BACKTRACE_TRIPLES "/Users/zarca/Desktop/Projects/git/modern-cmake-by-example/CMakeLists.txt;21;ADD_TEST;/Users/zarca/Desktop/Projects/git/modern-cmake-by-example/CMakeLists.txt;0;")
subdirs("answer")
subdirs("curl_wrapper")
subdirs("wolfram")
