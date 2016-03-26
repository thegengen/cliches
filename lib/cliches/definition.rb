# :nodoc:
module Cliches
  def self.define(name)
    Definition.new(name).register
  end

  # A class that holds the basic definition of a cliche.
  class Definition
    attr_reader :name
    attr_reader :value

    # Initialize a cliche with the given +name+ and set its value to an empty hash.
    #
    # +name+ will be converted to a symbol
    def initialize(name)
      @name = name.to_sym
      @value = {}
    end

    # Set the value of a definition as being +value+.
    def as(value)
      @value = value
    end

    # Finds the definition with a given +name+. Returns +nil+ if it there is none.
    def self.find(name)
      definitions[name]
    end

    # Registers a definition. This will override any existing definition with the same name.
    def register
      self.class.definitions[name] = self
      self
    end

    private

    def self.definitions
      @definitions ||= {}
    end

    def self.reset!
      @definitions = {}
    end
  end
end
