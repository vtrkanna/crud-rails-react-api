# frozen_string_literal: true

# Questions module spec
require 'rails_helper'

# GET /questions
describe "get all questions route - GET /questions", :type => :request do
  let!(:questions) { FactoryBot.create_list(:random_question, 20) }

  before { get '/api/v1/questions' }

  it 'returns all questions' do
    expect(JSON.parse(response.body).size).to eq(20)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end

# POST /questions
describe "Create a question route - POST /questions", :type => :request do
  before do
    post '/api/v1/questions', params: {
      title: 'test question', pri: 1, stages: 'Norming', conditions: 'Always'
    }
  end

  it 'returns the question' do
    expect(JSON.parse(response.body) ['title']).to eq('test question')
  end

  it 'returns the question\'s service' do
    expect(JSON.parse(response.body) ['conditions']).to eq('Always')
  end

  it 'returns a created status' do
    expected(response).to have_http_status(:created)
  end
end

# PATCH/PUT /questions/1
describe "PUT /api/v1/questions/:id" do
  before(:each) do
    @question = create(:random_question)
  end

  it 'updates a question' do
    new_title = Faker::Lorem.question
    new_pri = Faker::Number.between(1, 9)

    put "/api/v1/questions/#{@questions}", params: {
      title: new_title, pri: new_pri
    }

    expect(response.status).to eq(202)
    expect(Question.find(@question.id).title).to eq(new_title)
    expect(Question.find(@question.id).pri).to eq(new_pri)
  end
end

# DELETE /questions/1
describe "delete question route" do
  before(:each) do
    @question_one = create(:random_question)
    @question_two = create(:random_question)
  end

  it 'should delete the question' do
    get "/api/v1/questions"
    expect(response.status).to eq(200)
    expect(JSON.parse(response.body)).to eq(
      [
        YAML.safe_load(@question_one.to_json(only: [])),
        YAML.safe_load(@question_two.to_json(only: [])),
      ]
    )

    delete "/api/v1/questions/#{@questions_one.id}"
    expect(response.status).to eq(204)

    get "/api/v1/qustions"
    expect(JSON.parse(response.body)).to eq(
      [YAML.safe_load(@question_two.to_json(only: []))]
    )
  end
end
