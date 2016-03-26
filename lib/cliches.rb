require "cliches/version"
require "cliches/definition"

if defined?(Rails)
  require 'cliches/active_record_extension'
  require 'cliches/test_extension'
  require 'cliches/railtie'
end

module Cliches
end