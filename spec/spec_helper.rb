require 'bundler/setup'
require 'active_record'
# require 'creator'


Bundler.require(:default, :test)

Dir[File.dirname(__FILE__) + '/../lib/*.rb'].each { |file| require file }

ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))['test'])

RSpec.configure do |config|
  config.formatter = 'doc'
  # config.before(each:) do

  # end
end
