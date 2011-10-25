class LabellingFormBuilder < ActionView::Helpers::FormBuilder

  [:text_field, :password_field, :time_select, :date_select, :datetime_select, :file_field, :text_area].each do |selector|
    src = <<-SRC
      def #{selector.to_s}(method, options = {})
        html = super(method, options)
        label = options.delete(:label) if options.is_a? Hash
        label ||= method.to_s.humanize
        <<-HTML
          <label for="#\{object_name}_#\{method.to_s}">#\{label.to_s}</label>
          #\{html}
        HTML
      end
    SRC
    class_eval src, __FILE__, __LINE__
  end

  [:check_box].each do |selector|
    src = <<-SRC
      def #{selector.to_s}(method, options = {}, checked_value = "1", unchecked_value = "0")
        html = super(method, options, checked_value, unchecked_value)
        label = options.delete(:label) if options.is_a? Hash
        label ||= method.to_s.humanize + "?"
        <<-HTML
          <label for="#\{object_name}_#\{method.to_s}">#\{label.to_s}</label>
          #\{html}
        HTML
      end
    SRC
    class_eval src, __FILE__, __LINE__
  end

  [:select, :country_select].each do |selector|
    src = <<-SRC
      def #{selector.to_s}(method, choices, options = {}, html_options = {})
        html = super(method, choices, options, html_options)
        label = options.delete(:label) if options.is_a? Hash
        label ||= method.to_s.humanize
        <<-HTML
          <label for="#\{object_name}_#\{method.to_s}">#\{label.to_s}</label>
          #\{html}
        HTML
      end
    SRC
    class_eval src, __FILE__, __LINE__
  end

end