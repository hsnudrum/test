class MailChimpMailer

  def self.subscribe(list_name,email,fname,lname)

    api = Mailchimp::API.new(ENV['MAILCHIMP_API_KEY'])
    
    # Ex "Your home search savings leader"
    list = api.lists({:filters => {:list_name => list_name}})
    id = list["data"].first['id']

    # response = 
      api.listSubscribe({:id => id,
                          :email_address => email,
                          :merge_vars => {
                            'FNAME' => fname.to_s,
                            'LNAME' => lname.to_s 
                          },
                          :double_optin => true,
                          :send_welcome => true})

    #### SAMPLE CALL EXAMPLES ####
    # list of lists
    #    lists = api.lists({:start => 0, :limit=> 100})
    # list by name
    #    list = api.lists({:filters => {:list_name => "Your home search savings leader"}})

  end
end
