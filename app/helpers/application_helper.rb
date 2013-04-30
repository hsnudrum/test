module ApplicationHelper

  def display_heading(locals = {})
    locals.reverse_merge! :heading_text => 'feeWise'
    render :partial => 'static_pages/page_head', :locals => locals
  end

  def display_numbered_account_line(code, message, state = "TBD", how_to = nil)
    render :partial => "accounts/display_account_line", :locals => {:code => code, :message => message, :state => state, :how_to => how_to}
  end

    # <h1> <span class="sam"> <span class="myfg"> &#x2713; </span>  Register with FeeWise </span></h1>


  def yield_or(name, content = nil, &block)
    if content_for?(name)
      content_for(name)
    else
      block_given? ? capture(&block) : content
    end
  end

  # USAGE for above helper

  # So you could do
  # < %= yield_or :something, 'default content' %>

  # or
  # < %= yield_or :something do %>
  #     block of default content
  # < % end %>

  # Where the default can be overridden using
  # < %= content_for :something do %>
  #     overridding content
  # < % end %>




end
