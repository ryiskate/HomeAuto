require 'sinatra'

set :public_folder, 'public'

dimmers = [{id: "dimmer-sala", value: 50, name: "sala"}, {id: "dimmer-cozinha", value: 50, name: "cozinha"}]

get '/ri' do
  @dimmers = dimmers
  @title = 'Home Auto'
  @switch_1 = true
  @switch_2 = false
  erb :index
end

post '/set_dimmer' do
  dimmer_value = params[:dimmer_value]
  dimmer_id = params[:dimmer_id]
  puts "Definindo o dimmer #{dimmer_id} em #{dimmer_value}"
end

post '/set_switch' do
  switch_number = params[:switch_number]
  switch_value = params[:switch_value]
  puts "Definindo o #{switch_number} como #{switch_value}"
end
