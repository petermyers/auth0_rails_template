class HealthController < ApplicationController
  def health
    render json: { ping: 'pong' }
  end
end