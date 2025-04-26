class HelloWorldJob
  include Sidekiq::Job

  sidekiq_options retry: 3

  def perform(name)
    puts "Starting job for #{name}"
    
    raise "Something went wrong!" if name == "fail"
    
    puts "Job finished successfully for #{name}"
  end
end
