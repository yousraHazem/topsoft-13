
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '356609801110887', '92b14f77debbc7953c9e05047ac4ea7b'
end