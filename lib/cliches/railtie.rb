require 'rails'
require 'rails/railtie'

module Cliches
  class Railtie < ::Rails::Railtie
    config.cliches = ActiveSupport::OrderedOptions.new
    config.cliches.directory = 'test/cliches'

    initializer "cliches.load_files" do |app|
      Dir[File.join(app.config.cliches.directory, '*.rb')].each {|file| load file }
    end

    initializer "cliches.extend_testcase" do
      ActiveSupport::TestCase.include(Cliches::TestExtension)
    end

    initializer "cliches.extend_activerecord" do
      ActiveRecord::Base.extend(Cliches::ActiveRecordExtension)
    end
  end
end