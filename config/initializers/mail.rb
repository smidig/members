# -*- encoding : utf-8 -*-
if Rails.env.production?
  ActionMailer::Base.smtp_settings = {
    :address        => 'smtp.sendgrid.net',
    :port           => '587',
    :authentication => :plain,
    :user_name      => ENV['SENDGRID_USERNAME'],
    :password       => ENV['SENDGRID_PASSWORD'],
    :domain         => 'heroku.com'
  }
  ActionMailer::Base.delivery_method = :smtp
else
  require 'ostruct'
  if File.exists?(mailer_yml = "#{Rails.root}/config/mailer.yml")
    options = YAML.load_file(mailer_yml)[Rails.env]
    ActionMailer::Base.smtp_settings = OpenStruct.new(options).smtp_settings
  end
end
