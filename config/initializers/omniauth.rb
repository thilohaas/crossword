Rails.application.config.middleware.use OmniAuth::Builder do
  # The following is for facebook
  provider :facebook, "266087660195412", "c7e2bd0389ceebdd209230511c6f7b49", {:scope => 'email'}

  # If you want to also configure for additional login services, they would be configured here.
end