module Project
  def self.parent_repository_path(current_path)
    while Dir.exist?(current_path) && !is_git_repository?(current_path)
      current_path = File.expand_path("#{current_path}/..")
    end

    current_path = nil unless Dir.exist?(current_path)
    current_path
  end

  def self.is_git_repository?(path)
    Dir.exist?("#{path}/.git")
  end
end

