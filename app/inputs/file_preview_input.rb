class FilePreviewInput < SimpleForm::Inputs::FileInput
  def input
    out = '<br />'
    if object.send("#{attribute_name}?")
      out << template.link_to(template.t('download_file'), object.send(attribute_name).url)
    end
    # append file input. it will work accordingly with your simple_form wrappers
    (out << @builder.file_field(attribute_name, input_html_options)).html_safe
  end
end
