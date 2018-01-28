class ShokuTabiController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def create
     @shokutabi = current_user.shoku-tabi.build(micropost_params)
    if @shokutabi.save
      flash[:success] = 'メッセージを投稿しました。'
      redirect_to root_url
    else
      @shokutabi = current_user.shoku-tabi.order('created_at DESC').page(params[:page])
      flash.now[:danger] = 'メッセージの投稿に失敗しました。'
      render 'toppages/index'
    end
  end

  def destroy
    @shokutabi.destroy
    flash[:success] = 'メッセージを削除しました。'
    redirect_back(fallback_location: root_path)
  end
  private
  
  def shokutabi_params
    params.require(:shokutabi).permit(:content)
  end
  
  def correct_user
    @micropost = current_user.microposts.find_by(id: params[:id])
    unless @micropost
      redirect_to root_url
    end
  end
end