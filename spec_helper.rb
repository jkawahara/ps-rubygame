  # This enables the traditional should syntax
  RSpec.configure do |config|
    config.expect_with :rspec do |c|
      c.syntax = [:should, :expect]
    end
    config.mock_with :rspec do |c|
      c.syntax = [:should, :expect]
    end
  end
