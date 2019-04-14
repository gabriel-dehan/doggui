# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://www.doggui.fr"
SitemapGenerator::Sitemap.create_index = true

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  add '/legislation'
  add '/qui-sommes-nous'
  add '/dogs', :priority => 0.9, :changefreq => 'daily'
  #
  # Add all articles:
  #
  Dog.all.each do |dog|
    add dog_path(dog), :lastmod => dog.updated_at
  end
end
