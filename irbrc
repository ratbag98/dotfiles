require 'rubygems'
require 'interactive_editor'

IRB.conf[:PROMPT_MODE] = :SIMPLE

def y(obj)
  puts obj.to_yaml
end
