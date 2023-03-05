import hashlib
import time
import numpy as np
from pprint import pprint
from optparse import OptionParser


parser = OptionParser()
parser.add_option("-d","--difficulty",dest="difficulty",help="diffuclty for for Proof of Work",default=1,type=float)
parser.add_option("-t","--timedelta",dest="timedelta",help="time between each hash",default=0.01)
parser.add_option("-v","--verbose",dest="verbose",help="verbose-mode",default=0)

options,_= parser.parse_args()

options = vars(options)


difficulty = int(options["difficulty"])
 
timedelta = options["timedelta"]

verbose = int(options["verbose"])

if timedelta == "None" or 0:
   timedelta = 0 
else:
    timedelta = float(timedelta)

bits = difficulty * "0"

start = 0
stop = 0
stats = {
    "found" : 0,
    "hashes" : 0,
}


RED = '\033[91m'
DEFAULT = '\033[0m'

def print_red(num : str):
    end = 0
    for idx,char in enumerate(num):
        if char != "0":
           end = idx
           break
    print(f"{RED}{num[:end]}{DEFAULT}{num[end:]}")

def calc_stats():
    stop = time.time()
    stats["elapsed_sec"] = round(stop - start,3)
    if stats["found"] == 0:
        stats["sec_per_found"] = None
        stats["hashes_per_found"] = None
    else:
        stats["sec_per_found"] =  stats["elapsed_sec"] / stats["found"]
        stats["hashes_per_found"] = int(stats["hashes"]  / stats["found"])
    stats["difficulty"] = bits
    stats["should_hash_per_found"] = 16**difficulty

    
    print(f"""
            \n
            ------------------------------------------
            {RED}Difficulty:\t\t{bits}{DEFAULT}
            Elapsed-Sec:\t{stats["elapsed_sec"]}
            {RED}Total-Hashes:\t{stats['hashes']}{DEFAULT}
            Hashes-per-found:\t{stats["hashes_per_found"]}
            {RED}Should-hash-found\t{stats['should_hash_per_found']}{DEFAULT}
            ------------------------------------------
          """)

start = time.time()
while 1:
    try:
        rand = str(np.random.randint(0,10_000_000)).encode("utf-8")
        num = hashlib.sha256(rand).hexdigest()
        if verbose == 0:
            print_red(num)
        if num.startswith(bits):
            stats["found"] += 1
            time.sleep(1)
        stats["hashes"] += 1
        time.sleep(timedelta)

    except KeyboardInterrupt:
        calc_stats() 
        exit(0)