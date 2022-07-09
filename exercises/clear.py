#!/usr/bin/env python3
import os
import sys


def clear(argv):
  root = os.popen('pwd').readline().replace('\n', '')
  root = os.path.join(root, argv[1].replace('\n', '') if len(argv) > 1 else '')
  os.chdir(root)
  work_dirs = os.popen('ls -l').readlines()
  for work_dir in work_dirs:
    if work_dir[0] == 'd':
      work_dir = work_dir.split(' ')[-1].replace('\n', '')
      files = os.listdir(os.path.join(root, work_dir))
      for file in files:
        if '_included.scm' in file:
          print('remove {} successfully'.format(os.path.join(work_dir, file)))
          os.remove(os.path.join(root, work_dir, file))
    else:
      if '_included.scm' in work_dir:
        work_dir = work_dir.split(' ')[-1].replace('\n', '')
        print('remove {} successfully'.format(work_dir))
        os.remove(os.path.join(root, work_dir))


if __name__ == '__main__':
  clear(sys.argv)
