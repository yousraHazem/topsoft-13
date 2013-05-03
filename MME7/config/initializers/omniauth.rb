OmniAuth.config.logger = Rails.logger
#FACEBOOK_CONFIG = YAML.load_file("C:\Users\Donia\Desktop\test\MME7\config\facebook.yml")[RAILS_ENV]

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '446885572071986', 'f9cda6c75f132775958518d83f8fea73'
end