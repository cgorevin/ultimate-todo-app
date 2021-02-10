# typed: true
# frozen_string_literal: true

class TasksController < ApplicationController
  def index
    @tasks = Task.all
    render json: @tasks, status: :ok
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      render json: @task, status: :created
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      render json: @task, status: :ok
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    render json: 'Deleted successfully', status: :no_content
  end

  private

  def task_params
    params.require(:task).permit(:name)
  end
end
