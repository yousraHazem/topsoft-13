
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '197020683755477', 'a1641f1dd6ef49a923dce9f1dbeba060'
end