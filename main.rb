Dir[File.dirname(__FILE__) + './lib/*.rb'].each { |file| require file }

ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))['development'])

def welcome
  puts "Thanks for stopping in today, what can I help you with?\n"
  sleep(1)
  sign_in
end

def main_menu
  puts "Who are you?\n"
  choice = nil
  until choice == 'x'
    puts "Press 'c' to go to the test creator menu.\n"

    when 'c'
      survey_creator
    when 'x'
      puts "Have a nice life.\n"
    end
  end
end

def survey_creator
  puts "What would you like to do?\n"
  choice = nil
  until choice == 'x'
    puts "Press 's' to add a new survey\n"

    when 's'
      create_survey
    when 'x'
      puts "Sending you back to the main menu\n"
      main_menu
    end
  end
end

def create_survey
  puts "What would you like to call your survey?"
  survey_name = gets.chomp
  survey = Survey.new(name: survey_name)
  if survey.save
    puts "'#{survey_name}' has been created."
  else
    puts "Try again, that isn't a valid survey name."
  end
end
welcome
