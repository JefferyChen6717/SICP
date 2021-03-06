#!/usr/bin/env python3
import os
import sys


def format_all(dir):
    os.chdir(dir)
    lines = os.popen('ls -l').readlines()
    for line in lines:
        splits = line.split(' ')
        if splits[0][0] == '-':
            format(dir, splits[-1].replace('\n', ''))
        elif splits[0][0] == 'd':
            format_all(os.path.join(dir, splits[-1].replace('\n', '')))


def format(dir, file_path):
    os.chdir(dir)
    file = open(file_path, 'r')
    lines = file.readlines()
    file.close()
    output_info = []
    for i in range(len(lines)):
        count = 0
        while len(lines[i]) > 1 and lines[i][-2] == ' ':
            count += 1
            lines[i] = lines[i][: -2] + lines[i][-1]
        if count > 0:
            output_info.append('delete ' + str(count) + ' redundant space(s) at line: ' + str(i))
    while len(lines) > 0 and lines[-1] == '\n':
        output_info.append('delete a blank line at line: ' + str(len(lines)))
        lines = lines[:-1]
    file = open(file_path, 'w')
    for line in lines:
        file.write(line)
    file.close()
    file_name = file_path.split('/')[-1]
    file_split = file_name.split('.')
    if len(file_split) > 2 and len(file_split[1]) == 1:
        os.rename(file_name, file_split[0] + '.0' + file_split[1] + '.scm')
    if len(output_info) > 0:
        print(file_name + ':')
        for info in output_info:
            print(info)
        print()

def main(argv):
    dir = os.popen('pwd').readline().replace('\n', '').replace(' ', '')
    if len(argv) < 2 or argv[1] == '-a':
        format_all(dir)
    else:
        format(dir, argv[1].replace('\n', ''))


if __name__ == '__main__':
    main(sys.argv)
