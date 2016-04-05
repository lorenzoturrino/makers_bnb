class Space
  include DataMapper::Resource

  property :id, Serial
  property :name, String


  belongs_to :user
end
