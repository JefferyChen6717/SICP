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
    for i in range(len(lines)):
        while len(lines[i]) > 2 and lines[i][-2] == ' ':
            lines[i] = lines[i][: -2] + lines[i][-1]
    while len(lines) > 0 and lines[-1] == '\n':
        lines = lines[:-1]
    file = open(path, 'w')
    for line in lines:
        file.write(line)


if __name__ == '__main__':
    main(sys.argv)
