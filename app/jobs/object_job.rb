class ObjectJob < ApplicationJob
  def perform(user, message, options = {})
    # User object will be serialized/deserialized
    puts "Processing job for user: #{user.email}"
    
    # Simple objects work fine
    puts "Message: #{message}"
    
    # Hashes work fine
    puts "Options: #{options.inspect}"
    
    # You can access the deserialized user's methods
    puts "User's full name: #{user.name}" if user.respond_to?(:name)
    
    # But be careful with complex objects
    # This might not work as expected:
    # puts "User's associations: #{user.posts.inspect}"
  end
end 