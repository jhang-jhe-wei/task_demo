json.extract! task, :id, :name, :title, :content, :tag, :user_id, :start, :end, :piority, :state, :created_at, :updated_at
json.url task_url(task, format: :json)
