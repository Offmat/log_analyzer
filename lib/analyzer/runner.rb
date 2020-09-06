# frozen_string_literal: true

module Analyzer
  class Runner
    def initialize(file_path)
      @file_path = file_path
    end

    def call
      return print_no_path_error unless path_provided?

      present_results
    end

    private

    def path_provided?
      !@file_path.nil? && !@file_path.empty?
    end

    def print_no_path_error
      puts 'File path is missing'
    end

    def present_results
      puts 'Most viewed urls:'
      print_list(parsed_logfile.ordered_by_occurances)

      puts "\nMost (uniquely) viewed urls:"
      print_list(parsed_logfile.ordered_by_uniq_occurances)
    end

    def print_list(collection)
      collection.map do |a|
        puts "#{a[:name]} -> #{a[:occurences_count]}"
      end
    end

    def parsed_logfile
      @parsed_logfile ||= ParsedLogfile.new(@file_path)
    end
  end
end
