# frozen_string_literal: true

require 'sinatra/base'
require 'thor'

class App < Sinatra::Base
  configure do
    set :server, :puma
    set :port, ENV['PORT']
    set :bind, '0.0.0.0'
  end

  def initialize
    super

    load File.dirname(__FILE__) + '/../lib/tasks/templates.thor'
  end

  get '/' do
    Templates.new.invoke(:feed)
  end

  run! if app_file == $PROGRAM_NAME
end
