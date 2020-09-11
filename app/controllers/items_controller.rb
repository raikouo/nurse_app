class ItemsController < ApplicationController
  def index
  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)
    if @test.valid?
      @test.save
      redirect_to root_path
    else
      render :new
    end
  end

  def search
    @tests = Test.all
  end

  private

  def test_params
    params.require(:test).permit(:time, :number, :question, :choice, :answer, :category, :image)
  end
end
