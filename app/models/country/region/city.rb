class Country::Region::City < ActiveRecord::Base
  belongs_to :region
end
