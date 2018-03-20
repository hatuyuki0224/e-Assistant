#json.extract! classwork, :id, :title, :businessHours_start, :businessHours_end, :created_at, :updated_at
json.extract! classwork, :id, :title
json.businessHours do
  json.start classwork.businessHours_start
  json.end classwork.businessHours_end
end
json.extract! classwork, :created_at, :updated_at
#json.url classwork_url(classwork, format: :json)
