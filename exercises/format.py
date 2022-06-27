#!/usr/bin/env python3
import os
import sys


def main(argv):
    path = argv[1] if argv[1][1] == '.' else './' + argv[1]
    path = path.replace('\n', '').replace(' ', '')
    os.chdir(os.popen('pwd').readline().replace('\n', '').replace(' ', ''))
    file = open(path, 'r')
    lines = file.readlines()
    file.close()
    output_info = []
    for i in range(len(lines)):
        count = 0
        while len(lines[i]) > 2 and lines[i][-2] == ' ':
            count += 1
            lines[i] = lines[i][: -2] + lines[i][-1]
        if count > 0:
            output_info.append('delete ' + str(count) + ' redundant spaces at line: ' + str(i))
    while len(lines) > 0 and lines[-1] == '\n':
        output_info.append('delete blank line at line: ' + str(len(lines)))
        lines = lines[:-1]
    file = open(path, 'w')
    for line in lines:
        file.write(line)
    file.close()
    for info in output_info:
        print(info)


if __name__ == '__main__':
    main(sys.argv)
