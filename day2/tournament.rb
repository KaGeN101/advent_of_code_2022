require_relative "rock_paper_scissors"

# define some stuctures which hold lookup values
left = {
    "A": "rock",
    "B": "paper",
    "C": "scissors"
}
right = {
    "X": "rock",
    "Y": "paper",
    "Z": "scissors"
}

score_per_round = {}
total_score = 0
round = 0
rps = RockPaperScissors.new()
# Read the file and break up to per round
File.foreach("input.txt") do |line| 
    round += 1
    splitted = line.strip.split(' ')
    score = rps.outcome splitted[0], splitted[1]
    score_per_round[round] = score
    total_score += score
end

puts "My total tournament score: #{total_score}" 
puts "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
write_to_file = ""
score_per_round.each do |round, score|
    write_to_file += "#{round},#{score}\n"
end
File.open("result_per_round_just_values.csv", 'w+') do |f|
    f.write(write_to_file)
end