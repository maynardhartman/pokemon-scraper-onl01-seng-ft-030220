class Pokemon < ActiveRecord::Base 
  attr_accessor :name, :type, :id 
  
  def initialize(name, type) 
    @name = name
    @type = type
    @id   = id
  end
  
  def self.save(name, type)
    sql = <<-SQL
      #search if already entered 
      SELECT * FEOM 'pokemon' WHERE name = ?
      SQL
      DB[:conn].execute(sql, name)
      
      sql == nil
        sql = <<-SQL 
          INSERT INTO 'pokemon' (id, name, type) VALUES (nil, ?, ?)
        SQL
      
      DB[:conn].execute(sql, nil, self.name, self.type)
      @id = DB[:conn].execute("SELECT last_insert_rowid() FROM 'pokemon'" )[0][0]
      
  end.first
  
  def self.all
    @@all
  end 
  
  def self.find_by_name(name)
    sql = <<-SQL
      SELECT * FROM 'pokemon' WHERE name = ?
    SQL
    
    DB[:conn].execute(sql, name)
    
  end
end
