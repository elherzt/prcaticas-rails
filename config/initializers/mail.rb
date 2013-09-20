ActionMailer::Base.smtp_settings = {
  :user_name => 'jose.romero@tangosource.com',
  :address => "smtp.gmail.com",
  :password => 'example',
  :port => 587,
  :enable_starttls_auto => true
}
