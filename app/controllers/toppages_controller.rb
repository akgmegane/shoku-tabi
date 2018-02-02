class ToppagesController < ApplicationController
  def index
    if logged_in?
      @user = current_user
      @micropost = current_user.micropost.build  # form_for 用
      @microposts = current_user.microposts.order('created_at DESC').page(params[:page])
    end
  end
end
