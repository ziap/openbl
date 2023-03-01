#ifndef EXPORTS_H
#define EXPORTS_H

#define export __attribute__((visibility("default")))

export void game_init(void);
export void game_update(float);

export void resize(int, int);
export void update_mouse(float, float);

#endif
