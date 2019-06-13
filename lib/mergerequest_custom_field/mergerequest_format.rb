module Redmine
  module FieldFormat
    class MergeRequestFormat < LinkFormat
      add 'mergerequest'
      self.searchable_supported = false
      self.form_partial = 'custom_fields/formats/mergerequest'
      field_attributes :mr_url_pattern
      def formatted_value(view, custom_field, value, customized=nil, html=false)
        if value.present?
          parts = value.to_s.split(/,\s*|\s+/).select{|v| v != ""}
          mrRegex = /^(!|)((\d+)|.*\/(\d+)($|\/[^\/]*$))/
          baseMrUrl = custom_field.mr_url_pattern
          separator = ActiveSupport::SafeBuffer.new(", ")
          mergeRequests = nil
          parts.each do |part|
            url = part
            matches = mrRegex.match(part)
            if ! matches.nil?
              mrNumber = (matches[3]||"")+(matches[4]||"")
              mrText = "!" + mrNumber
              if ! url.start_with?("http")
                if baseMrUrl.nil? or baseMrUrl.blank?
                  url = nil
                else
                  url = baseMrUrl.gsub('{}', mrNumber)
                end
              end
              v = nil
              if html and ! url.nil?
                v = view.link_to mrText, url
              else 
                v = ActiveSupport::SafeBuffer.new(mrText)
              end
              if mergeRequests.nil?
                      mergeRequests = v
              else
                      mergeRequests += separator + v
              end
            end
          end
          mergeRequests
        else
          value.to_s
        end
      end
    end
  end
end
