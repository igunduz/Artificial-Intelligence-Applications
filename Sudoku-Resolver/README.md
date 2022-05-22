**Constraint satisfaction Problem (CSP)**

<img src="https://github.com/igunduz/Artificial-Intelligence-Applications/blob/main/Sudoku-Resolver/Figure_1.PNG" width="400"/>

The implementation of sudoku resolver via *Z3* was made based on the following regulations.

1. Typical Sudoku constraints:
   - (a) Numbers cannot be repeated in any row, column, or 3x3 square.
   - (b) Cells whose values are already specified must be assigned to the respective values.
   
2. Top left 3 × 3 square: The numbers must comply with the arithmetic expressions
drawn in the figure:
   - (a) <0,0> + <1,0> = 8
   - (b) <0,1> - <1,1> = 6
   - (c) <2,2> / <2,1>= 2
   
3. Top middle 3 × 3 square: The values of the green cells must be either all odd
or all even. Moreover, if the green cells contain odd numbers, then the orange
cell must contain an even number. If the green cells contain even numbers, then
the orange cell must contain an odd number.


