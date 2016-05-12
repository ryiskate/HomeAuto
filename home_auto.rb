require 'sinatra'

set :public_folder, 'public'

get '/' do
  @title = 'Home Auto'
  @dimmer_value = 60
  @switch_1 = true
  @switch_2 = false
  erb :index
end

post '/set_dimmer' do
  dimmer_value = params[:dimmer_value]
  puts "Definindo dimmer em #{dimmer_value}"
end

post '/set_switch' do
  switch_number = params[:switch_number]
  switch_value = params[:switch_value]
  puts "Definindo o #{switch_number} como #{switch_value}"
end
