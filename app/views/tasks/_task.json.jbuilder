json.extract! task, :id, :title, :content, :tag, :user_id, :start, :end, :piority, :state, :created_at, :updated_at
json.url task_url(task, format: :json)
