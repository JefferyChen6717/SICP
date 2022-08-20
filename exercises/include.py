#!/usr/bin/env python3
import os
import sys

work_dir = ''
project_dir = ''
lib_dir = ''


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
                get_lib_file(file_name)
            content += '; include from: ' + file_name + '\n' + ';-------------------------------\n' \
                + include_content + ';-------------------------------\n' +  '; end of include: ' + file_name + '\n\n'
        else:
            content += line
    return content


def get_lib_file(file_name):
    if os.path.exists(os.path.join(lib_dir, file_name.replace('\n', ''))):
        lines = open(os.path.join(
            lib_dir,
            file_name.replace('\n', '')
        ), 'r').readlines()
    else:
        lines = open(os.path.join(work_dir, file_name.replace('\n', '')))

    content = ''
    for line in lines:
        if 'include' in line:
            file_name = line.split('include')[-1].replace(' ', '').replace('\n', '')
            include_content = \
                get_lib_file(file_name)
            content += '; include from: ' + file_name + '\n' + ';-------------------------------\n' \
                + include_content + ';-------------------------------\n' +  '; end of include: ' + file_name + '\n\n'
        else:
            content += line
    return content


def get_project_root():
    global project_dir
    pwd = os.popen('pwd').readline().replace('\n', '')
    folders = pwd.split('/')
    while len(folders) > 0:
        if folders[-1] != 'SICP':
            del folders[-1]
        else:
            break
    project_dir = ''
    for folder in folders:
        project_dir += (folder + '/')
    global lib_dir
    lib_dir = project_dir + 'exercises/lib/'


def main(argv):
    global work_dir
    work_dir = os.popen('pwd').readline().replace('\n', '')
    get_project_root()
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
    if len (sys.argv) < 2:
        print('no input file, please check')
    else:
        main(sys.argv)
