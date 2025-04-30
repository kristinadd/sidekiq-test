class HelloWorldJob
  include Sidekiq::Job

  sidekiq_options retry: 1

  def perform(name)
    puts "Starting job for #{name}"

    puts "Loaded HelloWorldJob with retry: #{sidekiq_options_hash['retry']}"

    puts 

    raise "Something went wrong!" if name == "fail"
    
    puts "Job finished successfully for #{name}"
  end
end
