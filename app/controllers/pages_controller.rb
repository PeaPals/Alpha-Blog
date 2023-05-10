class PagesController < ApplicationController

  def home
    searchphrase = params[:searchphrase]

    if searchphrase && searchphrase != ""
      searchphrase = searchphrase.strip.split(' ')
      @searched_results = search_results(searchphrase)
    end

    render json: {searchResults: @searched_results}
  end


  def search_results(searchphrase)
    searched_results = {:users => [], :articles => [], :categories => []}

    searchphrase.each do |word|
      searched_results[:users] += User.where("LOWER(username) like ?", "%#{word.downcase}%")
      searched_results[:articles] += Article.where("LOWER(title) like ?", "%#{word.downcase}%")
      searched_results[:categories] += Category.where("LOWER(name) like ?", "%#{word.downcase}%")
    end

    return searched_results
  end



end
