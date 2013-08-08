class TranscodingWorker
  include Sidekiq::Worker
  
  def perform(transcoding_id)
    puts "******DaasWorker#perform: #{transcoding_id}"
    transcoding = Transcoding.find(transcoding_id)
    sleep(5)
    transcoding.update_attribute(:state, 'In Queue')	
    # response.headers["Content-Type"] = "text/javascript"
    message = {id: transcoding_id, state: transcoding.state, 
              date: transcoding.updated_at.strftime("%H:%M:%S")}.to_json
		$redis.publish('message.create', message)
    puts "******Redis published: #{message}"
    sleep(5)
    transcoding.update_attribute(:state, 'Publishing')	
    # response.headers["Content-Type"] = "text/javascript"
    message = {id: transcoding_id, state: transcoding.state, 
              date: transcoding.updated_at.strftime("%H:%M:%S")}.to_json
		$redis.publish('message.create', message)
    puts "******Redis published: #{message}"
  end
end