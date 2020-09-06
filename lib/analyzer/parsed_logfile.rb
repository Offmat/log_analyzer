# frozen_string_literal: true

module Analyzer
  class ParsedLogfile
    class NoFileError < StandardError; end
    attr_reader :urls

    def initialize(file_path)
      @file_path = file_path
      @urls = []
      analyze
    end

    def ordered_by_occurances
      urls.sort_by(&:occurences_count).reverse
    end

    def ordered_by_uniq_occurances
      urls.sort_by(&:uniq_occurences_count).reverse
    end

    private

    def analyze
      veryfy_file

      grouped_urls.each do |name, occurences|
        @urls << Analyzer::Url.new(name, occurences.flatten)
      end
    end

    def grouped_urls
      raw_urls.group_by(&:shift)
    end

    def raw_urls
      file.map(&:split)
    end

    def veryfy_file
      raise(NoFileError) unless File.file?(@file_path)
    end

    def file
      File.open(@file_path, 'r')
    end
  end
end
