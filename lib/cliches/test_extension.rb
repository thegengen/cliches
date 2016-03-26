# :nodoc:
module Cliches::TestExtension
  def cliches(name)
    Cliches::Definition.find(name).value
  end
end