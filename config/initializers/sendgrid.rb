ActionMailer::Base.smtp_settings = Harmony[:mail].to_hash.symbolize_keys!
Devise::Mailer.send :include, SendGrid
