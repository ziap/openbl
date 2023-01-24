#ifndef IMPORTS_H
#define IMPORTS_H

#define NULL (const void*)0
#define offsetof(t, d) __builtin_offsetof(t, d)
#define sqrtf(x) __builtin_sqrtf(x)

#define GL_DEPTH_TEST 0x0B71
#define GL_FLOAT 0x1406
#define GL_COLOR_BUFFER_BIT 0x4000
#define GL_DEPTH_BUFFER_BIT 0x0100
#define GL_TRIANGLES 0x0004
#define GL_FRAGMENT_SHADER 0x8B30
#define GL_VERTEX_SHADER 0x8B31
#define GL_COMPILE_STATUS 0x8B81
#define GL_ARRAY_BUFFER 0x8892
#define GL_DYNAMIC_DRAW 0x88E8

#ifndef __cplusplus
typedef enum { false, true } bool;
#endif

extern int puts(const char*);

extern int glCreateBuffer(void);
extern int glCreateVertexArray(void);
extern int glCreateShader(int);
extern int glCreateProgram(void);
extern int glGetUniformLocation(int, const char*);
extern int glGetShaderParameter(int, int);
extern void glViewport(int, int, int, int);
extern void glSetShaderSource(int, const char*);
extern void glCompileShader(int);
extern void glDeleteShader(int);
extern void glAttachShader(int, int);
extern void glLinkProgram(int);
extern void glValidateProgram(int);
extern void glEnable(int);
extern void glUseProgram(int);
extern void glBindBuffer(int, int);
extern void glBindVertexArray(int);
extern void glEnableVertexAttribArray(int);
extern void glBufferData(int, int, const void*, int);
extern void glVertexAttribPointer(int, int, int, bool, int, const void*);
extern void glClear(int);
extern void glBufferSubData(int, int, int, void*);
extern void glUniform2f(int, float, float);
extern void glUniform1f(int, float);
extern void glUniform1i(int, int);
extern void glDrawArrays(int, int, int);

#endif
