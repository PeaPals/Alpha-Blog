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
      searched_results[:users] += User.where("username like ?", "%#{word}%")
      searched_results[:articles] += Article.where("title like ?", "%#{word}%")
      searched_results[:categories] += Category.where("name like ?", "%#{word}%")
    end

    return searched_results
  end



end
