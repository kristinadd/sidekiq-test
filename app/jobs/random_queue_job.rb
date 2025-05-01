class RandomQueueJob < ApplicationJob
  queue_as :completely_new_queue  # This queue doesn't exist yet, but will be created

  def perform(message)
    puts "Processing message in completely new queue: #{message}"
  end
end 