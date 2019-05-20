class Room

  attr_reader :name, :capacity
  attr_accessor :guests, :songs

  def initialize(name, capacity, fee, guests, songs)
    @name = name
    @capacity = capacity
    @fee = fee
    @guests = guests
    @songs = songs
  end

  def checkin(guest)
    if @guests.size < @capacity && guest.money >= @fee
      @guests << guest
      guest.money -= @fee
    end
  end

  def checkout(guest)
    @guests.delete(guest)
  end

  def add_song(song)
    @songs << song
  end

end
