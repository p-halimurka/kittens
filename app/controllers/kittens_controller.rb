class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
  end

  def show
    @kitten = Kitten.find(params[:id])
  end

  def new
    @kitten = Kitten.new
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      flash[:notice] = "Kitten successfully created!"
      redirect_to kitten_path(@kitten)
    else
      flash[:alert] = 'An error occured!'
      render "new"
    end
  end

  def update
    @kitten = Kitten.find(params[:id])
    @kitten.update!(kitten_params)
    redirect_to @kitten
  end

  private

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end
