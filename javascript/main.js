/*    ======= Linear Congruential Generator (LCG) in JavaScript =======
 *           Written by Jake Steinburger (UnmappedStack) in 2024.
 *   Copyright under the MIT license. See the GitHub repo for more info.
 *            LCG is a pseudo-random number generator, or PRNG.
 */

const MOD = 2147483648;
const MUL = 1103515245
const INC = 12345

/* Summary:
 *    Generate a new random number based on a previous one.
 * Args:
 *    prev: The previous number.
 * Return:
 *    The new random number.
 */
function genNum(prev) {
    return (MUL * prev + INC) % MOD;
}

/* Summary:
 *    Seed a PRNG with the current time (UNIX epoch) then generate 10 random values each based on the previous one.
 * Args:
 *    None.
 * Return:
 *    Status code, 0 for success.
 */
let currentVal = Date.now();
for (let i = 0; i < 10; i++) {
    currentVal = genNum(currentVal);
    console.log("%i: Generated number: %i", i, currentVal);
}
