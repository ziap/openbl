#include "rainbow.h"

#include "imports.h"
#include "resources.h"
#include "shader.h"

void RainbowInit(Rainbow *rb) {
  rb->program = create_program(shaders_rainbow_vert, shaders_rainbow_frag);

  rb->vao = glCreateVertexArray();

  rb->u_resolution = glGetUniformLocation(rb->program, "u_resolution");
  rb->u_mouse = glGetUniformLocation(rb->program, "u_mouse");
  rb->u_time = glGetUniformLocation(rb->program, "u_time");
}

void RainbowUse(Rainbow *rb) {
  glUseProgram(rb->program);
  glBindVertexArray(rb->vao);
}

void RainbowUpdate(
  Rainbow *rb, int width, int height, float mouse_x, float mouse_y, float time
) {
  glUniform2f(rb->u_resolution, width, height);
  glUniform2f(rb->u_mouse, mouse_x, mouse_y);
  glUniform1f(rb->u_time, time);
}

void RainbowRender(Rainbow *rb) {
  (void)rb;
  glDrawArrays(GL_TRIANGLES, 0, 6);
}
