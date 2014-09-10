class QuestionsController < ApplicationController
  before_filter :authorize, except: [:index]

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

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
      flash[:notice] = "Question Deleted."
      redirect_to questions_path
  end

  private
  def question_params
    params.require(:question).permit(:user_id, :title, :content).merge(:user_id => current_user.id)
  end
end
