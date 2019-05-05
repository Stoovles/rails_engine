class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.random_record
    order("random()").take(1)
  end

end
