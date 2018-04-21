class User < ActiveRecord::Base
  def self.say_hello
    puts 'Hello there!'
  end
end