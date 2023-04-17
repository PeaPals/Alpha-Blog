# Load the Rails application.
require_relative "application"

# Load the app's custom environment variables here, so that they are loaded before environments/*.rb
app_env_variables = File.join(Rails.root, 'config', 'env_variables.rb')
load(app_env_variables) if File.exist?(app_env_variables)


# Initialize the Rails application.
Rails.application.initialize!


ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  html_tag.html_safe
end
