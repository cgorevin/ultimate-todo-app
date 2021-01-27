# typed: strict
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TasksController, type: :request do
  # GET /tasks
  describe '#index' do
    it 'returns a 200 OK status' do
      get tasks_path

      expect(response.status).to eq(200)
    end
  end

  # POST /tasks
  describe '#create' do
    context 'when the request is valid' do
      it 'returns a 201 Created status' do
        params = {
          task: {
            name: 'Mop floors'
          }
        }

        post tasks_path, params: params

        expect(json).to_not be_empty
        expect(json[:name]).to eq('Mop floors')
        expect(Task.count).to eq(1)
        expect(response.status).to eq(201)
      end
    end

    context 'when the request is invalid' do
      it 'returns an error with a 400 Bad Request status' do
        post tasks_path, params: { task: { name: nil } }

        expect(json).to_not be_empty
        expect(json[:name]).to eq(["can't be blank"])
        expect(Task.count).to eq(0)
        expect(response.status).to eq(422)
      end
    end
  end

  # PUT /tasks/:id
  describe '#update' do
    context 'when the request is valid' do
      it 'returns a 200 OK status' do
        task = create(:task, name: 'Mop floors')
        updated_params = {
          task: {
            id: task.id,
            name: 'Buy kitty litter'
          }
        }
        expect(task[:name]).to eq('Mop floors')
        expect(Task.count).to eq(1)

        put task_path(id: task.id), params: updated_params

        expect(json).to_not be_empty
        expect(json[:name]).to eq('Buy kitty litter')
        expect(Task.count).to eq(1)
        expect(response.status).to eq(200)
      end
    end

    context 'when the request is invalid' do
      it 'returns an error with a 400 Bad Request status' do
        task = create(:task, name: 'Mop floors')
        updated_params = {
          task: {
            id: task.id,
            name: nil
          }
        }
        expect(task[:name]).to eq('Mop floors')
        expect(Task.count).to eq(1)

        put task_path(id: task.id), params: updated_params

        expect(json).to_not be_empty
        expect(json[:name]).to eq(["can't be blank"])
        expect(Task.count).to eq(1)
        expect(response.status).to eq(422)
      end
    end
  end

  # DELETE /tasks/:id
  describe '#destroy' do
    context 'when a task record is destroyed' do
      it 'returns a "successful" message with a 204 No Content response' do
        task = create(:task)
        expect(Task.count).to eq(1)

        delete task_path(id: task.id)

        expect(response.body).to be_empty
        expect(Task.count).to eq(0)
        expect(response.status).to eq(204)
      end
    end
  end
end
