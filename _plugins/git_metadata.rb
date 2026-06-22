require "open3"
require "time"

module Jekyll
  class GitMetadataGenerator < Generator
    safe true
    priority :low

    def generate(site)
      iso_time = git_output(site.source, "log", "-1", "--format=%cI", "--", ".")
      commit = git_output(site.source, "log", "-1", "--format=%h", "--", ".")

      return if iso_time.empty?

      time = Time.parse(iso_time)
      site.data["git"] ||= {}
      site.data["git"]["last_updated"] = iso_time
      site.data["git"]["last_updated_display"] = time.strftime("%B %d, %Y")
      site.data["git"]["last_updated_short"] = time.strftime("%Y-%m-%d")
      site.data["git"]["last_updated_commit"] = commit unless commit.empty?
    rescue StandardError => e
      Jekyll.logger.warn "Git metadata:", e.message
    end

    private

    def git_output(source, *args)
      output, status = Open3.capture2("git", "-C", source, *args)
      status.success? ? output.strip : ""
    end
  end
end
