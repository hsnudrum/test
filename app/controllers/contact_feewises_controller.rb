class ContactFeewisesController < InheritedResources::Base
  after_filter :finish_ab_test, :only => [:create]
end
