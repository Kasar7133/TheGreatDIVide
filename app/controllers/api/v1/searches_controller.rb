require 'net/https'
class Api::V1::SearchesController < ApplicationController

    def create
        @searchData = params["searchData"]

        http = Net::HTTP.new('api.igdb.com',443)
        http.use_ssl = true
        request = Net::HTTP::Post.new(URI('https://api.igdb.com/v4/search'), {'Client-ID' => "#{ENV["THE_ID"]}", 'Authorization' => "Bearer #{ENV["THE_KEY"]}"})
        request.body = "fields name; search \"#{@searchData}\";"
        response = http.request(request).body
        gameData = JSON.parse response
        render json: gameData
    end


end