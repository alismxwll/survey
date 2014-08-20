require 'active_record'

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))['development'])

@survey
@question
@creator

def welcome
  puts "*" * 40
  puts "You should never see this."
  puts "*" * 40
  main_menu
end

def main_menu
  system("clear")
  puts "*" * 40
  puts "Welcome to the main_menu..."
  puts "*" * 40
  puts "\nPress 'c' if you are or want to be a test creator."
  puts "\nPress 'x' to exit."
  choice = gets.chomp
  case choice
  when 'l'
    select_creator
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
  system("clear")
  choice = nil
  until choice == 'x'
    puts "*" * 40
    puts "Welcome to the survey_creator_menu..."
    puts "*" * 40
    puts "\nPress 'c' to add yourself as a creator."
    puts "\nPress 's' to add a new survey."
    puts "\nPress 'l' to log in creator"
    puts "\nPress 'x' to go back to the main menu."
    choice = gets.chomp

    case choice
    when 'c'
      create_creator
    when 'l'
      select_creator
    when 's'
      create_survey
    when 'x'
      puts "\nSending you back to the main menu..."
      main_menu
    end
  end
end

def create_creator
  system("clear")
  puts "*" * 40
  puts "Welcome to the create_creator_menu..."
  puts "*" * 40
  puts "What is your name, creator?"
  creator_name = gets.chomp
  @creator = Creator.new(name: creator_name)
  if @creator.save
    puts "\n'#{creator_name}', you are now in our system."
  else
    puts "\nTry again, that is not a valid creator name."
  end
  puts "Sending you back the the survey creator menu..."
  survey_creator
end

def select_creator
  system("clear")
  puts "*" * 40
  puts "Welcome to the select_creator_menu..."
  puts "*" * 40
  puts "\nIdentify your designation number, creator."
  puts "\nIf you don't have an account, please press 'c' to create one"
  puts "\n"
  creator_name_list
  input = gets.chomp
  @creator = Creator.all.fetch((input.to_i)-1) do |number|
    puts"#{number + 1} is not a valid choice, booting you out..."
    main_menu
  end
  puts "Logging #{@creator.name} in..."
  sleep(2)
  survey_creator
end

def create_survey
  system("clear")
  if @creator == nil
    puts "*" * 40
    puts "Please, login or create an account."
    puts "*" * 40
    sleep(2)
    survey_creator
  else
    puts "*" * 40
    puts "Welcome to the create_survey_menu..."
    puts "*" * 40
    puts "Welcome #{@creator.name}, what would you like to call your survey?"
    survey_name = gets.chomp
    @survey = Survey.new(name: survey_name)
    if @survey.save
      puts "\n'#{survey_name}' has been created."
    else
      puts "\nTry again, that isn't a valid survey name."
    end
    add_question
  end
end

def add_question
  system("clear")
  puts "*" * 40
  puts "Welcome to the add_question_menu..."
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

def creator_name_list
  Creator.all.each_with_index do  |creator, index|
    puts "(#{index + 1}) Creator: #{creator.name}"
  end
end

#############################TAKERS#############################
#############################TAKERS#############################
#############################SURVEY#############################
def survey_name_list
  Survey.all.each_with_index do |survey, index|
    puts "(#{index + 1}) Survey: #{survey.name}"
  end
end
#############################SURVEY#############################
#############################   #############################
#############################   #############################


welcome
