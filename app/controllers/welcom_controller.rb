class WelcomController < ApplicationController

  def index
    @challenges = Challenge.order('created_at DESC')
  end

end
