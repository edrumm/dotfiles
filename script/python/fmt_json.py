import argparse, json, logging, os


"""
fmt_json.py
Reformat a minified JSON file to readable JSON

python fmt_json.py -p <path to file> [-i <indent level>][--sort-keys <sort JSON file by keys>]
"""


def run(path, indent_space=2, sort=False):
    if os.path.exists(path):
        try:
            if os.path.splitext(path)[1] != ".json":
                raise IOError("Input file must be a .json file")

            data = None
            with open(path, "r+") as f:
                logging.info(f"reading file: {path}")
                data = json.load(f)

                logging.info(f"dumping to file: {path}")
                f.seek(0)
                f.write(json.dumps(data, indent=indent_space, sort_keys=sort))

        except Exception as e:
            logging.error(str(e))


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "-p",
        dest="path",
        help="Path to file",
        required=True,
        type=str
    )
    parser.add_argument(
        "-i",
        dest="indent_space",
        help="Amount of spaces to indent",
        required=False,
        default=2,
        type=int
    )
    parser.add_argument(
        "--sort-keys",
        dest="sort",
        help="Sort object keys",
        required=False,
        default=False,
        type=bool
    )

    args = parser.parse_args()
    run(args.path, args.indent_space, args.sort)    
