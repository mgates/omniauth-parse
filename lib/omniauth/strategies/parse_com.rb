require 'omniauth'
require 'faraday'

module OmniAuth
  module Strategies
    class ParseCom
      include OmniAuth::Strategy

      PARSE_LOGIN = {:site => "https://api.parse.com", :path => "1/login"}

      option :fields, [:name, :username]
      option :uid_field, :username

      def initialize(configuration)
        @application_id = configuration[:application_id] or raise "application_id is required for initialization"
        @rest_api_key = configuration[:rest_api_key] or raise "rest_api_key is required for initialization"
      end

      def request_phase
        form = OmniAuth::Form.new(:title => "Parse.com Info", :url => callback_path)
          options.fields.each do |field|
          form.text_field field.to_s.capitalize.gsub("_", " "), field.to_s
        end
        form.button "Sign In"
        form.to_response
      end

      def callback_phase
        return fail!(:invalid_credentials) unless is_valid_user
        super
      end

      def is_valid_user
        conn = Faraday.new(:url => PARSE_LOGIN[:site]) do |req|
          req.request :url_encoded
          faraday.adapter  Faraday.default_adapter
        end

        result = conn.get do |req|
          req.url PARSE_LOGIN[:path]
          req.headers['X-Parse-Application-Id'] = @application_id
          req.headers['X-Parse-REST-API-Key'] = @rest_api_key
          req.params['username'] = "XXX"
          req.params['password'] = "XXX"
        end

        unless result.status == "200"
          #logging?
          return false
        end

      end

    end
  end
end
