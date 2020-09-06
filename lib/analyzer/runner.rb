# frozen_string_literal: true

module Analyzer
  class Runner
    def initialize(file_path)
      @file_path = file_path
    end

    def call
      path_provided? ? parse_logfile : print_no_path_error
    end

    private

    def parse_logfile
      ParsedLogfile.new(@file_path).call
    end

    def path_provided?
      !@file_path.nil? && !@file_path.empty?
    end

    def print_no_path_error
      puts 'File path is missing'
    end
  end
end
