require 'sinatra/base'
require 'data_mapper'
require 'rack-flash'
require 'rubygems' 
require 'faker' 

DataMapper::setup(:default,"sqlite3://#{Dir.pwd}/quiz.db")

class Answer
	include DataMapper::Resource
property :id, Serial
property :value, Text
property :abbrev, String
belongs_to :question
end

class Question
	include DataMapper::Resource
property :id, Serial
property :value, Text
property :correct_answer, String
has n, :answers
end

class Users
	include DataMapper::Resource
property :id, Serial
property :name, Text
property :email, String, :required => true
property :password, Text, :required => true
property :role, Boolean
end

DataMapper.finalize.auto_upgrade!













=begin class User
  attr_reader :name

  def initialize(name)
    @name = name
  end  
end
=end