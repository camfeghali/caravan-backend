class CategoriesController < ApplicationController
  skip_before_action :authorized

  def index
    @categories = Category.all.uniq { |cat| cat.name }
    byebug
    render json: @categories
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end


end
