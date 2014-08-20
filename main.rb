require 'active_record'

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))['development'])

@survey
@question

def welcome
  puts "*" * 40
  puts "Welcome!"
  puts "*" * 40
  puts "\nThanks for stopping in today, what can I help you with?"
  main_menu
end

def main_menu
  puts "*" * 40
  puts "main_menu"
  puts "*" * 40
  puts "\nWho are you?"
  puts "\nPress 'c' if you are a test creator."
  puts "\nPress 'x' to exit."
  choice = gets.chomp
  case choice
  when 'c'
    puts "\nSending you to the creator menu..."
    survey_creator
  when 'x'
    puts "\nHave a nice life..."
    exit
  end
end
#############################CREATOR#############################
def survey_creator
  puts "\nWhat would you like to do?"
  choice = nil
  until choice == 'x'
    puts "*" * 40
    puts "survey_creator"
    puts "*" * 40
    puts "\nPress 's' to add a new survey"
    puts "\nPress 'x' to go back to the main menu."
    choice = gets.chomp

    case choice
    when 's'
      create_survey
    when 'x'
      puts "\nSending you back to the main menu..."
      main_menu
    end
  end
end

def create_survey
  puts "*" * 40
  puts "create_survey"
  puts "*" * 40
  puts "What would you like to call your survey?"
  survey_name = gets.chomp
  @survey = Survey.new(name: survey_name)
  if @survey.save
    puts "\n'#{survey_name}' has been created."
  else
    puts "\nTry again, that isn't a valid survey name."
  end
  add_question
end

def add_question
  puts "*" * 40
  puts "add_question"
  puts "*" * 40
  puts "\nAdd a question to your survey."
  question_ = gets.chomp
  @question = Question.new(question: question_)
  if @question.save
    puts "\n'#{question_}' has been created."
  else
    puts "\nTry again, that isn't a valid question."
  end
  choice = nil
  until choice == 'n'
    puts "\nWould you like to add another question? y/n"
    choice = gets.chomp

    case choice
    when 'y'
      add_question
    when 'n'
      puts "\nSending you to the survey creator menu..."
      survey_creator
    end
  end
end

def survey_name_list
  Survey.all.each_with_index do |survey, index|
    puts "(#{index + 1}) Survey: #{survey.name}"
  end
end

#############################TAKERS#############################


welcome
