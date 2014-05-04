require 'spec_helper'

describe RatesController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'create'" do
    it "returns http success" do
      get 'create'
      response.should be_success
    end
  end

  describe "GET 'get_more_data'" do
    it "returns http success" do
      get 'get_more_data'
      response.should be_success
    end
  end

end
