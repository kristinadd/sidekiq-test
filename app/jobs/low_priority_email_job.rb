class LowPriorityEmailJob < ApplicationJob
  queue_as :low_priority

  def perform(user_id)
    user = User.find(user_id)
    puts "Sending low priority email to #{user.email}"
  end
end
