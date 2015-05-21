class QuestionsController < ApplicationController

	before_action :set_question, only: [:show, :approve_question, :submit_answer]

	def show

	end

	def new
		@question = Question.new
	end

	def create
		@question = Question.new(question_params)
		@question.user_id = current_user.id
		if @question.save
			redirect_to root_path, notice: 'Vraag aangemaakt'
		else
			render 'new', notice: 'Vraag aanmaak mislukt'
		end
	end

	def unchecked_questions
		@questions = Question.where(approved: false)
	end

	def approve_question
		@question.approved = true
		@question.user.points = @question.user.points + 10
		@question.user.save
		if @question.save
			redirect_to questions_unchecked_questions_path
		end
	end

	def submit_answer
		answer = Answer.find(params[:answer_id])
		if answer.id == @question.correct_answer_id
			current_user.points = current_user.points + 1
			current_user.save
			UserResult.create(user: current_user, category: @question.category, language: @question.language, correctly_answered: true)
			redirect_to root_path, notice: 'Nice'
		else
			UserResult.create(user: current_user, category: @question.category, language: @question.language, correctly_answered: false)
			redirect_to @question, notice: 'fail'
		end
	end
	
	private

		def set_question
			@question = Question.find(params[:id])
		end

		def question_params
			params.require(:question).permit(:title, :language_id, :category_id, answers_attributes: [:id, :title, :_destroy])
		end

end