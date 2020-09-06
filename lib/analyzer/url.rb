# frozen_string_literal: true

module Analyzer
  class Url
    attr_reader :name, :occurences

    def initialize(name, occurences)
      @name = name
      @occurences = occurences
    end

    def occurences_count
      occurences.count
    end

    def uniq_occurences_count
      occurences.uniq.count
    end
  end
end
