# frozen_string_literal: true

module Analyzer
  class ParsedLogfile
    def initialize(file_path)
      @file_path = file_path
    end

    def call; end
  end
end
