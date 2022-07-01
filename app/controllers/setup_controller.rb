class SetupController < ApplicationController
  def create
    session[:chat_id] = params[:chat_id]
    redirect_to incoming_path
  end
end
