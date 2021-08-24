class SecureController < ApplicationController
  before_action :authenticate_request!
  rescue_from NotAuthenticatedError, with: :access_denied

  def current_user
    @__current_user__ ||= attempt_user_lookup
  end

  private

  def attempt_user_lookup
    if @__current_user_id__.present?
      User.find_by!(external_id: @__current_user_id__)
    else
      nil
    end
  rescue ActiveRecord::RecordNotFound
    raise NotAuthenticatedError.new
  end

  def authenticate_request!
    @__current_user_id__ = AuthorizationService.new(request.headers).authenticate_request!
  rescue JWT::VerificationError, JWT::DecodeError
    raise NotAuthenticatedError.new
  end

  def access_denied
    render json: { errors: ['Not authenticated'] }, status: :unauthorized
  end

end