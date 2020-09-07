# frozen_string_literal: true

module Analyzer
  class Url
    attr_reader :name, :occurences_count

    def initialize(name)
      @name = name
      @occurences_count = 0
      @uniq_occurences = Set.new
    end

    def new_occurence(ip_address)
      @occurences_count += 1
      @uniq_occurences << ip_address
    end

    def uniq_occurences_count
      @uniq_occurences.count
    end
  end
end
