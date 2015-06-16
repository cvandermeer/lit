class StaticPagesController < ApplicationController
  def home
  	get_questions = Question.where(approved: true)
    @question = get_questions.offset(rand(get_questions.count)).first
    @teams = current_user.teams
    @word_of_this_week = WordOfTheWeek.find(Time.now.strftime("%U").to_i + 1)

    if params[:search]
      @users = User.search(params[:search]).order("created_at DESC")
      render json: @users
    end
    @user = current_user
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
