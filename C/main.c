/*        ======= Linear Congruential Generator (LCG) in C =======
 *           Written by Jake Steinburger (UnmappedStack) in 2024.
 *   Copyright under the MIT license. See the GitHub repo for more info.
 *            LCG is a pseudo-random number generator, or PRNG.
 */

#include <stdio.h>
#include <stddef.h>
#include <stdint.h>
#include <time.h>

#define MOD 2147483648
#define MUL 1103515245
#define INC 12345

/* Summary:
 *    Generate a new random number based on a previous one.
 * Args:
 *    prev: The previous number.
 * Return:
 *    The new random number.
 */
uint64_t gen_num(uint64_t prev) {
    return (MUL * prev + INC) % MOD;
}

/* Summary:
 *    Seed a PRNG with the current time (UNIX epoch) then generate 10 random values each based on the previous one.
 * Args:
 *    None, although _start may still pass some that aren't used.
 * Return:
 *    Status code, 0 for success.
 */
int main() {
    uint64_t current_val = time(NULL);
    for (size_t i = 0; i < 10; i++) {
        current_val = gen_num(current_val);
        printf("%i: Generated number: %u\n", i, current_val);
    }
    return 0;
}
