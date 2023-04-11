SET(LIBRARY_OUTPUT_PATH ${PROJECT_BINARY_DIR}/lib)
add_library(curl_wrapper SHARED curl_wrapper.cpp)
target_include_directories(curl_wrapper
                           PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)
target_link_libraries(curl_wrapper curl)
INSTALL(TARGETS curl_wrapper
LIBRARY DESTINATION lib)
INSTALL(DIRECTORY include/curl_wrapper DESTINATION include/)  
