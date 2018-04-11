class AuthorsController < ApplicationController
  before_action :set_author, only: [:edit, :show]

  def show
    @author
  end

  def index
    @authors = Author.all
  end

  def new
  end

  def create
    @author = Author.new(author_params)
    if @author.valid?
      @author.save
      redirect_to author_path(@author)
    else
      render :new
    end
  end

  private

  def author_params
    params.permit(:email, :name)
  end

  def set_author
    @author = Author.find(params[:id])
  end
end
