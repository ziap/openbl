#!/usr/bin/env python

import os

resources_h = open('src/resources.h', 'w')
resources_c = open('src/resources.c', 'w')

resources_h.write('#ifndef RESOURCES_H\n')
resources_h.write('#define RESOURCES_H\n\n')
resources_c.write('#include "resources.h"\n\n')

def load_texts(dir):
    for shader in os.listdir('res/' + dir):
        file_name = dir + shader
        file = open('res/' + file_name)
        var_name = ''.join('_' if c in './' else c for c in file_name)

        content = '\n'.join('"%s\\n"' % i[:-1] for i in file.readlines()) 

        resources_h.write('extern const char* %s;\n' % var_name)
        resources_c.write('const char* %s = %s;\n' % (var_name, content))

        file.close()

    resources_h.write('\n')
    resources_c.write('\n')

load_texts('shaders/')

resources_h.write('#endif\n')

resources_h.close()
resources_c.close()

# TODO:
# - Load images using PIL
# - Combine multiple images into a single bitmap with offset information
# - Mipmap generation
# - Mesh loading ?? STL/OBJ format
