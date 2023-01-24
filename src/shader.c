#include "shader.h"

#include "imports.h"

static int compile_shader(const char *src, int type) {
  int shader = glCreateShader(type);
  glSetShaderSource(shader, src);
  glCompileShader(shader);

  if (!glGetShaderParameter(shader, GL_COMPILE_STATUS)) {
    puts("ERROR: Failed to compile shader");
    puts(src);
    glDeleteShader(shader);
    return 0;
  }

  return shader;
}

int create_program(const char *vertex_src, const char *fragment_src) {
  int program = glCreateProgram();
  int vertex_shader = compile_shader(vertex_src, GL_VERTEX_SHADER);
  int fragment_shader = compile_shader(fragment_src, GL_FRAGMENT_SHADER);

  glAttachShader(program, vertex_shader);
  glAttachShader(program, fragment_shader);

  glLinkProgram(program);
  glValidateProgram(program);

  glDeleteShader(vertex_shader);
  glDeleteShader(fragment_shader);

  return program;
}
