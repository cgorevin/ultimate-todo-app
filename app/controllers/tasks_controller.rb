# typed: true
# frozen_string_literal: true

class TasksController < ApplicationController
  def index
    @tasks = Task.all
    render json: @tasks, status: 200
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      render json: @task, status: :created
    else
      payload = {
        error: 'Unable to save this task',
        status: 400,
      }
      render json: payload, status: :bad_request
    end
  end

  def update; end

  def show; end

  def destroy; end

  private

  def task_params
    params.require(:task).permit(:name)
  end
end
