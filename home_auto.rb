require 'sinatra'

set :public_folder, 'public'

get '/' do
  @title = 'Home Auto'
  @dimmer_value = 60
  @switch_1 = true
  @switch_2 = false
  erb :index
end
