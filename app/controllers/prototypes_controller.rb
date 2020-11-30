class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:edit, :show ,:update ,:destroy]
  before_action :authenticate_user!, only:[:new, :destroy,:create,:edit,:update]
  before_action :move_to, only: [:edit, :update, :destroy]
  def index
    @prototypes=Prototype.all

  end

  def new
    @prototype = Prototype.new
  end

  def edit
  end

  def destroy
     @prototype.destroy
      redirect_to root_path
    end

  def show
    @comment = Comment.new
    @comments = @prototype.comments
  end

  def create
    @prototype = Prototype.create(prototype_params)
    if @prototype.save
      redirect_to root_path
    else 
      render :new
    end
  end

  def update
    @prototype.update(prototype_params)
    if @prototype.save
      redirect_to prototype_path(@prototype)
    else 
      render :edit
    end
  end

  private

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept,:image).merge(user_id: current_user.id)
  end

  def set_prototype
  @prototype = Prototype.find(params[:id])
  end

  def move_to
    redirect_to root_path unless current_user == @prototype.user
  end
  
  

end
