class GistsController < ApplicationController
  def index
  	@gists = Gist.all;
  	@users = User.all;
  end

  def create
    @date = DateTime.now.to_date;
    @user = current_user;
    Gist.create description: params[:description], file: params[:file], content: params[:content], date: @date,user_id: @user;
    redirect_to "/"
  end

  def show
  	@gist = Gist.find(params[:id])
  	@users = User.all
  end
end
