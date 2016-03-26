require 'cliches/railtie'
require 'rails'
require 'rails/generators/base'

# :nodoc:
module Cliches
  # :nodoc:
  class NewGenerator < Rails::Generators::NamedBase
    source_root File.join(File.dirname(__FILE__), "templates")

    def create_cliche
      template 'new_cliche.rb', File.join(Rails.configuration.cliches.directory, "#{file_name}.rb")
    end
  end
end