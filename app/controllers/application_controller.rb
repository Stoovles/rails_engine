class ApplicationController < ActionController::API
  include ActionController::Serialization

  def random
    @random_record = self.random_record
    render json: TransactionSerializer.new(@random_record)
  end


end
