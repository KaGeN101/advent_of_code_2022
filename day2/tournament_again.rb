
 combinations = { 
    'A X' => 4, 
    'A Y' => 8, 
    'A Z' => 3, 
    'B X' => 1, 
    'B Y' => 5, 
    'B Z' => 9, 
    'C X' => 7, 
    'C Y' => 2, 
    'C Z' => 6, 
}

combinationsII = { 
    'A X' => 3, 
    'A Y' => 4, 
    'A Z' => 8, 
    'B X' => 1, 
    'B Y' => 5, 
    'B Z' => 9, 
    'C X' => 2, 
    'C Y' => 6, 
    'C Z' =>  7, 
};

total = 0
totalII = 0
File.foreach("input.txt") do |line| 
    total += combinations[line.strip]
    totalII += combinationsII[line.strip]
end

puts total
puts totalII