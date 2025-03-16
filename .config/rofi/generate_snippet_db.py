#!/usr/bin/env python3
import argparse
import os
import sqlite3
from pathlib import Path

parser = argparse.ArgumentParser(description="Generate the snippets db")
parser.add_argument(
    "-d",
    "--destination",
    help="destination folder for the snippets db",
    default=Path(__file__).parent,
)
parser.add_argument(
    "-s",
    "--source",
    help="source folder for the snippets",
    default=Path.home() / "snippets",
)
parser.add_argument("-v", "--verbose", help="enable verbose mode", action="store_true")
args = parser.parse_args()
verbose = args.verbose


def log(*args, **kwargs):
    if verbose:
        print(*args, **kwargs)


destination_folder = args.destination
log("(destination_folder)", (destination_folder))

# create the database
conn = sqlite3.connect(os.path.join(destination_folder, "snippets.db"))
c = conn.cursor()

# create table
c.execute("DROP TABLE IF EXISTS snippets")
c.execute("CREATE TABLE snippets (name TEXT, category TEXT, content TEXT)")

# fill the table
for root, dirs, files in os.walk(args.source):
    category = root.removeprefix(f"{args.source}/").replace("/", ".")
    for file in files:
        with open(os.path.join(root, file), "r") as f:
            content = f.read()
            log("row", (file, category, content))
            c.execute("INSERT INTO snippets VALUES (?,?,?)", (file, category, content))

# commit and close
conn.commit()
conn.close()
