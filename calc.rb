quit_req = false
Kernel.trap( "INT" ) { quit_req = true }

while !quit_req
  val = gets.chomp
  puts eval(val)
end

# Ref 1 = https://stackoverflow.com/questions/4508764/how-can-i-add-a-user-interrupt-to-an-infinite-loop
# Ref 2 = http://rubymonk.com/learning/books/5-metaprogramming-ruby-ascent/chapters/24-eval/lessons/63-eval
