LOGIN = {:username => 'username', :password => 'password'}

describe Gist do

  let(:gist_attributes) {{"url"=>"https://api.github.com/gists/5190069", "forks_url"=>"https://api.github.com/gists/5190069/forks", "commits_url"=>"https://api.github.com/gists/5190069/commits", "id"=>"5190069", "git_pull_url"=>"https://gist.github.com/5190069.git", "git_push_url"=>"https://gist.github.com/5190069.git", "html_url"=>"https://gist.github.com/5190069", "files"=>{"test_file"=>{"filename"=>"test_file", "type"=>"text/plain", "language"=>nil, "raw_url"=>"https://gist.github.com/raw/5190069/b56a14eb9e15acf54ffadea9ba78c0de0277debb/test_file", "size"=>19}}, "public"=>true, "created_at"=>"2013-03-18T19:25:54Z", "updated_at"=>"2013-03-18T19:25:54Z", "description"=>"a test gist", "comments"=>0, "user"=>{"login"=>"epicodusstudent", "id"=>3901888, "avatar_url"=>"https://secure.gravatar.com/avatar/780a0ba4ca95f7209bffa6581bfae690?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png", "gravatar_id"=>"780a0ba4ca95f7209bffa6581bfae690", "url"=>"https://api.github.com/users/epicodusstudent", "html_url"=>"https://github.com/epicodusstudent", "followers_url"=>"https://api.github.com/users/epicodusstudent/followers", "following_url"=>"https://api.github.com/users/epicodusstudent/following", "gists_url"=>"https://api.github.com/users/epicodusstudent/gists{/gist_id}", "starred_url"=>"https://api.github.com/users/epicodusstudent/starred{/owner}{/repo}", "subscriptions_url"=>"https://api.github.com/users/epicodusstudent/subscriptions", "organizations_url"=>"https://api.github.com/users/epicodusstudent/orgs", "repos_url"=>"https://api.github.com/users/epicodusstudent/repos", "events_url"=>"https://api.github.com/users/epicodusstudent/events{/privacy}", "received_events_url"=>"https://api.github.com/users/epicodusstudent/received_events", "type"=>"User"}, "comments_url"=>"https://api.github.com/gists/5190069/comments"}}
  let(:gist_response_body) {"[{\"url\":\"https://api.github.com/gists/5190069\",\"forks_url\":\"https://api.github.com/gists/5190069/forks\",\"commits_url\":\"https://api.github.com/gists/5190069/commits\",\"id\":\"5190069\",\"git_pull_url\":\"https://gist.github.com/5190069.git\",\"git_push_url\":\"https://gist.github.com/5190069.git\",\"html_url\":\"https://gist.github.com/5190069\",\"files\":{\"test_file\":{\"filename\":\"test_file\",\"type\":\"text/plain\",\"language\":null,\"raw_url\":\"https://gist.github.com/raw/5190069/b56a14eb9e15acf54ffadea9ba78c0de0277debb/test_file\",\"size\":19}},\"public\":true,\"created_at\":\"2013-03-18T19:25:54Z\",\"updated_at\":\"2013-03-18T19:25:54Z\",\"description\":\"a test gist\",\"comments\":0,\"user\":{\"login\":\"epicodusstudent\",\"id\":3901888,\"avatar_url\":\"https://secure.gravatar.com/avatar/780a0ba4ca95f7209bffa6581bfae690?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png\",\"gravatar_id\":\"780a0ba4ca95f7209bffa6581bfae690\",\"url\":\"https://api.github.com/users/epicodusstudent\",\"html_url\":\"https://github.com/epicodusstudent\",\"followers_url\":\"https://api.github.com/users/epicodusstudent/followers\",\"following_url\":\"https://api.github.com/users/epicodusstudent/following\",\"gists_url\":\"https://api.github.com/users/epicodusstudent/gists{/gist_id}\",\"starred_url\":\"https://api.github.com/users/epicodusstudent/starred{/owner}{/repo}\",\"subscriptions_url\":\"https://api.github.com/users/epicodusstudent/subscriptions\",\"organizations_url\":\"https://api.github.com/users/epicodusstudent/orgs\",\"repos_url\":\"https://api.github.com/users/epicodusstudent/repos\",\"events_url\":\"https://api.github.com/users/epicodusstudent/events{/privacy}\",\"received_events_url\":\"https://api.github.com/users/epicodusstudent/received_events\",\"type\":\"User\"},\"comments_url\":\"https://api.github.com/gists/5190069/comments\"},{\"url\":\"https://api.github.com/gists/5190065\",\"forks_url\":\"https://api.github.com/gists/5190065/forks\",\"commits_url\":\"https://api.github.com/gists/5190065/commits\",\"id\":\"5190065\",\"git_pull_url\":\"https://gist.github.com/5190065.git\",\"git_push_url\":\"https://gist.github.com/5190065.git\",\"html_url\":\"https://gist.github.com/5190065\",\"files\":{\"test_file\":{\"filename\":\"test_file\",\"type\":\"text/plain\",\"language\":null,\"raw_url\":\"https://gist.github.com/raw/5190065/b56a14eb9e15acf54ffadea9ba78c0de0277debb/test_file\",\"size\":19}},\"public\":true,\"created_at\":\"2013-03-18T19:25:17Z\",\"updated_at\":\"2013-03-18T19:25:17Z\",\"description\":\"a test gist\",\"comments\":0,\"user\":{\"login\":\"epicodusstudent\",\"id\":3901888,\"avatar_url\":\"https://secure.gravatar.com/avatar/780a0ba4ca95f7209bffa6581bfae690?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png\",\"gravatar_id\":\"780a0ba4ca95f7209bffa6581bfae690\",\"url\":\"https://api.github.com/users/epicodusstudent\",\"html_url\":\"https://github.com/epicodusstudent\",\"followers_url\":\"https://api.github.com/users/epicodusstudent/followers\",\"following_url\":\"https://api.github.com/users/epicodusstudent/following\",\"gists_url\":\"https://api.github.com/users/epicodusstudent/gists{/gist_id}\",\"starred_url\":\"https://api.github.com/users/epicodusstudent/starred{/owner}{/repo}\",\"subscriptions_url\":\"https://api.github.com/users/epicodusstudent/subscriptions\",\"organizations_url\":\"https://api.github.com/users/epicodusstudent/orgs\",\"repos_url\":\"https://api.github.com/users/epicodusstudent/repos\",\"events_url\":\"https://api.github.com/users/epicodusstudent/events{/privacy}\",\"received_events_url\":\"https://api.github.com/users/epicodusstudent/received_events\",\"type\":\"User\"},\"comments_url\":\"https://api.github.com/gists/5190065/comments\"},{\"url\":\"https://api.github.com/gists/5190055\",\"forks_url\":\"https://api.github.com/gists/5190055/forks\",\"commits_url\":\"https://api.github.com/gists/5190055/commits\",\"id\":\"5190055\",\"git_pull_url\":\"https://gist.github.com/5190055.git\",\"git_push_url\":\"https://gist.github.com/5190055.git\",\"html_url\":\"https://gist.github.com/5190055\",\"files\":{\"test_file\":{\"filename\":\"test_file\",\"type\":\"text/plain\",\"language\":null,\"raw_url\":\"https://gist.github.com/raw/5190055/b56a14eb9e15acf54ffadea9ba78c0de0277debb/test_file\",\"size\":19}},\"public\":true,\"created_at\":\"2013-03-18T19:24:24Z\",\"updated_at\":\"2013-03-18T19:24:24Z\",\"description\":\"a test gist\",\"comments\":0,\"user\":{\"login\":\"epicodusstudent\",\"id\":3901888,\"avatar_url\":\"https://secure.gravatar.com/avatar/780a0ba4ca95f7209bffa6581bfae690?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png\",\"gravatar_id\":\"780a0ba4ca95f7209bffa6581bfae690\",\"url\":\"https://api.github.com/users/epicodusstudent\",\"html_url\":\"https://github.com/epicodusstudent\",\"followers_url\":\"https://api.github.com/users/epicodusstudent/followers\",\"following_url\":\"https://api.github.com/users/epicodusstudent/following\",\"gists_url\":\"https://api.github.com/users/epicodusstudent/gists{/gist_id}\",\"starred_url\":\"https://api.github.com/users/epicodusstudent/starred{/owner}{/repo}\",\"subscriptions_url\":\"https://api.github.com/users/epicodusstudent/subscriptions\",\"organizations_url\":\"https://api.github.com/users/epicodusstudent/orgs\",\"repos_url\":\"https://api.github.com/users/epicodusstudent/repos\",\"events_url\":\"https://api.github.com/users/epicodusstudent/events{/privacy}\",\"received_events_url\":\"https://api.github.com/users/epicodusstudent/received_events\",\"type\":\"User\"},\"comments_url\":\"https://api.github.com/gists/5190055/comments\"},{\"url\":\"https://api.github.com/gists/5189509\",\"forks_url\":\"https://api.github.com/gists/5189509/forks\",\"commits_url\":\"https://api.github.com/gists/5189509/commits\",\"id\":\"5189509\",\"git_pull_url\":\"https://gist.github.com/5189509.git\",\"git_push_url\":\"https://gist.github.com/5189509.git\",\"html_url\":\"https://gist.github.com/5189509\",\"files\":{\"test_file.rb\":{\"filename\":\"test_file.rb\",\"type\":\"application/ruby\",\"language\":\"Ruby\",\"raw_url\":\"https://gist.github.com/raw/5189509/b56a14eb9e15acf54ffadea9ba78c0de0277debb/test_file.rb\",\"size\":19}},\"public\":true,\"created_at\":\"2013-03-18T18:24:46Z\",\"updated_at\":\"2013-03-18T18:24:46Z\",\"description\":\"a test gist\",\"comments\":0,\"user\":{\"login\":\"epicodusstudent\",\"id\":3901888,\"avatar_url\":\"https://secure.gravatar.com/avatar/780a0ba4ca95f7209bffa6581bfae690?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png\",\"gravatar_id\":\"780a0ba4ca95f7209bffa6581bfae690\",\"url\":\"https://api.github.com/users/epicodusstudent\",\"html_url\":\"https://github.com/epicodusstudent\",\"followers_url\":\"https://api.github.com/users/epicodusstudent/followers\",\"following_url\":\"https://api.github.com/users/epicodusstudent/following\",\"gists_url\":\"https://api.github.com/users/epicodusstudent/gists{/gist_id}\",\"starred_url\":\"https://api.github.com/users/epicodusstudent/starred{/owner}{/repo}\",\"subscriptions_url\":\"https://api.github.com/users/epicodusstudent/subscriptions\",\"organizations_url\":\"https://api.github.com/users/epicodusstudent/orgs\",\"repos_url\":\"https://api.github.com/users/epicodusstudent/repos\",\"events_url\":\"https://api.github.com/users/epicodusstudent/events{/privacy}\",\"received_events_url\":\"https://api.github.com/users/epicodusstudent/received_events\",\"type\":\"User\"},\"comments_url\":\"https://api.github.com/gists/5189509/comments\"},{\"url\":\"https://api.github.com/gists/5189502\",\"forks_url\":\"https://api.github.com/gists/5189502/forks\",\"commits_url\":\"https://api.github.com/gists/5189502/commits\",\"id\":\"5189502\",\"git_pull_url\":\"https://gist.github.com/5189502.git\",\"git_push_url\":\"https://gist.github.com/5189502.git\",\"html_url\":\"https://gist.github.com/5189502\",\"files\":{\"test_file.rb\":{\"filename\":\"test_file.rb\",\"type\":\"application/ruby\",\"language\":\"Ruby\",\"raw_url\":\"https://gist.github.com/raw/5189502/b56a14eb9e15acf54ffadea9ba78c0de0277debb/test_file.rb\",\"size\":19}},\"public\":true,\"created_at\":\"2013-03-18T18:23:58Z\",\"updated_at\":\"2013-03-18T18:23:58Z\",\"description\":\"a test gist\",\"comments\":0,\"user\":{\"login\":\"epicodusstudent\",\"id\":3901888,\"avatar_url\":\"https://secure.gravatar.com/avatar/780a0ba4ca95f7209bffa6581bfae690?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png\",\"gravatar_id\":\"780a0ba4ca95f7209bffa6581bfae690\",\"url\":\"https://api.github.com/users/epicodusstudent\",\"html_url\":\"https://github.com/epicodusstudent\",\"followers_url\":\"https://api.github.com/users/epicodusstudent/followers\",\"following_url\":\"https://api.github.com/users/epicodusstudent/following\",\"gists_url\":\"https://api.github.com/users/epicodusstudent/gists{/gist_id}\",\"starred_url\":\"https://api.github.com/users/epicodusstudent/starred{/owner}{/repo}\",\"subscriptions_url\":\"https://api.github.com/users/epicodusstudent/subscriptions\",\"organizations_url\":\"https://api.github.com/users/epicodusstudent/orgs\",\"repos_url\":\"https://api.github.com/users/epicodusstudent/repos\",\"events_url\":\"https://api.github.com/users/epicodusstudent/events{/privacy}\",\"received_events_url\":\"https://api.github.com/users/epicodusstudent/received_events\",\"type\":\"User\"},\"comments_url\":\"https://api.github.com/gists/5189502/comments\"}]" }


  context 'attr_readers' do
    it 'returns the url for a gist' do
      gist = Gist.new(gist_attributes)
      gist.url.should eq "https://api.github.com/gists/5190069"
    end

    it 'returns the id for a gist' do
      gist = Gist.new(gist_attributes)
      gist.id.should eq "5190069"
    end

    it 'returns the filename for a gist' do
      gist = Gist.new(gist_attributes)
      gist.filename.should eq "test_file"
    end

    it 'returns the description for a gist' do
      gist = Gist.new(gist_attributes)
      gist.description.should eq "a test gist"
    end

    it 'returns the content for a gist' do
      gist = Gist.new(gist_attributes)
      gist.content.should eq "a test gist"
    end
  end

  context '.create' do
    it 'POSTs a new Gist to the user\'s account' do #Create
      stub = stub_request(:post, "https://username:password@api.github.com/gists").
         with(:body => {"{\"public\":\"true\",\"description\":\"a test gist\",\"files\":{\"test_file.rb\":{\"content\":\"puts \\\"hello world!\\\"\"}}}"=>true},
              :headers => {'Accept'=>'*/*', 'Content-Type'=>'application/x-www-form-urlencoded', 'User-Agent'=>'Faraday v0.8.6'}).
         to_return(:status => 200, :body => "", :headers => {})

      gist = {:public => 'true',
              :description => 'a test gist',
              :files => {'test_file.rb' => {:content => 'puts "hello world!"'}}}
      Gist.create(gist, LOGIN)

      stub.should have_been_requested
    end
  end

  context '.list' do
    it 'GETs a Gist in the user\'s account' do #Read
      stub = stub_request(:get, "https://username:password@api.github.com/users/username/gists").
         with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Faraday v0.8.6'}).
         to_return(:status => 200, :body => "", :headers => {})
      Gist.list(LOGIN)
      stub.should have_been_requested
    end

    it 'returns an array of Gist objects containing github info' do
       stub = stub_request(:get, "https://username:password@api.github.com/users/username/gists").
         with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Faraday v0.8.6'}).
         to_return(:status => 200, :body => gist_response_body, :headers => {})
      gists = Gist.list(LOGIN)
      gists.first.id.should eq "5190069"      
    end

  end

  context '.delete' do #Destroy
    it 'DELETEs a Gist in the user\'s account' do
      stub = stub_request(:delete, "https://username:password@api.github.com/gists/5190069").
         with(:headers => {'Accept'=>'*/*', 'User-Agent'=>'Faraday v0.8.6'}).
         to_return(:status => 200, :body => "", :headers => {})
      gist = Gist.new(gist_attributes)
      gist.delete(LOGIN)
      stub.should have_been_requested      
    end 
  end