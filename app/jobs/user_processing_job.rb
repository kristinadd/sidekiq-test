class UserProcessingJob < ApplicationJob
  def perform(user, options = {})
    # User is an ActiveRecord model, so it will be properly serialized
    puts "Processing user: #{user.email}"
    
    # Simple options hash works fine
    puts "Processing options: #{options.inspect}"
    
    # You can access user attributes
    puts "User attributes:"
    puts "- Email: #{user.email}"
    puts "- Created at: #{user.created_at}"
    
    # But be careful with associations
    # Instead of:
    # user.posts.each do |post| ...
    
    # Do this:
    Post.where(user_id: user.id).find_each do |post|
      process_post(post)
    end
  end
  
  private
  
  def process_post(post)
    puts "Processing post: #{post.title}"
    # Process the post
  end
end 