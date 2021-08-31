class UsersController < SecureController
  def create
    name = params.require(:name)
    # Check to make sure a current_user doesn't exist...
    if(current_user(allow_nonexistent: true))
      render json: { error: "ALREADY_ONBOARDED" }, status: 400 and return
    end
    user_params = { external_id: current_external_id, name: name }
    user = User.create!(user_params)
    render json: user.to_json
  end
end
