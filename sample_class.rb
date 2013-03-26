class Gist
  attr_reader :url, :id, :filename, :description, :content
  def initialize(attributes)
    @url = attributes['url']
    @id = attributes['id']
    @filename = attributes['files'].keys.first
    @description = attributes['description']
    @content = attributes['content']
  end

  def self.create(gist, login)
    post_response = Faraday.post do |request|
      request.url 'https://api.github.com/gists'
      request.headers['Authorization'] = "Basic " + Base64.encode64("#{login[:username]}:#{login[:password]}")
      request.body = gist.to_json
    end
  end

  def self.list(login)
    post_response = Faraday.get do |request|
      request.url "https://api.github.com/users/#{login[:username]}/gists"
      request.headers['Authorization'] = "Basic " + Base64.encode64("#{login[:username]}:#{login[:password]}")
      #don't forget to convert this to has via JSON.parse
    end
    if post_response.body.nil?
      false
    else
      JSON.parse(post_response.body).inject([]) { |gist_array, gist_attributes| gist_array << Gist.new(gist_attributes)  }
    end
  end

  def delete(login)
    post_response = Faraday.delete do |request|
      request.url "https://api.github.com/gists/#{@id}"
      request.headers['Authorization'] = "Basic " + Base64.encode64("#{login[:username]}:#{login[:password]}")
    end
  end
end