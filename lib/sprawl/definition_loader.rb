require 'sprawl/loaders/directory_loader'
require 'sprawl/loaders/single_git_loader'
require 'sprawl/loaders/multi_git_loader'

module Sprawl
  class DefinitionLoader
    TYPES = {
      directory: DirectoryLoader,
      single: SingleGitLoader,
      group: MultiGitLoader
    }.freeze

    def self.load(options)
      puts 'Loading Service Definitions' if options[:verbose]
      service_definitions = TYPES[options[:location_type]].load(options)

      puts "Loaded service definitions: #{service_definitions.inspect}" if options[:verbose]

      service_definitions
    end
  end
end
