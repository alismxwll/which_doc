class AnswersController < ApplicationController
  before_filter :authorize

  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
    respond_to do |format|
      format.html { redirect_to question_path(@question) }
      format.js
    end
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.create(answer_params)
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
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    respond_to do |format|
      format.html { redirect_to question_path(@question) }
      format.js
    end
  end

  def update
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    if @answer.update(answer_params)
      flash[:notice] = "Answer Edited."
      respond_to do |format|
        format.html { redirect_to question_path(@question) }
        format.js
      end
    else
      flash[:alert] = "No Bueno."
      render edit_question_answer_path(@question)
    end
  end

  def destroy
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    @answer.destroy
    flash[:notice] = "Your Answer Has Been Deleted."
    respond_to do |format|
      format.html { redirect_to questions_path}
      format.js
    end
  end

private
  def answer_params
    params.require(:answer).permit(:question_id, :content).merge(:user_id => current_user.id)
  end

end

