# frozen_string_literal: true

# Questions Controller
class Api::V1::QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :update, :destroy]

  # GET /questions
  def index
    @questions = Question.all

    render json: @questions
  end

  # GET /questions/1
  def show
    render json: @question
  end

  # POST /questions
  def create
    @question = Question.new(question_params)

    if @question.save
      render json: @question, status: :created, location: @question
    else
      render json: @question.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /questions/1
  def update
    if @question.update(question_params)
      render json: @question
    else
      render json: @question.errors, status: :unprocessable_entity
    end
  end

  # DELETE /questions/1
  def destroy
    @question.destroy
  end

  # POST /questions/import
  def import
    status, errors, rows = CsvParser.new(import_params[:csv_file])
    if status == true
      Question.create(rows)
      rendor json: {message: 'successfully updated', count: rows.rows}
    else
      render json: errors, status: :unprocessable_entity
    end
  end

private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def question_params
      params.fetch(:question, {})
    end

    def import_params
      params.require(:csv_file)
    end
end
