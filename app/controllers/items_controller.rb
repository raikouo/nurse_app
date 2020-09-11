class ItemsController < ApplicationController

  before_action :search_test, only: [:index, :search]

  def index
    @tests = Test.all
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
    @results = @p.result
  end

  private

  def test_params
    params.require(:test).permit(:time, :number, :question, :choice, :answer, :category, :image)
  end

  def search_test
    @categories = Category.where.not(id: 0)
    @exams = Exam.where.not(id: 0)
    @p = Test.ransack(params[:q])
  end

end