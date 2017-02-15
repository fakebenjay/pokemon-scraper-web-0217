require 'pry'

class Pokemon
  attr_accessor :id
  attr_reader :name, :type, :db

  def initialize(id:, db:, name:, type:)
    @id = id
    @db = db
    @name = name
    @type = type
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    query = db.execute("SELECT * FROM pokemon WHERE id=#{id}")[0]
    binding.pry
    new_pokemon = self.new(id:query[0], db:db, name: query[1], type:query[2])
  end
end
