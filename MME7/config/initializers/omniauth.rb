OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['356609801110887'], ENV['92b14f77debbc7953c9e05047ac4ea7b']
end