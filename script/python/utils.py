import os


"""
    Common functions and vars for python scripts
"""


ENCODING = "utf-8"


def get_file_extension(path):
    return os.path.splitext(path)[1]
