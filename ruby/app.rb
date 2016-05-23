require 'sinatra'
require 'pi_piper'
require 'yaml'

require_relative './home_auto'

set :public_folder, 'public'

config = YAML.load_file('config/config.yml')[settings.environment.to_s]
home_auto = HomeAuto.new(config['home_auto'])

get '/' do
  @dimmers = home_auto.dimmers
  @switches = home_auto.switches
  @title = 'Home Auto'
  erb :index
end

post '/set_dimmer' do
  dimmer_value = params[:dimmer_value]
  dimmer_id = params[:dimmer_id]
  puts "Setting dimmer #{dimmer_id} in #{dimmer_value}"
end

post '/set_switch' do
  switch_id = params[:switch_id]
  switch_status = params[:switch_status]
  switch = home_auto.set_switch(switch_id, switch_status)
  puts "Setting #{switch_id} to #{switch_status}"
end
