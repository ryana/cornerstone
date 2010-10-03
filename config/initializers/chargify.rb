if Harmony[:chargify]
  Chargify.configure do |c|
    c.subdomain = Harmony[:chargify][:subdomain]
    c.api_key   = Harmony[:chargify][:api_key]
  end
end
