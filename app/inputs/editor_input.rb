class EditorInput < SimpleForm::Inputs::TextInput
  def input_html_options
    super.merge(rows: 120)
  end

  def input_html_classes
    super.push('redactor')
  end
end
