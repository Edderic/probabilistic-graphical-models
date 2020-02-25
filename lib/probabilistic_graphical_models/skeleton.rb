module ProbabilisticGraphicalModels
  class Skeleton
    def initialize(variable_names:)
      @variable_names = variable_names
      @variables = variable_names.map do |var_name|
        Variable.new(name: var_name)
      end
    end

    def complete!
      @variables.each do |var_1|
        @variables.each do |var_2|
          next if var_1.name == var_2.name

          var_1.neighbors << var_2
          var_2.neighbors << var_1
        end
      end
    end

    def find_variable(string_name)
      @variables.find { |var| var.name == string_name }
    end
  end
end
