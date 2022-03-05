class MembersController < ApplicationController
  def show
    unless logged_in?
      redirect_to login_url
    end
  end

  def update
  end
end
