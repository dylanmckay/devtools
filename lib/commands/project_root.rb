require_relative '../command'
require_relative '../project'

class ProjectRoot < Command
  # Find path of project root

  def run
    project_root = Project.parent_repository_path(Dir.getwd)

    if project_root
      $stdout.puts project_root
    else
      $stderr.puts "no parent repository"
    end

    exit 1 unless project_root
  end
end

