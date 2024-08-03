import logging, os, shutil


src_path = "C:/Program Files (x86)/Vim/_vimrc"
dest_path = "D:/dev/vimscripts/vim-config/_vimrc"


if __name__ == "__main__":
    if not os.path.exists(src_path):
        logging.error(f"Could not find _vimrc at {src_path}")
    elif not os.path.exists(dest_path):
        logging.error(f"Could not find vim-config repo at {dest_path}")
    else:
        try:
            shutil.copy2(src_path, dest_path)

        except Exception as e:
            logging.error(str(e))
