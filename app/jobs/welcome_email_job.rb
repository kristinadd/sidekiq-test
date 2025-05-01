class WelcomeEmailJob < ApplicationJob
  queue_as :default

  def perform(user_id)
    user = User.find(user_id)
    puts "Sending welcome email to #{user.email}"
    
    # In a real application, you would use ActionMailer here
    # UserMailer.welcome_email(user).deliver_later
  end
end
