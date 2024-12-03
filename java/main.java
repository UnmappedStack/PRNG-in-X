/*       ======= Linear Congruential Generator (LCG) in Java =======
 *           Written by Jake Steinburger (UnmappedStack) in 2024.
 *   Copyright under the MIT license. See the GitHub repo for more info.
 *            LCG is a pseudo-random number generator, or PRNG.
 */

class main {
    static long MOD = 2147483648L;
    static long MUL = 1103515245L;
    static long INC = 12345L;
    
    /* Summary:
     *    Generate a new random number based on a previous one.
     * Args:
     *    prev: The previous number.
     * Return:
     *    The new random number.
     */
    static long genNum(long prev) {
        return (MUL * prev + INC) % MOD;
    }
    
    /* Summary:
     *    Seed a PRNG with the current time (UNIX epoch) then generate 10 random values each based on the previous one.
     * Args:
     *    None.
     * Return:
     *    Status code, 0 for success.
     */
    public static void main(String[] args) {
        long currentVal = System.currentTimeMillis() / 1000L;
        for (int i = 0; i < 10; i++) {
            currentVal = genNum(currentVal);
            System.out.printf("%d: Generated number: %d%n", i, currentVal);
        }
    }
};
