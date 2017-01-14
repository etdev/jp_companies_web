class Company < ApplicationRecord
  has_one :vorkers_entry
  has_one :en_hyouban_entry
end
