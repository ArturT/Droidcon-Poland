module Middlewares
  class Droidcon
    def initialize(app)
      @app = app
    end

    def call(env)
      request = Rack::Request.new(env)
      if request.host.starts_with?("www.")
        [301, {"Location" => "http://droidcon.pl"}, self]
      else
        @app.call(env)
      end
    end

    def each(&block)
    end
  end
end
