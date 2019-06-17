class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    s = self.new
    s.save
    s
  end

  def self.new_by_name(name)
    s = self.new
    s.name = name
    s
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end


  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
        self.create_by_name(name)
      else
        self.find_by_name(name)
      end
  end

  def self.alphabetical(name)
    @@all.sort_by{|x| x.name}
  end



  def self.destroy_all
    @@all.clear
  end

end
