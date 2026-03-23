module TrackScriptInjector
  def self.track_script(site)
    @track_script ||= begin
      path = File.join(site.source, "_includes", "track-script.html")
      if File.file?(path)
        File.read(path)
      end
    end
  end

  def self.inject_script(page)
    script = track_script(page.site)
    return unless script
    return unless page.output.include?("</body>")

    page.output.sub!("</body>", "#{script}\n</body>")
  end
end

[:pages, :documents].each do |type|
  Jekyll::Hooks.register type, :post_render do |page|
    next unless page.output_ext == ".html"
    TrackScriptInjector.inject_script(page)
  end
end
