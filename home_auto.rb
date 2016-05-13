require 'sinatra'

set :public_folder, 'public'

dimmers = [
  {id: "dimmer-sala", value: 50, name: "sala"},
  {id: "dimmer-cozinha", value: 50, name: "cozinha"}
]

switches = [
  {id: "switch-sala", status: true, name:"sala"},
  {id: "switch-corredor", status: true, name:"corredor"},
  {id: "switch-quarto", status: true, name:"quarto"},
]

get '/' do
  @dimmers = dimmers
  @switches = switches
  @title = 'Home Auto'
  erb :index
end

post '/set_dimmer' do
  dimmer_value = params[:dimmer_value]
  dimmer_id = params[:dimmer_id]
  puts "Definindo o dimmer #{dimmer_id} em #{dimmer_value}"
end

post '/set_switch' do
  switch_id = params[:switch_id]
  switch_status = params[:switch_status]
  puts "Definindo o #{switch_id} como #{switch_status}"
end
