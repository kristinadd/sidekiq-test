class WelcomeController < ApplicationController
  def index
    user = User.create(email: 'test@example.com')
    
    # Enqueue jobs in different queues
    WelcomeEmailJob.perform_later(user.id)        # Goes to :default queue
    HighPriorityEmailJob.perform_later(user.id)   # Goes to :high_priority queue
    LowPriorityEmailJob.perform_later(user.id)    # Goes to :low_priority queue
    
    flash[:notice] = "Jobs have been enqueued in different queues!"
  end
end
