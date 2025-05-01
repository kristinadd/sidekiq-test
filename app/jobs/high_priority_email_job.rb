class HighPriorityEmailJob < ApplicationJob
  queue_as :high_priority

  def perform(user_id)
    user = User.find(user_id)
    puts "Sending high priority email to #{user.email}"
  end
end
