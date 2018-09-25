class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
    def edited?
      created_at != updated_at
    end
  end
