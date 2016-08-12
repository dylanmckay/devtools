require_relative '../command'
require_relative '../project'

class SpecialFolder < Command
  FOLDER_TYPES = [
    :models, :controllers, :views, :presenters, :services,
  ]

  def run
    folder_type = ARGV[1]

    unless folder_type
      $stdout.puts "you must specify the folder type on the command line"
      exit 1
    end

    if t = FOLDER_TYPES.find { |type| folder_type.to_sym == type }
      dir = send(t)

      if Dir.exist?(dir)
        $stdout.puts dir
      else
        $stderr.puts "there is no directory at '#{dir}'"
      end
    else
      $stdout.puts "don't know that folder type"
      $stdout.puts "choose one of: #{FOLDER_TYPES.join(', ')}"
      exit 1
    end
  end

  protected

  %w(models controllers views presenters decorators services).each do |t|
    define_method t, lambda {
      project_root + "/app/#{t}"
    }
  end

  def project_root
    @project_root ||= Project.parent_repository_path(Dir.getwd)
  end
end

