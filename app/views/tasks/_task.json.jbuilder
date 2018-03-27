json.extract! task, :id, :task_name, :deadline_date, :deadline_time, :required_time, :priority, :color, :comment, :created_at, :updated_at
json.url task_url(task, format: :json)
