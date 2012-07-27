require File.dirname(__FILE__) + '/../../spec_helper'

describe OmniAuth::Strategies::Parse, :type=> :strategy do
  include OmniAuth::Test::StrategyTestCase
  def strategy
    @server_url ||= 'https://api.parse.com'
    @application_name ||= 'bogus_app'
    @application_password ||= 'bogus_app_password'
    [OmniAuth::Strategies::Parse, {:server_url => @crowd_server_url, :application_name=>@application_name, :application_password=>@application_password}]
  end

  describe "somthing" do
    it "should be" do
      True.should be == True
    end
  end
end



