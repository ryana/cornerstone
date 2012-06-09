Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, Harmony[:facebook][:app_id], Harmony[:facebook][:secret]
  provider :twitter, Harmony[:twitter][:key], Harmony[:twitter][:secret]
end
