class Entry

  attr_reader :word, :definition, :id

  def initialize(dictionary_entry)
    @id = dictionary_entry['id']
    @word = dictionary_entry['word']
    @definition = dictionary_entry['definition']
  end

  def self.create(dictionary_entry)
    post_response = Faraday.post do |request|
      request.url 'http://localhost:3000/wiktionary'
      request.body = dictionary_entry.to_json
    end
  end

  def delete
    post_response = Faraday.delete do |request| 
      request.url "http://localhost:3000/wiktionary/#{@id}"
    end
  end

  def self.list
    post_response = Faraday.get do |request| 
      request.url 'http://localhost:3000/wiktionary'
    end
    if post_response.body.nil?
      false
    else
      # binding.pry
      JSON.parse(post_response.body).inject([]) { |entry_array, dictionary_entry| entry_array << Entry.new(dictionary_entry)}
    end
  end

  def self.find(word)
    entries = self.list
    entries.each {|entry| return entry if entry.word == "#{word}"}
  end

  def update(dictionary_entry)
     put_response = Faraday.put do |request|
      request.url 'http://localhost:3000/wiktionary'
      request.body = dictionary_entry.to_json
     end
    #replace def or the word with the new def or word
  end

end