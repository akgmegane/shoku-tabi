class ToppagesController < ApplicationController
  def index
    if logged_in?
      @user = current_user
      @shokutabi = current_user.shoku-tabi.build  # form_for 用
      @shokutabi = current_user.shoku-tabi.order('created_at DESC').page(params[:page])
    end
  end
end
