class MembersController < ApplicationController
  def show
    unless logged_in?
      redirect_to login_url
    end

    @favorites_by_earliest_created = Favorite.all.by_earliest_created
    @favorites_by_store_name_only_store1 = Favorite.all.by_store_name_only_store1
  end

  def update
  end
end
