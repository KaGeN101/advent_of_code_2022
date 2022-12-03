
# Just do some rudementary setups 
scores = {}
start = 0
("a".."z").each {|l| scores[l] = start+=1}
start = 26
("a".."z").each {|l| scores[l.upcase] = start+=1}
p scores

