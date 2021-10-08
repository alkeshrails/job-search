# Search the stackoverflow jobs in the backround
class StackoverflowSearchJob < ApplicationJob
  queue_as :default

  BASE_URI = 'https://stackoverflow.com/jobs/feed'
  LOCATION = 'Munich'

  def perform(search_query)
    Rails.cache.clear
    url = generate_url(search_query)
    response = HTTParty.get(url)
    stored_data(response)
  end

  private

  def generate_url(query)
    "#{BASE_URI}?q=#{query.gsub(' ', '+')}&l=#{LOCATION}"
  end

  def stored_data(response)
    if response.code == 200
      Rails.cache.write('xml', response.body)
    else
      Rails.cache.write('message', response.message)
    end
  end
end
