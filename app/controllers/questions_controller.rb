class QuestionController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.create(question_params)
    if @question.valid?
      flash[:notice] = "Question Added."
      redirect_to question_path(@question)
    else
      flash[:alert] = "No Bueno."
      render 'new'
  end

  def show
    @question = Question.find(params[:id])
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      flash[:notice] = "Question Updated."
      redirect_to question_path(@question)
    else
      flash[:alert] = "No Bueno."
      render 'edit'
    end
  end

  def delete
    @question = Question.find(params[:id])
    @question.destroy
      flash[:notice] = "Question Deleted."
      redirect_to questions_path
  end
end
