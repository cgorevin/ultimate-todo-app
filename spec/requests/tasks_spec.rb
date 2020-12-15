# typed: strict
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TasksController, type: :request do
  context 'when POSTing a new task' do
    it 'will return a "HELLO" message' do
      expect(1 + 1).to eq(3)
    end
  end
end
