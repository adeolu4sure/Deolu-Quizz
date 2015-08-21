# require your gems
require 'bundler'
Bundler.require

require 'sinatra/base'
#require 'sinatra/flash'
require 'dm-core'
#require 'bcrypt'
require 'rack-flash'
require 'rubygems' 
require 'faker' 
# set the pathname for the root of the app
require 'pathname'
APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))

# require the controller(s)
Dir[APP_ROOT.join('app', 'controllers', '*.rb')].each { |file| require file }

# require the model(s)
Dir[APP_ROOT.join('app', 'models', '*.rb')].each { |file| require file }

# configure Server settings
class Server < Sinatra::Base
  set :method_override, true
  set :root, APP_ROOT.to_path
  set :views, File.join(Server.root, "app", "views")
  set :public_folder, File.join(Server.root, "app", "public")
end