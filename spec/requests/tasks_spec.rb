# typed: strict
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TasksController, type: :request do
  # GET /tasks
  describe '#index' do
    it 'returns a 200 OK status' do
      get '/tasks'

      expect(response.status).to eq(200)
    end
  end

  # POST /tasks
  describe '#create' do
    context 'when the request is valid' do
      it 'returns a 200 OK status' do
        params = { task: { name: 'Mop floors' } }

        post '/tasks', params: params
        json = JSON.parse(response.body)

        expect(json).to_not be_empty
        expect(json['name']).to eq('Mop floors')
        expect(response.status).to eq(201)
      end
    end

    context 'when the request is invalid' do
      it 'returns an error with a 400 Bad Request status' do
        params = { task: { name: nil } }

        post '/tasks', params: params
        json = JSON.parse(response.body)

        expect(json).to_not be_empty
        expect(json['error']).to eq('Unable to save this task')
        expect(response.status).to eq(400)
      end
    end
  end
end
