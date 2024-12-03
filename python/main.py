"""
     ======= Linear Congruential Generator (LCG) in Python =======
          Written by Jake Steinburger (UnmappedStack) in 2024.
  Copyright under the MIT license. See the GitHub repo for more info.
           LCG is a pseudo-random number generator, or PRNG.
"""

import time

MOD = 2147483648
MUL = 1103515245
INC = 12345

"""
Summary:
   Generate a new random number based on a previous one.
Args:
   prev: The previous number.
Return:
   The new random number.
"""
def gen_num(current_val):
    return (MUL * current_val + INC) % MOD

"""
Summary:
   Seed a PRNG with the current time (UNIX epoch) then generate 10 random values each based on the previous one.
Args:
   None.
Return:
   Status code, 0 for success.
"""
def main():
    current_val = int(time.time())
    for i in range(10):
        current_val = gen_num(current_val)
        print(f"{i}: Generated number: {current_val}")
    return 0

if __name__ == "__main__":
    exit(main())
