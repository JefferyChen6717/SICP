#!/usr/bin/env python3
import os


root = '/Users/jeffery/Learning/Fund/SICP/exercises/'
os.chdir(root)
work_dirs = os.popen('ls -l').readlines()
for work_dir in work_dirs:
    if work_dir[0] == 'd':
        work_dir = work_dir.split(' ')[-1].replace('\n', '')
        files = os.listdir(os.path.join(root, work_dir))
        for file in files:
            if '_included.scm' in file:
                print('remove ' + os.path.join(work_dir, file) + ' successfully')
                os.remove(os.path.join(root, work_dir, file))
