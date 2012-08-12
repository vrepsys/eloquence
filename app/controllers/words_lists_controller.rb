class WordsListsController < ApplicationController

  respond_to :json
  
  def index
    respond_with User.find(params[:user_id]).words_lists
  end
  
  def show
    respond_with WordsList.find(params[:id])
  end
  
  def create
    respond_with WordsList.create(params[:words_list].merge({'user_id' => params[:user_id]}))
  end
  
  def update
    word = WordsList.find(params[:id])
    respond_with word.update_attributes(params[:word])
  end
  
  def destroy
    respond_with WordsList.destroy(params[:id])
  end

end
