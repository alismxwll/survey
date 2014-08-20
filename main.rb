Dir[File.dirname(__FILE__) + './lib/*.rb'].each { |file| require file }

ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))['development'])

def welcome
  puts "Thanks for stopping in today, what can I help you with?\n"
  sleep(1)
  sign_in
end

def sign_in
  puts "Who are you?"
  choice = nil
  until choice == 'x'
    puts "Press 'c' to go to the test creator menu."

    when 'c'
      survey_creator
    when 'x'
      puts "Have a nice life."
    end
  end
end

welcome
