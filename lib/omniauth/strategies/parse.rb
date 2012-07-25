require 'omniauth'
require 'faraday'

module OmniAuth
  module Strategies
    class Parse
      include OmniAuth::Strategy

      PARSE_LOGIN = {:site => "https://api.parse.com", :path => "1/login"}

      option :fields, [:username, :password]
      option :uid_field, :username

      def initialize(app, options = {})
        @application_id = options[:application_id] or raise "application_id is required for initialization"
        @rest_api_key = options[:rest_api_key] or raise "rest_api_key is required for initialization"
        super
      end

      def request_phase
        form = OmniAuth::Form.new(:title => "Parse.com Info", :url => callback_path)
          form.text_field :username, :username
          form.password_field :password, :password
        form.button "Sign In"
        form.to_response
      end

      def callback_phase
        @raw_data = is_valid_user
        return fail!(:invalid_credentials) unless @raw_data
        debugger
        super
      end

      def is_valid_user
        conn = Faraday.new(:url => PARSE_LOGIN[:site]) do |req|
          req.request :url_encoded
          req.adapter  Faraday.default_adapter
        end

        result = conn.get do |req|
          req.url PARSE_LOGIN[:path]
          req.headers['X-Parse-Application-Id'] = @application_id
          req.headers['X-Parse-REST-API-Key'] = @rest_api_key
          req.params['username'] = request.params["username"]
          req.params['password'] = request.params["password"]
        end
        unless result.status == 200
          #logging?
          return false
        end
        return result.body
      end
    end
  end
end
