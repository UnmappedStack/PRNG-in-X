/*       ======= Linear Congruential Generator (LCG) in Rust =======
 *           Written by Jake Steinburger (UnmappedStack) in 2024.
 *   Copyright under the MIT license. See the GitHub repo for more info.
 *            LCG is a pseudo-random number generator, or PRNG.
 */

use std::time::{SystemTime, UNIX_EPOCH};

const MOD: u64 = 2147483648;
const MUL: u64 = 1103515245;
const INC: u64 = 12345;

/* Summary:
 *    Generate a new random number based on a previous one.
 * Args:
 *    prev: The previous number.
 * Return:
 *    The new random number.
 */
fn gen_num(prev: u64) -> u64 {
    (MUL * prev + INC) % MOD
}

/* Summary:
 *    Seed a PRNG with the current time (UNIX epoch) then generate 10 random values each based on the previous one.
 * Args:
 *    None.
 * Return:
 *    Status code, 0 for success.
 */
fn main() {
    let mut current_val = SystemTime::now().duration_since(UNIX_EPOCH).unwrap().as_secs();
    for i in 0..10 {
        current_val = gen_num(current_val);
        println!("{}: Generated number: {}", i, current_val);
    }
}
