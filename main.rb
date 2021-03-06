require 'pg'
require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/activerecord'

set :database, {
              :adapter => 'postgresql',
              :database => 'westeros',
              :host => 'localhost'
}

class House < ActiveRecord::Base
  has_many :people
end

class Person < ActiveRecord::Base
  belongs_to :house
end

get '/' do
  redirect to('/houses')
end

get '/houses' do
 @houses = House.all
  erb :houses
end

get '/houses/new' do
  erb :new_house
end

post '/houses/new' do
  house = House.create(params)
  redirect to "houses/#{house.id}"
end

get '/people/new' do
  sql = "SELECT id, name FROM houses"
  @houses = run_sql(sql)
  erb :new_person
end

post '/people/new' do
  name = params[:name]
  weapon = params[:weapon]
  age = params[:age]
  living = params[:living]
  if living == 'on'
    living = true
  else
    living = false
  end
  image = params[:image]
  house_id = params[:house_id]
  sql = "INSERT INTO people (name, weapon, age, image, house_id) VALUES ('#{name}', '#{weapon}', #{age}, '#{image}', #{house_id})"
  run_sql(sql)
  redirect to '/people'
end

get '/people' do
  sql = "SELECT * FROM people"
  @people = run_sql(sql)
  erb :people
end

get '/people/:id' do
  id = params[:id]
  sql = "SELECT * FROM people WHERE id = #{id}"
  @person = run_sql(sql).first
  erb :person
end

get '/houses/:id' do
  id = params[:id]
  sql = "SELECT * FROM houses WHERE id = #{id}"
  @house = run_sql(sql).first
  erb :house
end
