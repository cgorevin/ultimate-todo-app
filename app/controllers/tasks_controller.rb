# frozen_string_literal: true

class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def create; end

  def new; end

  def edit; end

  def update; end

  def show; end

  def destroy; end
end
