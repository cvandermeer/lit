class QuestionsController < ApplicationController

	before_action :set_question, only: [:show, :approve_question, :submit_answer, :show_check, :edit, :update, :destroy]
	before_action :set_new_question, only: [:new, :new_write_word, :new_choose_image]
	before_action :check_admin, only: [:unchecked_questions, :show_check, :approve_question, :index]

	def show
		get_questions = Question.where.not(id: @question.id).where(approved: true)
		@question_random = get_questions.offset(rand(get_questions.count)).first
	end

	def new
	end

	def new_write_word
	end

	def new_choose_image
	end

	def index
		@questions = Question.where(approved: true)
	end

	def create
		@question = Question.new(question_params)
		@question.user_id = current_user.id
		if @question.save
			redirect_to root_path, notice: 'Vraag aangemaakt'
		elsif @question.category_id == 1
			render 'new', notice: 'Vraag aanmaak mislukt'
		elsif @question.category_id == 2
			render 'new_choose_image', notice: 'Vraag aanmaak mislukt'
		else
			render 'new_write_word', notice: 'Vraag aanmaak mislukt'
		end
	end

	def unchecked_questions
		@questions = Question.where(approved: false)
	end

	def show_check
	end

	def edit
	end

	def update
    if @question.update(question_params)
      redirect_to show_check_path(@question), notice: 'Vraag is aangepast'
    else
      render 'edit', notice: 'Aanpassen mislukt'
    end
	end

	def destroy
		@question.destroy
		redirect_to questions_unchecked_questions_path, notice: 'Vraag is verwijdert'
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
			current_user.points = current_user.points + 2
			current_user.memberships.where(accepted: true).each do |m|
				m.points = m.points + 1
				m.save
			end
			current_user.save
			UserResult.create(user: current_user, category: @question.category, language: @question.language, correctly_answered: true)
		else
			UserResult.create(user: current_user, category: @question.category, language: @question.language, correctly_answered: false)
		end

		render json: @question
	end

	private
		def set_question
			@question = Question.find(params[:id])
		end

		def set_new_question
			@question = Question.new
		end

		def question_params
			params.require(:question).permit(:title, :image, :image_cache, :language_id, :category_id, answers_attributes: [:id, :title, :image, :image_cache, :_destroy])
		end

		def check_admin
			if !current_user.admin == true
				redirect_to root_path, notice: 'Je hebt hier niet genoeg rechten voor!'
			end
		end
end