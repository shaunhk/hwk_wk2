require('minitest/rg')
require('minitest/autorun')
require_relative('../song.rb')
require_relative('../room.rb')
require_relative('../guest.rb')

class GuestTest < MiniTest::Test

  def setup
    @song_1 = Song.new("Dancing Queen")
    @song_2 = Song.new("Killing Moon")
    @guest_1 = Guest.new("Sarah", 48.90)
    @guest_2 = Guest.new("Andy", 12.90)
    @guest_3 = Guest.new("Joe", 22.55)
    @guest_4 = Guest.new("Xi", 32.10)
    @guest_5 = Guest.new("Alex", 30.00)
    @guest_6 = Guest.new("Marc", 21.22)
    @guest_7 = Guest.new("Shaun", 3.50)
    @guests_in_1 = []
    @songs_in_1 = []
    @room_1 = Room.new("Booth deluxe", 5, 7.50, @guests_in_1, @songs_in_1)
  end

  def test_name
    assert_equal("Booth deluxe", @room_1.name)
  end

  def test_capacity
    assert_equal(5, @room_1.capacity)
  end

  def test_can_add_people
    @room_1.checkin(@guest_1)
    assert_equal(1, @guests_in_1.size)
  end

  def test_can_remove_people
    @room_1.checkin(@guest_1)
    @room_1.checkout(@guest_1)
    assert_equal(0, @guests_in_1.size)
  end

  def test_can_add_Song
    @room_1.add_song(@song_1)
    assert_equal(1, @songs_in_1.size)
  end

  def test_full_capacity
    @room_1.checkin(@guest_1)
    @room_1.checkin(@guest_2)
    @room_1.checkin(@guest_3)
    @room_1.checkin(@guest_4)
    @room_1.checkin(@guest_5)
    @room_1.checkin(@guest_6)
    assert_equal(5, @guests_in_1.size)
  end

  def test_charge_fee
    @room_1.checkin(@guest_1)
    assert_equal(@guest_1.money, 41.40)
  end

  def test_not_enough_money
    @room_1.checkin(@guest_7)
    assert_empty(@guests_in_1)
  end

end
