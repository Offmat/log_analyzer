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
      parsed_statistic(:occurences_count)
    end

    def ordered_by_uniq_occurances
      parsed_statistic(:uniq_occurences_count)
    end

    private

    attr_writer :urls

    def analyze
      verify_file

      parse_file
    end

    def verify_file
      raise(NoFileError) unless File.file?(@file_path)
    end

    def parse_file
      file.each_line do |line|
        url_address, ip_address = line.split

        url = find_or_initialize_url(url_address)
        url.new_occurence(ip_address)
      end
    end

    def find_or_initialize_url(url_address)
      urls.find { |url| url.name == url_address } || urls.push(Url.new(url_address)).last
    end

    def parsed_statistic(statistics_kind)
      urls.sort_by(&statistics_kind).reverse.map do |url|
        {
          name: url.name,
          occurences_count: url.public_send(statistics_kind)
        }
      end
    end

    def file
      File.open(@file_path, 'r')
    end
  end
end
