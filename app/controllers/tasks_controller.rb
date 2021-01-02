# typed: true
# frozen_string_literal: true

class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      render json: 'hello'
    else
      render error: { error: 'Unable to create Task' }, status: 400
    end
  end

  def update; end

  def show; end

  def destroy; end

  private

  def task_params
    params.permit(:name)
  end
end
