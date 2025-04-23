function(compile_shader shader)
    add_custom_command(
        OUTPUT  ${CMAKE_CURRENT_BINARY_DIR}/shaders/${shader}.spv
        COMMAND ${CMAKE_COMMAND} -E make_directory shaders
        COMMAND ${GLSLC} ${GLSLC_OPTIONS} ${CMAKE_CURRENT_SOURCE_DIR}/../shaders/${shader} -o ${CMAKE_CURRENT_BINARY_DIR}/shaders/${shader}.spv 
        DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/../shaders/${shader}
        COMMENT "Compiling shader"
        )
endfunction()

