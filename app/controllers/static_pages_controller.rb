class StaticPagesController < ApplicationController
  def home
    @teams = current_user.teams
    @word_of_this_week = WordOfTheWeek.find(Time.now.strftime("%U").to_i + 1)

    if params[:search]
      @users = User.search(params[:search]).order("created_at DESC")
      render json: @users
    end
    @user = current_user

    if current_user.user_results.where(language_id: 1).any?
      @frysk_score = ((current_user.user_results.where(language_id: 1, correctly_answered: true).count.to_f / current_user.user_results.where(language_id: 1).count.to_f) * 100).round
    end
    if current_user.user_results.where(language_id: 2).any?
      @english_score = ((current_user.user_results.where(language_id: 2, correctly_answered: true).count.to_f / current_user.user_results.where(language_id: 2).count.to_f) * 100).round
    end
    if current_user.user_results.where(language_id: 3).any?
      @dutch_score = ((current_user.user_results.where(language_id: 3, correctly_answered: true).count.to_f / current_user.user_results.where(language_id: 3).count.to_f) * 100).round
    end
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

  def choose_game
    get_questions = Question.where(approved: true)
    @question = get_questions.offset(rand(get_questions.count)).first
  end
end
