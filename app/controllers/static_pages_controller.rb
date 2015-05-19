class StaticPagesController < ApplicationController
  def home
  	@question = Question.order('RANDOM()').first
  end
end
