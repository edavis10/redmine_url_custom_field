require 'redmine'

Redmine::Plugin.register :redmine_url_custom_field do
  name 'Url Custom Field'
  author 'Eric Davis'
  description 'Adds a URL custom field format'
  version '0.0.0'

  requires_redmine :version_or_higher => '0.9.0'
end

class UrlCustomFieldFormat < Redmine::CustomFieldFormat
  include ActionView::Helpers::TextHelper
  include ActionView::Helpers::TagHelper

  def format_as_url(value)
    auto_link h(value)
  end

  def escape_html?
    false
  end

  def edit_as
   "text"
  end
end

Redmine::CustomFieldFormat.map do |fields|
  fields.register UrlCustomFieldFormat.new('url', :label => :label_url, :order => 8)
end
