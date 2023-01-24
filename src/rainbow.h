#ifndef RAINBOW_H
#define RAINBOW_H

typedef struct {
  int u_resolution;
  int u_mouse;
  int u_time;

  int program;

  int vao;
} Rainbow;

extern void RainbowInit(Rainbow*);
extern void RainbowUpdate(Rainbow*, int, int, float, float, float);
extern void RainbowUse(Rainbow*);
extern void RainbowRender(Rainbow*);

#endif
