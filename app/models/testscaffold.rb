class Testscaffold < ActiveRecord::Base
  belongs_to :myreferencesxx
  attr_accessible :mybinaryxx, :mybooleanxx, :mydatetimexx, :mydatexx, :mydecimalxx, :myfloatxx, :myintegerxx, :mystringxx, :mytextxx, :mytimestampxx, :mytimexx, :myreferencesxx, :myreferencesxx_id

  validates_presence_of :mydecimalxx

end
