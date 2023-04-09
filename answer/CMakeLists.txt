SET(LIBRARY_OUTPUT_PATH ${PROJECT_BINARY_DIR}/lib)
add_library(answer STATIC answer.cpp)
target_include_directories(answer PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)
# libanswer 改成直接使用 wolfram 库提供的 API，无需关心 CURL
target_link_libraries(answer PRIVATE wolfram)
INSTALL(TARGETS answer 
        ARCHIVE DESTINATION lib_static)
INSTALL(DIRECTORY include/ DESTINATION include/)  
