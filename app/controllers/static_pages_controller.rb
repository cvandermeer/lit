class StaticPagesController < ApplicationController
  
  before_action :set_user_results, only: [:home]

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

  private

    def set_user_results
      fries_id = Language.where(title: 'Fries').first.id
      @fries_user_results_true = current_user.user_results.where(language_id: fries_id, correctly_answered: true).count
      @fries_user_results_false = current_user.user_results.where(language_id: fries_id, correctly_answered: false).count
    end

end
