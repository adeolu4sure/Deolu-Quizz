require 'sinatra/base'
#require 'sinatra/flash'
require 'data_mapper'
#require 'bcrypt'
require 'rack-flash'
require 'rubygems' 
require 'faker' 

DataMapper::setup(:default,"sqlite3://#{Dir.pwd}/quiz.db")
class Server < Sinatra::Base

  get '/' do
    user = User.new("Brice Nkengsa")
    erb :index, :locals => {:user => user}
  end

  get '/test' do
  	#10.times do 
  		#Question.create(:value => Faker::Lorem.sentence(3),:correct_answer => (0...1).map { ('a'..'d').to_a[rand(4)] }.join.upcase)
  	#end
  	 #Users.create(:email => 'test@yahoo.com',:password => 'test password',:role => true )
  	 #Users.create(:email => 'test1@yahoo.com',:password => 'test 1 password',:role => true )
  	 #Users.create(:email => 'test2@yahoo.com',:password => 'test 2 password',:role => true )
  	 40.times do
  	 	Answer.create(:value => Faker::Lorem.sentence(3),:abbrev => (0...1).map { ('a'..'d').to_a[rand(4)] }.join.upcase,:question_id =>(0...1).map { (1..10).to_a[rand(10)] }.join.to_i)
  	 end
  	 @user_test = Question.all
  	erb :index
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end