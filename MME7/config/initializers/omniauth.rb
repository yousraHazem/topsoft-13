
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '446885572071986', 'f9cda6c75f132775958518d83f8fea73'
end