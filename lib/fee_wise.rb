require 'httparty'

class FeeWise
  include HTTParty
  format :json

  # secureapi/searchbyzip?publickey=xxxxx&nonce=xxxxx&agentid=xxxxx&format=xxxxx
  def self.find_agentdata_by_agent_id(id)

    publickey=8675308
    timestamp=Time.new.to_i
    agentid=id
    resulttype='json'
    uri = "secureapi/agentdata?publickey=#{publickey}&nonce=#{timestamp}&agentid=#{agentid}&format=#{resulttype}"
    host = "http://dev.leadplace.com/"
    apikey = Gibberish::HMAC("eddb3934207f170654190d816686990187b8ddcab0486b966e36b73fdf", "#{uri}", :digest => :sha256)
    response = get("#{host}#{uri}",:headers => {'APIKEY' => apikey})
    json_response = JSON.load(response.body)
  end

  # secureapi/searchbyzip?publickey=xxxxx&nonce=xxxxx&zipcode=xxxxx&agenttype=xxxxx&format=xxxxx
  def self.find_by_zip(zip)
    publickey=8675309
    timestamp=Time.new.to_i
    zipcode=zip
    agenttype=1
    resulttype='json'
    uri = "secureapi/searchbyzip?publickey=#{publickey}&nonce=#{timestamp}&zipcode=#{zip}&agenttype=#{agenttype}&format=#{resulttype}"
    host = "http://dev.leadplace.com/"
    apikey = Gibberish::HMAC("4c7d682f42663e6d6972296b3c5a233d2d5d624d3a3645792f597b7928", "#{uri}", :digest => :sha256)
    response = get("#{host}#{uri}",:headers => {'APIKEY' => apikey})
    json_response = JSON.load(response.body)
  end

  # secureapi/tradingpartneremail/publickey/xxxxx/nonce/xxxxx/format/xxxxx
  def send_mail(user)

    publickey="deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef"
    timestamp=Time.new.to_i
    resulttype='json'

    reference=user.id_with_card_token #feewise_id
    sender= user.full_name ? user.full_name : user.email
    copy_to= "founders@leadplace.com"
    subject="We have a new customer (#{sender}) or a customer has updated their Home Preferences"
    message="Info about #{sender}"
    full_name = user.full_name
    email = user.email
    started = user.created_at.to_date
    location = user.purchase_preference.location
    min_price = user.purchase_preference.min_price
    max_price = user.purchase_preference.max_price
    time_frame = user.purchase_preference.time_frame
    phone = user.purchase_preference.daytime_phone


    # uri = "secureapi/searchbyzip?publickey=#{publickey}&nonce=#{timestamp}&format=#{resulttype}"
    uri = "secureapi/tradingpartneremail/publickey/#{publickey}/nonce/#{timestamp}/format/#{resulttype}"

    host = "http://dev.leadplace.com/"
    apikey = Gibberish::HMAC("4c7d682f42663e6d6972296b3c5a233d2d5d624d3a3645792f597b7928", "#{uri}", :digest => :sha256)

    # response = get("#{host}#{uri}",:headers => {'APIKEY' => apikey})
    # pp delicious.posts(:query => {:tag => 'ruby'})
    # Twitter.post('/statuses/update.json', :query => {:status => "It's an HTTParty and everyone is invited!"})

    query = {
      :reference=>"#{reference}"
      :sender=>"#{sender}"
      :copy_to=>"#{copy_to}"
      :subject=>"#{subject}"
      :message=>"#{message}"
      :full_name =>"#{full_name}"
      :email =>"#{email}"
      :started =>"#{started}"
      :location =>"#{location}"
      :min_price =>"#{min_price}"
      :max_price =>"#{max_price}"
      :time_frame =>"#{time_frame}"
      :phone =>"#{phone}"
    }

    response = post( "#{host}#{uri}", ::headers => {'APIKEY' => apikey}, :query => query )

    json_response = JSON.load(response.body)
  end



end
