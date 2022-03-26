class MembersController < ApplicationController
  def show
    unless logged_in?
      redirect_to login_url
    end

    @favorites_by_earliest_created = Favorite.all.by_earliest_created
    @favorites_by_store_maker_name_unset = Favorite.all.by_store_maker_name_not_unset(:store_maker_name)
  end

  def update
  end
end
