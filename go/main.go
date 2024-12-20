/*        ======= Linear Congruential Generator (LCG) in Go =======
 *           Written by Jake Steinburger (UnmappedStack) in 2024.
 *   Copyright under the MIT license. See the GitHub repo for more info.
 *            LCG is a pseudo-random number generator, or PRNG.
 */

package main

import "fmt"
import "time"

const MOD = 2147483648;
const MUL = 1103515245;
const INC = 12345;

/* Summary:
 *    Generate a new random number based on a previous one.
 * Args:
 *    prev: The previous number.
 * Return:
 *    The new random number.
 */
func gen_num(prev uint64) uint64 {
	return (MUL * prev + INC) % MOD;
}

/* Summary:
 *    Seed a PRNG with the current time (UNIX epoch) then generate 10 random values each based on the previous one.
 * Args:
 *    None, although _start may still pass some that aren't used.
 * Return:
 *    Status code, 0 for success.
 */
func main() {
	current_val := uint64(time.Now().UnixNano());
	for i := 0; i < 10; i++ {
		current_val = gen_num(current_val);
		fmt.Print(i);
		fmt.Println(": Generated number:", current_val);
	}
}
