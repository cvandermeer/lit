class StaticPagesController < ApplicationController
  
  def home
  	@question = Question.where(approved: true).offset(rand(Question.count)).first
  end

  def pick_category
  	@reading = Question.where(category_id: 1, approved: true).offset(rand(Question.count)).first
    @foto_quiz = Question.where(category_id: 2, approved: true).offset(rand(Question.count)).first
  	@writing = Question.where(category_id: 3, approved: true).offset(rand(Question.count)).first
  end

  def pick_language
  	@dutch = Question.where(language: 3, approved: true).offset(rand(Question.count)).first
  	@english = Question.where(language: 2, approved: true).offset(rand(Question.count)).first
  	@frisian = Question.where(language: 1, approved: true).offset(rand(Question.count)).first
  end
end
