# frozen_string_literal: true

# Mappings Controller
class Api::V1::MappingsController < ApplicationController
  before_action :set_mapping, only: [:show, :update, :destroy]

  # GET /mappings
  def index
    @mappings = Mapping.all

    render json: @mappings
  end

  # GET /mappings/1
  def show
    render json: @mapping
  end

  # POST /mappings
  def create
    @mapping = Mapping.new(mapping_params)

    if @mapping.save
      render json: @mapping, status: :created, location: @mapping
    else
      render json: @mapping.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /mappings/1
  def update
    if @mapping.update(mapping_params)
      render json: @mapping
    else
      render json: @mapping.errors, status: :unprocessable_entity
    end
  end

  # DELETE /mappings/1
  def destroy
    @mapping.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mapping
      @mapping = Mapping.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def mapping_params
      params.fetch(:mapping, {})
    end
end
