class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def random_record
    self.take(1).order("RAND()")
  end

end
