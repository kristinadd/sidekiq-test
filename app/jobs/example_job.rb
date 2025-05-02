class ExampleJob < ApplicationJob
  # Retry configuration
  retry_on StandardError, wait: :exponentially_longer, attempts: 3
  discard_on ActiveRecord::RecordNotFound

  def perform(user_id, message)
    user = User.find(user_id)
    puts "Processing job for user: #{user.email}"
    puts "Message: #{message}"
    
    # Simulate some work
    sleep 1
    
    puts "Job completed!"
  end
end 