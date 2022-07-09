#!/usr/bin/env python3
import os
import sys

work_dir = ''


def get_file_content(file_path):
    try:
        lines = open(os.path.join(
            work_dir,
            file_path.replace('\n', '')
        ), 'r').readlines()
    except BaseException:
        print("'{}' not found".format(file_path))
        exit(1)
    content = ''
    for line in lines:
        if 'include' in line:
            file_name = line.split('include')[-1].replace(' ', '').replace('\n', '')
            include_content = \
                get_file_content(file_name)
            content += '; include from: ' + file_name + '\n' + ';-------------------------------\n' + include_content + ';-------------------------------\n' +  '; end of include: ' + file_name + '\n\n'
        else:
            content += line
    return content


def main(argv):
    global work_dir
    work_dir = os.popen('pwd').readline().replace('\n', '')
    src_file_path = os.path.join(work_dir, argv[1].split('/')[-1])
    content = get_file_content(src_file_path .split('/')[-1])
    include_name = src_file_path.split('/')[-1].replace('.scm', '') + '_included.scm'
    tar_file = open(os.path.join(
        work_dir,
        include_name
    ), 'w')
    tar_file.write(content)
    print("generate {} successfully".format(include_name))


if __name__ == '__main__':
    main(sys.argv)
