require 'rails_helper'
require 'pry'
describe "get all quotes route", :type => :request do
  let!(:quotes) { FactoryGirl.create_list(:quote, 22)}

  before { get '/quotes'}

  it 'returns all quotes' do

    expect(JSON.parse(response.body).size).to eq(22)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end

describe "return errors when request doesn't match requirements", :type => :request do
  it 'returns a not_found error when quote doesnt exist' do
    quote = FactoryGirl.create(:quote)
    get '/quotes/0'
    expect(response).to have_http_status(:not_found)
  end
end

describe "get a single quote route", :type => :request do
  it 'returns a single quote' do
    quote = FactoryGirl.create(:quote)
    get "/quotes/#{quote.id}"
    expect(response).to be_success
    expect(JSON.parse(response.body)['content']).to eq(quote.content)
  end
end
