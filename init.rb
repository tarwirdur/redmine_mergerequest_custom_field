require 'mergerequest_custom_field/mergerequest_format'
require 'mergerequest_custom_field/custom_field_patch'

Redmine::Plugin.register :redmine_mergerequest_custom_field do
  name 'Merge Request custom field plugin'
  author 'Tarwirdur Turon'
  description 'Adds merge-request type to custom fields'
  version '0.0.1'
  url 'http://github.com/tarwirdur/redmine_mergerequest_custom_field'
  author_url 'http://github.com/tarwirdur'
end
