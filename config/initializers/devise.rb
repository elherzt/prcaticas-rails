# Use this hook to configure devise mailer, warden hooks and so forth.
# Many of these configuration options can be set straight in your model.
Devise.setup do |config|
  config.mailer_sender = "please-change-me-at-config-initializers-devise@example.com"

  require 'devise/orm/active_record'

  config.case_insensitive_keys = [ :email ]

  config.strip_whitespace_keys = [ :email ]

  config.skip_session_storage = [:http_auth]

  config.stretches = Rails.env.test? ? 1 : 10

  config.reconfirmable = true

  config.password_length = 8..128

  config.reset_password_within = 6.hours

  config.sign_out_via = :delete

  config.omniauth :twitter,
    'JtiPHRJ8pmlJ8Oi2NjEI9w',
    'CiElZBTeie2mIrjfnnNSqTFl8mqCdBD8GtlzARQw'

  config.omniauth :github, 'b31c1d5d9bcc8b8ed641', '5af06615c85f4fb9044ac6cd9b450f31e71b57c6'

end
