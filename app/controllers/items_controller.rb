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

  def checked
    post = Test.find(params[:id])
    if post.checked
      post.update(checked: false)
    else
      post.update(checked: true)
    end

    test = Test.find(params[:id])
    render json: { post: test }
  end

  private

  def test_params
    params.require(:test).permit(:exam_id, :number, :question, :choice, :answer, :category_id, :image).merge(user_id: current_user.id)
  end

  def search_test
    @categories = Category.where.not(id: 0)
    @exams = Exam.where.not(id: 0)
    @p = Test.ransack(params[:q])
  end
end
