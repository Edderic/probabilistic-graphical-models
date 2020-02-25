module ProbabilisticGraphicalModels
  class Variable
    attr_reader :name, :neighbors

    def initialize(name:)
      @name = name
      @neighbors = []
    end
  end
end
