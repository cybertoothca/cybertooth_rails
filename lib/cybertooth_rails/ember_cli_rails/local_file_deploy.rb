module CybertoothRails
  module EmberCliRails
    # Using `ember-cli-rails` gem you can serve your Ember application(s) pre-compiled `index.html`.
    # This class's `index_html` method will return the Single Page Application's (SPA) html file;
    # in this case it will return a static html file from inside your Rails application.
    #
    # Notice that this is not for production environments.  Use it in your test and development
    # environments only.
    #
    # Configure the `Rails.root` relative path to your Single Page Application (SPA) index.html file inside
    # your Rails `config/secrets.yml` file.
    #
    # spa_local_index_html_path: 'public/_index.html'
    #
    # Now you need to make sure that this class (`CybertoothRails::EmberCliRails::LocalFileDeploy`) is configured
    # inside your `config/initializers/ember.rb`  Here is an example (see the development & test declarations):
    #
    # ```
    # EmberCli.configure do |c|
    #   c.app :ui, deploy: {
    #       development: CybertoothRails::EmberCliRails::LocalFileDeploy,
    #       production: CybertoothRails::EmberCliRails::S3Deploy,
    #       test: CybertoothRails::EmberCliRails::LocalFileDeploy
    #   }
    # end
    # ```
    #
    # Lastly, make sure your Ember application is mounted inside your `config/routes.rb` file:
    #
    # ```
    # mount_ember_app :ui, to: '/'
    # ```
    #
    # The following redis example gave me the idea to use this technique.
    # @see https://github.com/seanpdoyle/ember-cli-rails-deploy-redis/blob/master/lib/ember_cli/deploy/redis.rb
    class LocalFileDeploy
      def initialize(app)
        @app = app
      end

      def index_html
        open(Rails.root.join(Rails.application.secrets.spa_local_index_html_path)).read
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
