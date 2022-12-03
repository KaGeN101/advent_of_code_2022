# Will contain solutions for each day

## Day 1

Was doen in Ruby
Probably did not need the class could have done it in a Hash of Arrays but decided to model it  
just to get my feet wet
Also added a a pure datastructure soltuion in digest_datastruc.rb
TODO:
 - Can make the input file a argument (hardcoded to input.txt)
 - Can make the top N to check and argument (hardcoded to 3)


## Day 2

Did it with modeling first again with unit test (probably more readible and maintainable) and then re did it in a outcome hardcoded lookups datastrucutres
 - I know the first method is more maintainable because there was a bug in it and it was pretty easy to go and fix it once realised
 - The second method is a lot more compact but not very maintainable per say

## Day 3

This was the first solution where the two parts of the solution wasnot build ontop of each other
 - This problem was simple enought not think of a modeling solution for it
 - Did have to make two independent solutions sharing only the scoring lookup table

Intresting line of code to break the bags up in two compartments:  
```
left_comp, right_comp = line.chars.each_slice(line.length / 2).map(&:join)
```