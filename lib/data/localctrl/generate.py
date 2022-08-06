import subprocess
import os
import os.path
from os import path

# ensure IDF_PATH exists
idf_path = os.environ["IDF_PATH"]

if (not path.exists(idf_path)):
  print(f"IDF_PATH ({idf_path}) environment variable does not exists or is not valid")
  exit -1

# switch working directory
abspath = os.path.abspath(__file__)
dname = os.path.dirname(abspath)
os.chdir(dname)

# search for all required proto files
local_ctrl = path.join(idf_path, "components/esp_local_ctrl/proto")
protocom = path.join(idf_path, "components/protocomm/proto")

proto_folder = [protocom, local_ctrl]
proto_files = []

print("Compile file:")
for folder in proto_folder:
  for proto_file in [f for f in os.listdir(folder) if f.endswith(".proto")]:
    proto_files.append(proto_file)
    print(f"  - {path.join(folder, proto_file)}")

# run protoc executable
args = [
    "protoc.exe",
    "--dart_out=.",
    *[f"--proto_path={f}" for f in proto_folder],
    *[f for f in proto_files],
    "--plugin=protoc_plugin.exe"
]

process = subprocess.run(args);
exit (process.returncode)

