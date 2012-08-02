class WordsController < ApplicationController

  respond_to :json
  
  def index
    respond_with Word.all
  end
  
  def show
    respond_with Word.find(params[:id])
  end
  
  def create
    respond_with Word.create(params[:word])
  end
  
  def update
    word = Word.find(params[:id])
    respond_with word.update_attributes(params[:word])
  end
  
  def destroy
    respond_with Word.destroy(params[:id])
  end

end
