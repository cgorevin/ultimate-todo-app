# typed: strict
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TasksController, type: :request do
  # POST /tasks
  describe 'POST /tasks' do
    context 'when the request is valid' do
      it 'returns a "hello" message and an 200 OK status' do
        params = { name: 'Practice Spanish' }

        post '/tasks', params: params

        expect(response.body).to eq('hello')
        expect(response.status).to eq(200)
      end
    end
  end
end
