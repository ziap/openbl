#version 300 es

#ifdef GL_ES
precision highp float;
#endif

void main() {
  vec2 uv;
  int id = gl_VertexID;

  uv.x = (id % 2 != 0) ? 1.0 : -1.0;
  uv.y = ((id + 4) % 6 < 3) ? 1.0 : -1.0;

  gl_Position = vec4(uv, 0.0, 1.0);
}
