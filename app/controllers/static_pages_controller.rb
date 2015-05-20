class StaticPagesController < ApplicationController
  def home
  	@question = Question.where(approved: true).order('RANDOM()').first
  end

  def pick_category
  	@reading = Question.where(category: 1, approved: true).order('RANDOM()').first
  	@writing = Question.where(category: 2, approved: true).order('RANDOM()').first
  end

  def pick_language
  	@dutch = Question.where(language: 3, approved: true).order('RANDOM()').first
  	@english = Question.where(language: 2, approved: true).order('RANDOM()').first
  	@frisian = Question.where(language: 1, approved: true).order('RANDOM()').first
  end
end
