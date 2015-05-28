class StaticPagesController < ApplicationController
  
  def home
  	@question = Question.where(approved: true).offset(rand(Question.count)).first
  end

  def pick_category
  	@reading = Question.where(category_id: 1, approved: true).offset(rand(Question.where(category_id: 1, approved: true).count)).first
    @foto_quiz = Question.where(category_id: 2, approved: true).offset(rand(Question.where(category_id: 2, approved: true).count)).first
  	@writing = Question.where(category_id: 3, approved: true).offset(rand(Question.where(category_id: 3, approved: true).count)).first
  end

  def pick_language
  	@dutch = Question.where(language: 3, approved: true).offset(rand(Question.where(language: 3, approved: true).count)).first
  	@english = Question.where(language: 2, approved: true).offset(rand(Question.where(language: 2, approved: true).count)).first
  	@frisian = Question.where(language: 1, approved: true).offset(rand(Question.where(language: 1, approved: true).count)).first
  end
end
