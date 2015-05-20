class QuestionsController < ApplicationController

	before_action :set_question, only: [:show]

	def show

	end

	def new
		@question = Question.new
	end

	def create
		@question = Question.new(question_params)
		if @question.save
			redirect_to root_path, notice: 'Vraag aangemaakt'
		else
			render 'new', notice: 'Vraag aanmaak mislukt'
		end
	end

	def unchecked_questions
		@questions = Question.where(approved: false)
	end

	private

		def set_question
			@question = Question.find(params[:id])
		end

		def question_params
			params.require(:question).permit(:title, :answer, :language_id, :category_id)
		end

end