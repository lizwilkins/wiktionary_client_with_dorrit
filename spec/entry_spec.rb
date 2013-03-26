require 'spec_helper'

describe Entry do 
  context '#initialize' do 
    it 'creates an instance of Entry with two arguments' do
      dictionary_entry = {'word' => 'cat', 'definition' => 'opposite of dog'}
      Entry.new(dictionary_entry).should be_an_instance_of Entry
    end
  end

  context 'readers' do 
    it 'accesses the word variable' do
      dictionary_entry = {'word' => 'cat', 'definition' => 'opposite of dog'}
      Entry.new(dictionary_entry).word.should eq "cat"
    end

    it 'accesses the definition variable' do
      dictionary_entry = {'word' => 'cat', 'definition' => 'opposite of dog'}
      Entry.new(dictionary_entry).definition.should eq "opposite of dog"
    end

    it 'accesses the id variable' do
      dictionary_entry = {'word' => 'cat', 'definition' => 'opposite of dog', 'id' => '5190069'}
      Entry.new(dictionary_entry).id.should eq "5190069"
    end
 
  end

  context '#add' do
    it 'POSTs a new definition to Wiktionary' do
      stub = stub_request(:post, "http://localhost:3000/wiktionary").
         with(:body => {"{\"word\":\"cat\",\"definition\":\"opposite of dog\"}"=>true}).
         to_return(:status => 200, :body => "")

      dictionary_entry = {'word' => 'cat', 'definition' => 'opposite of dog'}
      Entry.create(dictionary_entry)

      stub.should have_been_requested
    end
  end 

  context '#delete' do
    it 'DELETEs an entry in Wiktionary' do 
     stub = stub_request(:delete, "http://localhost:3000/wiktionary/5190069").
       to_return(:status => 200, :body => "") 
      dictionary_entry = {'word' => 'cat', 'definition' => 'opposite of dog', 'id' => '5190069'}
      entry_to_delete = Entry.new(dictionary_entry)
      entry_to_delete.delete
      stub.should have_been_requested

     end
   end

  context '.find' do 
    it 'GETs a word and definition pair' do 
     stub = stub_request(:post, "http://localhost:3000/wiktionary").
         with(:body => {"{\"word\":\"cat\",\"definition\":\"opposite of dog\"}"=>true}).
         to_return(:status => 200, :body => "")
      dictionary_entry = {'word' => 'cat', 'definition' => 'opposite of dog'}
      Entry.create(dictionary_entry)

     stub = stub_request(:post, "http://localhost:3000/wiktionary").
         with(:body => {"{\"word\":\"dog\",\"definition\":\"opposite of cat\"}"=>true}).
         to_return(:status => 200, :body => "")
      dictionary_entry = {'word' => 'dog', 'definition' => 'opposite of cat'}
      Entry.create(dictionary_entry)

      stub = stub_request(:get, "http://localhost:3000/wiktionary").
        to_return(:status => 200, :body => "[{\"word\":\"cat\",\"definition\":\"opposite of dog\"}, {\"word\":\"dog\",\"definition\":\"opposite of cat\"}]") 
      Entry.find('cat').definition.should eq 'opposite of dog'
    end
  end

  context '.list' do
    it 'returns an array of all the words and definitions in Wiktionary' do 
     stub = stub_request(:post, "http://localhost:3000/wiktionary").
         with(:body => {"{\"word\":\"cat\",\"definition\":\"opposite of dog\"}"=>true}).
         to_return(:status => 200, :body => "")
      dictionary_entry = {'word' => 'cat', 'definition' => 'opposite of dog'}
      Entry.create(dictionary_entry)

     stub = stub_request(:post, "http://localhost:3000/wiktionary").
         with(:body => {"{\"word\":\"dog\",\"definition\":\"opposite of cat\"}"=>true}).
         to_return(:status => 200, :body => "")
      dictionary_entry = {'word' => 'dog', 'definition' => 'opposite of cat'}
      Entry.create(dictionary_entry)

      stub = stub_request(:get, "http://localhost:3000/wiktionary").
        to_return(:status => 200, :body => "[{\"word\":\"cat\",\"definition\":\"opposite of dog\"}, {\"word\":\"dog\",\"definition\":\"opposite of cat\"}]") 
      Entry.list.first.word.should eq "cat"
    end
  end

  context '#update' do
    it 'allows you to edit word or definition' do
     stub = stub_request(:post, "http://localhost:3000/wiktionary").
         with(:body => {"{\"word\":\"cat\",\"definition\":\"opposite of dog\"}"=>true}).
         to_return(:status => 200, :body => "")
      dictionary_entry = {'word' => 'cat', 'definition' => 'opposite of dog'}
      Entry.create(dictionary_entry)

     stub = stub_request(:post, "http://localhost:3000/wiktionary").
         with(:body => {"{\"word\":\"dog\",\"definition\":\"opposite of cat\"}"=>true}).
         to_return(:status => 200, :body => "")
      dictionary_entry = {'word' => 'dog', 'definition' => 'opposite of cat'}
      Entry.create(dictionary_entry)

      stub = stub_request(:get, "http://localhost:3000/wiktionary").
        to_return(:status => 200, :body => "[{\"word\":\"cat\",\"definition\":\"opposite of dog\"}, {\"word\":\"dog\",\"definition\":\"opposite of cat\"}]") 
 
      entry = Entry.find('cat')
      stub = stub_request(:put, "http://localhost:3000/wiktionary").
        with(:body => {"{\"definition\":\"mans best friend\"}"=>true},
      :headers => {'Accept'=>'*/*', 'Content-Type'=>'application/x-www-form-urlencoded', 'User-Agent'=>'Faraday v0.8.7'}).
        to_return(:status => 200, :body => "") 
     
      entry.update('definition' => "mans best friend")
        stub.should have_been_requested
      # entry.definition.should eq "mans best friend"
    end
  end



 end



