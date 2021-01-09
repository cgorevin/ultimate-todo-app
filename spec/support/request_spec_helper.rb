# frozen_string_literal: true

# method taken from Austin Kabiru's API tutorial
module RequestSpecHelper
  def json
    JSON.parse(response.body).deep_symbolize_keys
  end
end
