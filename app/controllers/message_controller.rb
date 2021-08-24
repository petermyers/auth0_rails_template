class MessageController < SecureController
  skip_before_action :authenticate_request!, only: [:public]

  def public
    render json: { ping: "pong" }
  end

  def protected
    render json: current_user
  end

end