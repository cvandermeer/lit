class QuestionsController < ApplicationController

	before_action :set_question, only: [:show, :approve_question]

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
		if @question.save
			redirect_to questions_unchecked_questions_path
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