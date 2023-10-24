cmake_minimum_required(VERSION 3.9)
project(answer)
set(CMAKE_CXX_STANDARD 11)

SET(CMAKE_INSTALL_PREFIX ${PROJECT_BINARY_DIR}/install_dir/) # or you can cmake .. -DCMAKE_INSTALL_PREFIX=xxx 指定一个目录
SET(EXECUTABLE_OUTPUT_PATH ${PROJECT_BINARY_DIR}/bin)
#set(CMAKE_INSTALL_RPATH "${CMAKE_INSTALL_PREFIX}/lib") # it just will not work;
set(CMAKE_INSTALL_RPATH "$ORIGIN/../lib") # this is the standard dealing ways;
#[[
拆分了 CURL 和 WolframAlpha 相关代码到单独的子目录中，
其中分别创建了两个库目标：curl_wrapper 和 wolfram，
可以在本项目的其它地方 link。
#]]
add_subdirectory(answer)
add_subdirectory(curl_wrapper)
add_subdirectory(wolfram)

#配置项
option(USE_TEST "User defined cmake config variable" ON)
configure_file(Config.h.in Config.h)


add_executable(answer_app main.cpp)
# 这个cmake配置头文件是生成在Build路径中
target_include_directories(answer_app PUBLIC "${PROJECT_BINARY_DIR}" )

target_link_libraries(answer_app answer)

#test ; use `make test` to check the build result, both elf files and shell scripts can be tested 
ADD_TEST(test_1 ${PROJECT_SOURCE_DIR}/test/test.sh)
#ADD_TEST(test_2 ${PROJECT_BINARY_DIR}/bin/answer_app) # 交互式程序似乎无法通过测试
ENABLE_TESTING()

INSTALL(TARGETS answer_app
RUNTIME DESTINATION bin
)

INSTALL(FILES _COPYRIGHT README.md DESTINATION share/doc/)

INSTALL(PROGRAMS run_app.sh DESTINATION bin)

INSTALL(DIRECTORY doc/ DESTINATION share/doc/)

INSTALL(FILES ${PROJECT_BINARY_DIR}/Config.h DESTINATION include/)

