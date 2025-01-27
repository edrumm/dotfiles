import os, sys
from datetime import datetime
from zipfile import ZipFile, ZIP_DEFLATED


WIN_SRC_PATH = "C:\\Users\\esd06"

DATA_SRC_PATH = "D:\\"

BACKUP_PATH = os.path.join(DATA_SRC_PATH, "backup")

BACKUP_TIMESTAMP = datetime.now().strftime("%d-%m-%Y_%H-%M-%S")

BACKUP_DEST = os.path.join(BACKUP_PATH, f"{BACKUP_TIMESTAMP}_bu.zip")

IGNORE_EXTENSIONS = [
    ".exe", 
    ".zip", 
    ".tmp", 
    ".wav.asd", 
    ".lesshst", 
    ".swp", 
    ".recent",
    ".dat.LOG1",
    ".dat.LOG2",
    ".regtrans-ms",
    ".TM.blf",
    ".DAT"
]

IGNORE_DIRS = [
    ".git",
    "node_modules",
    "OneDrive",
    "backup",
    "dev",
    "SteamLibrary",
    "GGD Modern and Massive",
    "GOG Galaxy",
    "musikcube_win32_0.51.0",
    "$RECYCLE.BIN",
    "Music",
    ".android",
    ".cache",
    ".config",
    ".docker",
    ".dotnet",
    ".gradle",
    ".idlerc",
    ".jdks",
    ".ms-ad",
    ".nuget",
    ".prefs",
    ".templateengine",
    ".thumbnails",
    ".vscode",
    "ansel",
    "AppData",
    "Contacts",
    "Desktop",
    f"{WIN_SRC_PATH}\\Documents",
    "Downloads",
    "Dropbox",
    "Favorites",
    "go",
    "Links",
    "Music",
    "node_modules",
    "OneDrive",
    "Postman",
    "Saved Games",
    "Searches",
    "Videos",
    "vimfiles",
    ".runtime",
    "music",
    "managed plugins",
    "bin"
]


def add_misc_files(file_paths, archive: ZipFile):
    """ TODO """
    pass


def add_misc_dirs(dirs, archive: ZipFile):
    """ TODO """
    pass


"""
TODO - improve sys.stdout.write call
TODO - handle permission errors better
"""
def backup_all_to_zip(root_path, drive, archive: ZipFile):
    for root, dirs, files in os.walk(root_path):
        dirs[:] = [d for d in dirs if d not in IGNORE_DIRS]

        for file in files:
            path = os.path.join(root, file)

            if not any(path.endswith(ext) for ext in IGNORE_EXTENSIONS):
                sys.stdout.write(f"\rARCHIVING: {path}             ")
                sys.stdout.flush()
                archive.write(path, path.replace(f"{drive}:", drive))


if __name__ == "__main__":
    try:
        archive = ZipFile(BACKUP_DEST, mode="w", compression=ZIP_DEFLATED)

        backup_all_to_zip(DATA_SRC_PATH, "D", archive)
        backup_all_to_zip(WIN_SRC_PATH, "C", archive)

        archive.close()

        print("\n===============================================================")
        print(f"CREATED ZIP AT {BACKUP_DEST}")

    except Exception as e:
        print(e.with_traceback(), file=sys.stderr)
