json.array!(@profiles) do |profile|
  json.extract! profile, :id, :name, :job, :city, :aboutme, :email
  json.url profile_url(profile, format: :json)
end
