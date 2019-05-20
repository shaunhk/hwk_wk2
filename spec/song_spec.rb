require('minitest/rg')
require('minitest/autorun')
require_relative('../song.rb')

class SongTest < MiniTest::Test

  def setup
    @song_1 = Song.new("Don Giovanni")
  end

  def test_name
    assert_equal("Don Giovanni", @song_1.name)
  end

end
