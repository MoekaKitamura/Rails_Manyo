json.extract! task, :id, :task_name, :to_do, :deadline, :status, :priority, :created_at, :updated_at
json.url task_url(task, format: :json)
