json.array!(@profils) do |profil|
  json.extract! profil, :id, :name, :job, :city, :aboutme, :email
  json.url profil_url(profil, format: :json)
end
