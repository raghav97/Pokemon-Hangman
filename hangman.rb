def valid(answ)
  until ((answ.to_i == 1) or (answ.to_i == 2) or (answ.to_i == 3) or (answ.to_i == 4) or (answ.to_i == 5) or (answ.to_i == 6) or (answ.to_i == 7))
    puts "Wrong choice! Enter a valid one"
    answ = gets.chomp
    valid(answ)
    return answ
  end
end
FILENAME = 'pokemon.yaml'

class Poke
  attr_accessor :Name, :Type, :Stage, :Generation
end

require "yaml"
data = YAML::load(File.open(FILENAME))

random = rand(1..977)

puts "\t\t Pokemon Hangman!\n\n"
puts "1. First generation. "
puts "2. Second generation. "
puts "3. Third generation. "
puts "4. Fourth generation. "
puts "5. Fifth generation. "
puts "6. Sixth generation. "
puts "7. Any generation. "
ans = gets.chomp
#ans = valid(ans)
if ans.to_i == 1
  random = rand(1..198)
  name =  data[random].Name.downcase
  type =  data[random].Type
  stage =  data[random].Stage

elsif ans.to_i == 2
  random = rand(199..334)
  name =  data[random].Name.downcase
  type =  data[random].Type
  stage =  data[random].Stage

elsif ans.to_i == 3
  random = rand(335..527)
  name =  data[random].Name.downcase
  type =  data[random].Type
  stage =  data[random].Stage

elsif ans.to_i == 4
  random = rand(528..673)
  name =  data[random].Name.downcase
  type =  data[random].Type
  stage =  data[random].Stage

elsif ans.to_i == 5
  random = rand(674..879)
  name =  data[random].Name.downcase
  type =  data[random].Type
  stage =  data[random].Stage

elsif ans.to_i == 6
  random = rand(880..977)
  name =  data[random].Name.downcase
  type =  data[random].Type
  stage =  data[random].Stage

elsif ans.to_i == 7
  random = rand(1..977)
  name =  data[random].Name.downcase
  type =  data[random].Type
  stage =  data[random].Stage
end

checker = 0
checker = checker.to_i
len = name.length
len = len.to_i
l = len - 1
l = l.to_i
arr = []
len.times { arr.push("_")}
brr = []
name.each_char { |e| brr.push(e)}
misses = []
puts "\n\n Let's begin!"
rr = 0
rr = rr.to_i
arr.each { |e| print "_" + " "}
until (checker== len) or (misses.length == 7)
  puts "\n" 
  puts len
  rr = 0
  puts "Enter your guess. "
  ans = gets.chomp
  clue = []
  if ans == "clue"
    clue.push("The Pokemon is of #{type} type")
    puts clue.last 
  else
    if brr.count(ans) == 0
      misses.push(ans) if misses.count(ans).to_i == 0
    else
      for e in 0..len
        rr += 1
        if brr[e] == ans
          arr[rr] = ans
          brr[e] = "_"
          checker  += 1
        end
      end
    end
  end
  arr[0] = ""
  arr.each do |e| print "#{e}  " end

  print "\nMisses = "
  misses.each { |e| print e + ", "}
  puts "\n"
end
  if checker == len
    puts "Great, you found it!"
  end
  if misses.count.to_i == 7
    puts "Sorry, the pokemon was #{name}\n"
  end
