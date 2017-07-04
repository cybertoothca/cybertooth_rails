module CybertoothRails
  module EmberCliRails
    # Using `ember-cli-rails` gem you can serve your Ember application(s) pre-compiled `index.html`.
    # This class's `index_html` method must return the SPA's html file; in this case it will be the static
    # `public/_index.html` file inside this Rails application.
    #
    # The following redis example gave me the idea to use this technique.
    # @see https://github.com/seanpdoyle/ember-cli-rails-deploy-redis/blob/master/lib/ember_cli/deploy/redis.rb
    class LocalFileDeploy
      def initialize(app)
        @app = app
      end

      def index_html
        open(Rails.root.join('public/_index.html')).read
      end

      def mountable?
        false
      end

      def to_rack
        raise NotImplementedError
      end
    end
  end
end
