class UserAutocompleteSerializer < ApplicationSerializer
  attributes :label, :value

  def label
    object.full_name
  end

  def value
    object.id
  end
end
