SET(LIBRARY_OUTPUT_PATH ${PROJECT_BINARY_DIR}/lib)                                                                            
  2 add_library(wolfram STATIC alpha.cpp)
  3 target_include_directories(wolfram PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)
  4 
  5 # wolfram PRIVATE 地依赖 curl_wrapper
  6 target_link_libraries(wolfram PRIVATE curl_wrapper)
  7 INSTALL(TARGETS wolfram
  8 ARCHIVE DESTINATION lib_static)
