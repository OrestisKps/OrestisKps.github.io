# frozen_string_literal: true

# jekyll-cache-bust's `bust_css_cache` digests the directory 'assets/_sass',
# which does not exist in this site -- the Sass sources live in _sass/ and
# assets/css/. Dir[] therefore matched nothing, the digest was the MD5 of an
# empty string (d41d8cd98f00b204e9800998ecf8427e) on every build, and the
# stylesheet URL never changed. Returning visitors kept whatever main.css they
# had cached, so style changes appeared not to deploy.
#
# This filter digests the real Sass sources instead, so the query string moves
# whenever the compiled CSS could have changed.

require 'digest/md5'

module Jekyll
  module StylesheetCacheBust
    SOURCE_GLOBS = ['_sass/**/*.scss', 'assets/css/**/*.scss'].freeze

    def bust_stylesheet_cache(file_name)
      "#{file_name}?v=#{Jekyll::StylesheetCacheBust.digest}"
    end

    # Deliberately not memoised: under `jekyll serve --watch` a cached digest
    # would go stale the moment a partial is edited, which is the exact bug
    # this replaces. Re-reading a few dozen .scss files per page is cheap.
    def self.digest
      contents = SOURCE_GLOBS
                 .flat_map { |glob| Dir[glob] }
                 .reject { |path| File.directory?(path) }
                 .sort
                 .map { |path| File.read(path, mode: 'rb') }
                 .join
      Digest::MD5.hexdigest(contents)
    end
  end
end

Liquid::Template.register_filter(Jekyll::StylesheetCacheBust)
