# brew install lua@5.1
# gem install rlua
require 'rlua'

state = Lua::State.new
# state.__load_stdlib :all

state.input = 10                     # set a value
state.__eval "output = input * 3"    # execute!
puts "state.output: #{state.output}" # retrieve a value

result = state.__eval "return 'hi'"   # or just return a value
puts "return: #{result}"

puts

# share Ruby code with lua
state.print = method(:puts) # anything that supports call
state.__eval "print('hello from lua')"

puts

# share Lua code with Ruby
state.__eval "
function double(value)
  return value * 2
end
"
puts "double(30): #{state.double(30)}"
