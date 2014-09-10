class AnswersController < ApplicationController
  before_filter :authorize

  def new
    @answer = Answer.new
  end

  def create
    @question = Question.find(params[:id])
    @answer = Answer.create(answer_params)
    if @answer.valid?
      flash[:notice] = "Thank you for your answer."
      respond_to do |format|
        format.html { redirect_to question_path(@question) }
        format.js
      end
    else
      flash[:alert] = "No Bueno."
      render new_question_answer_path(@question)
    end
  end

  def show
    @answer = Answer.find(params[:id])
  end

  def edit
    @answer = Answer.find(params[:id])
  end

  def update
    @answer = Answer.find(params[:id])
    if @answer.update(answer_params)
      flash[:notice] = "Answer Edited."
      redirect_to question_path(@question)
    else
      flash[:alert] = "No Bueno."
      render edit_question_answer_path(@question)
    end
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    flash[:notice] = "Your Answer Has Been Deleted."
    redirect_to question_path(@question)
  end
end
