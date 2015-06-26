class StaticPagesController < ApplicationController
  def home
    @teams = current_user.teams
    @word_of_this_week = WordOfTheWeek.get_back_this_week

    @frysk_score = current_user.get_back_all(1)
    @english_score = current_user.get_back_all(2)
    @dutch_score = current_user.get_back_all(3)
  end

  def pick_category
    @reading = Question.get_back_one_random_question(category_id: 1)
    @foto_quiz = Question.get_back_one_random_question(category_id: 2)
  	@writing = Question.get_back_one_random_question(category_id: 3)
  end

  def pick_language
  	@dutch = Question.get_back_one_random_question(language: 3)
  	@english = Question.get_back_one_random_question(language: 2)
  	@frisian = Question.get_back_one_random_question(language: 1)
  end

  def choose_game
    get_questions = Question.where(approved: true)
    @question = get_questions.offset(rand(get_questions.count)).first
  end


end
