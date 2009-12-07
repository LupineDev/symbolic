module Symbolic
  class Variable < Symbolic::Operations
    attr_accessor :name, :proc
    attr_writer :value

    def initialize(options={}, &proc)
      @name, @value = options.values_at(:name, :value)
      @proc = proc
    end

    def value
      @value || @proc && @proc.call
    end

    def to_s
      @name || 'unnamed_variable'
    end

    def variables
      [self]
    end

    def undefined_variables
      value ? [] : variables
    end

    def detailed_operations
      Hash.new 0
    end
  end
end