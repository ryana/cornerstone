ActionMailer::Base.smtp_settings = Harmony[:mail]
Devise::Mailer.send :include, SendGrid
