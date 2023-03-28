ASSIGNMENT NO: 01

Title:  Write an ALP to count no. of positive and negative numbers from the array.
Environment: 
OS: Fedora 17
Assembler:  NASM version 2.10.07
Linker: ld
Theory:
In computing, signed number representations are required to encode negative numbers in binary number systems.
The early days of digital computing were marked by a lot of competing ideas about both hardware technology and mathematics technology (numbering systems). One of the great debates was the format of negative numbers, with some of the era's most expert people having very strong and different opinions. One camp supported two's complement, the system that is dominant today. Another camp supported ones' complement, where any positive value is made into its negative equivalent by inverting all of the bits in a word. A third group supported "sign & magnitude" (sign-magnitude), where a value is changed from positive to negative simply by toggling the word's sign (high-order) bit.
In mathematics, negative numbers in any base are represented by prefixing them with a − sign. However, in computer hardware, numbers are represented in bit vectors only, without extra symbols. The four best-known methods of extending the binary numeral system to represent signed numbers are: sign-and-magnitude, ones' complement, two's complement, and excess-K. Some of the alternative methods use implicit instead of explicit signs, such as negative binary, using the base −2. Corresponding methods can be devised for other bases, whether positive, negative, fractional, or other elaborations on such themes. There is no definitive criterion by which any of the representations is universally superior. The representation used in most current computing devices is two's complement

Algorithm: 
    1. Initialize index register with the offset of array of signed numbers
    2. Initialize ECX with array element count
    3. Initialize positive number count and negative number count to zero
    4. Perform MSB test of array element
    5. If set jump to step 7
    6. Increment positive number count and jump to step 8
    7. Increment negative number count and continue
    8. Point index register to the next element
    9. Decrement the array element count from ECX, if not zero jump to step 4, else continue
    10. Display Positive number message and then display positive number count
    11. Display Negative number message and then display negative number count
    12. EXIT
Conclusion: Hence we counted and displayed the number of positive and negative numbers from the array of signed numbers.

