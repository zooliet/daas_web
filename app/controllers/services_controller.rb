class ServicesController < ApplicationController
  include ActionController::Live 
  $test_var = 0
  def index
    if params[:name] == 'Transcoding'
      redirect_to new_transcoding_path
    end
  end
  
  def events
  	response.headers['Content-Type'] = 'text/event-stream'
    redis = Redis.new
    redis.subscribe('message.create') do |on|
  	  puts "***Subscribed to redis message.create"    		
  		on.message do |event, data|
  		  puts "***Redis received: #{data}"
  			response.stream.write("data: #{data}\n\n")
  		end
  	end 
  rescue IOError => e
    logger.info "Stream closed: #{e}"
  ensure
    redis.quit
    response.stream.close
    puts "***Stream closed 2"
	end  
end
