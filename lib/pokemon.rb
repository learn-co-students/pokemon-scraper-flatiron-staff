class Pokemon
  attr_accessor :name, :type,:db, :id, :hp

  def initialize(name:, type:, db:, id:, hp: 60)
    @name = name
    @type = type
    @db = db
    @id = id
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    pok = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
    Pokemon.new(name: pok[0][1], type: pok[0][2], db: db, id: pok[0][0], hp: pok[0][3])
  end

  def alter_hp(name, type, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, @id)
  end

end
