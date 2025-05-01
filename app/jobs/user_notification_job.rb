class UserNotificationJob < ApplicationJob
  # Dynamic queue assignment based on user type and notification urgency
  queue_as do
    if urgent?
      :urgent_notifications    # Process immediately
    elsif user.premium?
      :premium_notifications   # Process next
    else
      :regular_notifications  # Process when resources available
    end
  end

  def perform(user_id, message, urgent = false)
    @user = User.find(user_id)
    @message = message
    @urgent = urgent

    send_notification
  end

  private

  def urgent?
    @urgent
  end

  def send_notification
    puts "Sending #{urgent? ? 'URGENT ' : ''}notification to #{@user.email}"
    puts "Using queue: #{self.class.queue_name}"
    # Actual notification logic would go here
  end
end 