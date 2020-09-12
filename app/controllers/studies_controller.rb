class StudiesController < ApplicationController

  def create
    test = Test.find(params[:item_id])
    if Study.find_or_create_by(user_id:current_user.id, test_id: test.id) 
    else
      redirect_to root_path
    end
  end

  def destroy
    test = Test.find(params[:item_id])
    if study = Study.find_by(user_id: current_user.id, test_id: test.id)
      study.delete
    else
      redirect_to root_path
    end
  end

end
