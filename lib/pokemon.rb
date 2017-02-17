require 'pry'

class Pokemon
  attr_accessor :hp
  attr_reader :id, :name, :type, :db

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
    new_pokemon = self.new(id:query[0], db:db, name: query[1], type:query[2])
    if query.length > 3
      new_pokemon.hp = query[-1]
    end
    return new_pokemon
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = #{hp}")
  end
end
