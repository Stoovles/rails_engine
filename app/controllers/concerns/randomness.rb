module Randomness
  extend ActiveSupport::Concern

  def random
    @random_record = model_object.random_record
    render json: serializer.new(@random_record)
  end

end
