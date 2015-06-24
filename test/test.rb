require 'test/unit'
require 'simple_progress_bar'

class SimpleProgressBarTest < Test::Unit::TestCase

  def return_progress_bar(max=100)
    SimpleProgressBar.new(max)
  end
  
  def test_init
    progress = return_progress_bar(50)
    progress.max == 50.0
  end

  def test_set_max
    progress = return_progress_bar(50)
    progress.set_max(200)
    progress.max == 200.0
  end

  def test_increment
    progress = return_progress_bar
    progress.increment(5)
    progress.increment(15)
    progress.increment 25
    progress.current == 45.0
  end

  def test_inspect
    progress = return_progress_bar
    progress.increment 10
    progress.inspect ==  "#<SimpleProgressBar:10.0/100.0>"
  end

  def test_percent
    progress = return_progress_bar(50)
    progress.increment 10
    progress.percentage == 20.0
  end
end

  