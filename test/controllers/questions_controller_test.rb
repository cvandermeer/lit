require 'test_helper'

class QuestionsControllerTest < ActionController::TestCase
  setup :login_user, :set_question

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should show question' do
    get :show, id: @question
    assert_response :success
  end

  test 'should get new question link' do
    get :show, id: @question
    assert_response :success
  end

  test 'should destroy question' do
    assert_difference('Question.count', -1) do
      delete :destroy, id: @question.id
    end
    assert_redirected_to questions_unchecked_questions_path
  end

  private

  def login_user
    sign_in users(:one)
  end

  def set_question
    @question = questions(:question1)
  end
end
