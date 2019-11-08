class ToppagesController < ApplicationController
  def index
    @questions = Question.all
  end
end
