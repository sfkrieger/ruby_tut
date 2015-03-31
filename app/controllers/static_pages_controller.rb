class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @micropost = current_user.microposts.build if logged_in?
      @feed_items = current_user.feed.paginate(page: params[:page])
    end

  end

  def help
  end

  #don't need this i guess
  # def about
  # end

  def contact
  end
end
