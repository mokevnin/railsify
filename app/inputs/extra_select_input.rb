class ExtraSelectInput < SimpleForm::Inputs::CollectionSelectInput
  def input_html_classes
    super.push('extra_select')
  end
end
