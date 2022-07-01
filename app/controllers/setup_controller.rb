class SetupController < ApplicationController
  def create
    session[:chat_id] = params[:chat_id]
  end
end
