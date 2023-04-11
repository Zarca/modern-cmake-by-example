cmake_minimum_required(VERSION 3.9)
project(answer)
set(CMAKE_CXX_STANDARD 11)

SET(CMAKE_INSTALL_PREFIX ${PROJECT_SOURCE_DIR}/install_dir)
SET(EXECUTABLE_OUTPUT_PATH ${PROJECT_BINARY_DIR}/bin)
set(CMAKE_INSTALL_RPATH "${CMAKE_INSTALL_PREFIX}/lib")
#[[
拆分了 CURL 和 WolframAlpha 相关代码到单独的子目录中，
其中分别创建了两个库目标：curl_wrapper 和 wolfram，
可以在本项目的其它地方 link。
#]]
add_subdirectory(answer)
add_subdirectory(curl_wrapper)
add_subdirectory(wolfram)

add_executable(answer_app main.cpp)
target_link_libraries(answer_app answer)

#test ; use `make test` to check the build result, both elf files and shell scripts can be tested 
ADD_TEST(test_1 ${PROJECT_SOURCE_DIR}/test/test.sh)
#ADD_TEST(test_2 ${PROJECT_BINARY_DIR}/bin/answer_app) # 交互式程序似乎无法通过测试
ENABLE_TESTING()

INSTALL(TARGETS answer_app
RUNTIME DESTINATION bin
)

INSTALL(FILES _COPYRIGHT README.md DESTINATION share/doc/cmake/app)

INSTALL(PROGRAMS run_app.sh DESTINATION bin)

INSTALL(DIRECTORY doc/ DESTINATION share/doc/cmake/app)

