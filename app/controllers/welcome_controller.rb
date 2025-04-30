class WelcomeController < ApplicationController
  def index
    # For demonstration purposes, we'll create a temporary user
    # In a real application, you would get this from your database
    user = User.create(email: 'test@example.com')
    
    # Enqueue the job
    WelcomeEmailJob.perform_later(user.id)
    
    flash[:notice] = "Welcome email job has been enqueued!"
  end
end
