json.array!(@tasks) do |task|
  json.extract! task, :name, :category, :todo, :media, :state
  json.url task_url(task, format: :json)
end
