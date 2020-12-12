
json.array! @events do |event|
    json.extract! event, :id, :title, :description, :income, :expense, :user_id
    json.start_date event.start_date   
    json.end_date event.end_date   
    json.url event_url(event, format: :html) 
end