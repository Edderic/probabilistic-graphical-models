module ProbabilisticGraphicalModels
  class Variable
    attr_reader :name
    attr_accessor :neighbors

    def initialize(name:)
      @name = name
      @neighbors = []
    end
  end
end
