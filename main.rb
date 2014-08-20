require 'active_record'

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))['development'])

def welcome
  puts "\nThanks for stopping in today, what can I help you with?"
  sleep(1)
  main_menu
end

def main_menu
  choice = nil
  until choice == 'x'
    puts "\nWho are you?"
    puts "\nPress 'c' if you are a test creator."
    puts "\nPress 'x' to exit."
    choice = gets.chomp
    case choice
    when 'c'
      puts "\nSending you to the creator menu..."
      sleep(1)
      survey_creator
    when 'x'
      puts "\nHave a nice life..."
    end
  end
end

def survey_creator
  puts "\nWhat would you like to do?"
  choice = nil
  until choice == 'x'
    puts "\nPress 's' to add a new survey"
    puts "\nPress 'x' to go back to the main menu."
    choice = gets.chomp

    case choice
    when 's'
      create_survey
    when 'x'
      puts "\nSending you back to the main menu..."
      sleep(1)
      main_menu
    end
  end
end

def create_survey
  puts "What would you like to call your survey?"
  survey_name = gets.chomp
  survey = Survey.new(name: survey_name)
  if survey.save
    puts "\n'#{survey_name}' has been created."
  else
    puts "Try again, that isn't a valid survey name."
  end
end
welcome
