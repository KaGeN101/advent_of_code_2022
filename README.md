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

## Day 4

Today's problem deffenatly went up a notch in complexity compared to the first few days
Tried doing the problem with datastructures first but it seemed that you would want to keep the sets in data structures with accessors  
Then made encapsulated Models with operational functions to use on the lists and structures
 - Added sorting first when I miss understood the problem wrong. Thought everyone had to check everyone else not just each other
 - So there extra functionality mehtods in the modelling layer that is not needed but is still easily possible to do thou
 - The first part is wholly inclussion the second part is overlap. The former is harder to do than just checking for any overlap
 - Applying the algorithm can definately be refactored. BUT it works :)

## Day 5

The problems seem to becoming more and more modelling oriented. Want to start doing it in a language that is less model driven and
more structure driven. 
Using data modelling type constructs wiht, datastructures and map reduce type code yields much nicer solutions but are a lot harder to maintain. Yet just to know that I can do it I want to migrate to this.
Alas, I digress, today was modelled again hahahaha

## Day 6

This problem was super easy
 - I first solved it and then refactored it
 - The second part needs to be one less (I guess it is because you not startin at 0)

