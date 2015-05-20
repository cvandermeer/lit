class StaticPagesController < ApplicationController
  def home
  	@question = Question.order('RANDOM()').first
  end

  def pick_category
  	@reading = Question.where(category: 1).order('RANDOM()').first
  	@writing = Question.where(category: 2).order('RANDOM()').first
  end

  def pick_language
  	@dutch = Question.where(language: 3).order('RANDOM()').first
  	@english = Question.where(language: 2).order('RANDOM()').first
  	@frisian = Question.where(language: 1).order('RANDOM()').first
  end
end
