require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  test 'should not create question without any input' do
    question = Question.new
    assert_not question.save, 'Saved a question without input'
  end

  test 'should not create question without category id' do
  	question = Question.new(title: 'test', language_id: 1)
  	assert_not question.save, 'Saved a question without an category id'
  end

  test 'should not create question without language id' do
  	question = Question.new(title: 'test', category_id: 1)
  	assert_not question.save, 'Saved a question without an language id'
  end
end