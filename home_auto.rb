require 'sinatra'
require 'rubyserial'

set :public_folder, 'public'
#serialport = Serial.new '/dev/ttyACM0', 57600 #when not commented an error occurs when starts the serve

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
  serialport.write("#{dimmer_id}|#{dimmer_value}")

end

post '/set_switch' do
  switch_id = params[:switch_id]
  switch_status = params[:switch_status]
  puts "Definindo o #{switch_id} como #{switch_status}"
  serialport.write("#{switch_id}|#{switch_status}")
end
