# frozen_string_literal: true

RSpec.shared_context 'silence output' do
  before do
    @original_stdout = $stdout
    $stdout = File.new('/dev/null', 'w')
  end

  after do
    $stdout = @original_stdout
    @original_stdout = nil
  end
end
