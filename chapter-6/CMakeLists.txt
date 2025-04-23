
# Add source to this project's executable.
add_executable (chapter_6 
  main.cpp
  vk_engine.cpp
  vk_engine.h

  vk_loader.h
  vk_loader.cpp
)

set_property(TARGET chapter_6 PROPERTY CXX_STANDARD 23)
set_property(TARGET chapter_6 PROPERTY VS_DEBUGGER_WORKING_DIRECTORY $<TARGET_FILE_DIR:chapter_6>)

target_include_directories(chapter_6 PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}")

target_link_libraries(chapter_6 vkguide_shared vkbootstrap imgui fastgltf::fastgltf)

add_custom_command(TARGET chapter_6 POST_BUILD
   COMMAND ${CMAKE_COMMAND} -E copy $<TARGET_RUNTIME_DLLS:chapter_6> $<TARGET_FILE_DIR:chapter_6>
   COMMAND_EXPAND_LISTS
   )

include(../cmake/utils.cmake)

compile_shader(tex_image.frag)
compile_shader(gradient_color.comp)
compile_shader(sky.comp)
compile_shader(colored_triangle.frag)
compile_shader(colored_triangle.vert)
compile_shader(colored_triangle_mesh.vert)
compile_shader(mesh_pbr.frag)
compile_shader(mesh.vert)
add_custom_target(compile_shaders_ch6 DEPENDS 
    ${CMAKE_CURRENT_BINARY_DIR}/shaders/tex_image.frag.spv
    ${CMAKE_CURRENT_BINARY_DIR}/shaders/gradient_color.comp.spv
    ${CMAKE_CURRENT_BINARY_DIR}/shaders/sky.comp.spv
    ${CMAKE_CURRENT_BINARY_DIR}/shaders/colored_triangle.frag.spv
    ${CMAKE_CURRENT_BINARY_DIR}/shaders/colored_triangle.vert.spv
    ${CMAKE_CURRENT_BINARY_DIR}/shaders/colored_triangle_mesh.vert.spv
    ${CMAKE_CURRENT_BINARY_DIR}/shaders/mesh_pbr.frag.spv
    ${CMAKE_CURRENT_BINARY_DIR}/shaders/mesh.vert.spv
)
add_dependencies(chapter_6 compile_shaders_ch6)

file(COPY ${CMAKE_CURRENT_SOURCE_DIR}/../assets DESTINATION ${CMAKE_CURRENT_BINARY_DIR})