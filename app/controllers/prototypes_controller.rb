class PrototypesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  # before_action :set_prototype, only: [:show]

  def index
    @prototypes = Prototype.includes(:user)
  end

  def new
    @prototype = Prototype.new
  end

  def create
    prototype = Prototype.new(prototype_params)
    if prototype.save
      redirect_to root_path
    else
      @prototype = prototype
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
  end
  private

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

  # def set_prototype
  #   @prototype = Prototype.find(params[:id])
  # end

end
