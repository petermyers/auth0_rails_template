class MeController < SecureController

  def me
    render json: { current_user: current_user(allow_nonexistent: true) }
  end
end