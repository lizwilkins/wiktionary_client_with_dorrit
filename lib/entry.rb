class Entry

  attr_reader :word, :definition, :id

  def initialize(dictionary_entry)
    @id = dictionary_entry['id']
    @word = dictionary_entry['word']
    @definition = dictionary_entry['definition']
  end

  def self.create(dictionary_entry)
    post_response = Faraday.post do |request|
      request.url 'http://localhost:3000/entries'
      request.body = dictionary_entry.to_json
    end
  end


  def delete
    post_response = Faraday.delete do |request| 
      request.url "http://localhost:3000/entries/#{@id}"
    end
  end

  def self.list
    post_response = Faraday.get do |request| 
      request.url 'http://localhost:3000/entries'
    end
    if post_response.body.nil?
      false
    else
      # binding.pry
      JSON.parse(post_response.body).inject([]) do |entry_array, dictionary_entry| 
       
        entry_array << Entry.new('id' => dictionary_entry['entry']['id'], 'word' => dictionary_entry['entry']['word'], 'definition' => dictionary_entry['entry']['definition'])
      end

      # JSON.parse(post_response.body).inject([]) do |entry_array, dictionary_entry| 
      #   p dictionary_entry
      #   p dictionary_entry['entry']['word']
      #   entry_array << Entry.new(dictionary_entry)
      # end

    end
  end

  def self.find(word)
    p entries = self.list
    entries.each {|entry| return entry if entry.word == "#{word}"}
  end


  def update(dictionary_entry)
   put_response = Faraday.put do |request|
    request.url "http://localhost:3000/entries/#{@id}"
    request.body = dictionary_entry.to_json
   end
  end

end