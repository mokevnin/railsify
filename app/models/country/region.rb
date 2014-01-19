class Country::Region < ActiveRecord::Base
  belongs_to :country
end
