class Companies::Admin::Pages::EditPage < ApplicationPage
  set_url "/admin/pages/{id}/edit"

    element :name, "#company_page_name"
    element :slug, "#company_page_slug"
    # element :body, "#body" #TODO разобраться как получить контейнер визивига
    element :submit, "input[name=commit]"

    def update(attrs)
      [:name, :slug].each do |name|
        send(name).set attrs[name]
      end

      submit.click
    end
end
