class DaasWorker
  include Sidekiq::Worker
  
  def perform(task_id)
    #     # puts "******DaasWorker#perform"
    #     task = Task.find(task_id)
    #     sleep(rand(5))
    #     task.update_attribute(:state, 'In Queue') 
    #     # response.headers["Content-Type"] = "text/javascript"
    #     message = {id: task_id, state: task.state, date: task.updated_at.to_s(:short)}.to_json
    # $redis.publish('message.create', message)
    #     # puts "******Redis published"
  end
end