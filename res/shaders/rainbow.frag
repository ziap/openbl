#version 300 es

#ifdef GL_ES
precision highp float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

out vec4 frag_color;

void main() {
  vec2 uv = gl_FragCoord.xy / u_resolution;

  vec3 angle = u_time + uv.xyx + vec3(0, 2, 4);

  vec3 col1 = 0.5 + 0.5 * cos(angle);
  vec3 col2 = 0.5 + 0.5 * sin(angle);

  float t = length(gl_FragCoord.xy - u_mouse) / length(u_resolution);
  frag_color = vec4(mix(col1, col2, t), 1.0);
}
