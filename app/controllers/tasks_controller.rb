# typed: true
# frozen_string_literal: true

class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def create; end

  def new
    @tasks = Task.new
  end

  def edit; end

  def update; end

  def show
    render json: {
      'hello': 'world',
    }
  end

  def destroy; end

  private

  def task_params
    params.permit(:name)
  end
end
