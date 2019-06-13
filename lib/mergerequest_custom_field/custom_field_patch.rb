require_dependency 'custom_field'
module CustomFieldPatch
  def self.included(base)
    base.class_eval do
      unloadable
      safe_attributes 'mr_url_pattern'
    end
  end
end

CustomField.send(:include, CustomFieldPatch)

