source 'https://rubygems.org'

gem 'jekyll'

# Core plugins that directly affect site building
group :jekyll_plugins do
    gem 'jekyll-3rd-party-libraries'
    gem 'jekyll-cache-bust'
    gem 'jekyll-email-protect'
    gem 'jekyll-imagemagick'
    gem 'jekyll-link-attributes'
    gem 'jekyll-minifier'
    gem 'jekyll-regex-replace'
    gem 'jekyll-scholar'
    gem 'jekyll-sitemap'
    gem 'jekyll-socials'
    gem 'jekyll-terser', :git => "https://github.com/RobertoJBeltran/jekyll-terser.git"

    gem 'classifier-reborn'  # used for content categorization during the build
end

# Installed but not loaded: the site no longer uses these. They stay in the
# Gemfile only so Gemfile.lock (which CI builds from) does not change.
# Gems outside :jekyll_plugins are not auto-loaded by Jekyll.
group :unused_plugins do
    gem 'jekyll-archives-v2'
    gem 'jekyll-feed'
    gem 'jekyll-get-json'
    gem 'jekyll-jupyter-notebook'
    gem 'jekyll-paginate-v2'
    gem 'jekyll-tabs'
    gem 'jekyll-toc'
    gem 'jekyll-twitter-plugin'
    gem 'jemoji'
end

# Gems for development or external data fetching (outside :jekyll_plugins)
group :other_plugins do
    gem 'css_parser'
    gem 'feedjira'
    gem 'httparty'
    gem 'observer'       # used by jekyll-scholar
    gem 'ostruct'        # used by jekyll-twitter-plugin
    # gem 'terser'         # used by jekyll-terser
    # gem 'unicode_utils' -- should be already installed by jekyll
    # gem 'webrick' -- should be already installed by jekyll
end
