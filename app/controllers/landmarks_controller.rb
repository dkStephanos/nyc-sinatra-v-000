require 'pry'

class LandmarksController < ApplicationController

  get '/landmarks' do
    @landmarks = Landmark.all
    #binding.pry
    erb :'landmarks/index'
  end

  get '/landmarks/new' do

    erb :'landmarks/new'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])

    erb :'landmarks/edit'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])

    erb :'landmarks/show'
  end

  post '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    @landmark.name = params[:landmark]["name"]
    @landmark.year_completed = params[:landmark]["year_completed"]
    @landmark.save

    redirect to "landmarks/#{@landmark.id}"
  end

  post '/landmarks' do
    @landmark = Landmark.find_or_create_by(name: params[:landmark]["name"])
    @landmark.year_completed = params[:landmark]["year_completed"]
    @landmark.save

    redirect to "landmarks/#{@landmark.id}"
  end
end
