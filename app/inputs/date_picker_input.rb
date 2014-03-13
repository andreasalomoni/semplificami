class DatePickerInput < SimpleForm::Inputs::StringInput

  def input
    input_html_options[:class] = input_html_options[:class] << ' datepicker'
    input_html_options[:content_type] = 'text'

    input_html_options['data-format'] = "dd/MM/yyyy"

    value = object.send(attribute_name)
    input_html_options[:value] = value.nil?? nil : I18n.localize(value)

    input_html_options[:type] = 'text'
    super
  end


end
