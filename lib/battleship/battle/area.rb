require_relative "cell"

class Area

  attr_accessor :cells, :name

  # To set height and width of player area
  def self.define(height,width)
    @@height = height
    @@width = width
  end

  def initialize(playername)
    @cells = {}
    @height = @@height
    @width = @@width
    create_cells
    @name = "#{playername}"
  end

  # To create cells for player area
  def create_cells
    ("A"..@height).each do |rows|
      (1..@width.to_i).each do |column|
        k="#{rows}#{column}"
        cells[k]=Cell.new(k)
      end
    end
    cells
  end

  # To Place ship on player area
  def place(ship, starts_at)
    raise ArgumentError, "That ship has already placed" if ship.placed?
    for attempt_x in 0..(ship.size_x.to_i - 1)
      for attempt_y in 0..(ship.size_y.to_i- 1)
        copy = test_cell_then_place(ship, attempt_x, attempt_y, starts_at)
      end
    end
  end

  # To validate cell and place ship
  def test_cell_then_place(ship, attempt_x, attempt_y, starts_at)
    alpha, numb = starts_at.split("")
    coordinates = "#{get_alpha(get_index(alpha) + attempt_y)}#{numb.to_i + attempt_x}"
    cells[coordinates].accept ship
  end

  # To get index
  def get_index(alpha)
    hash = Hash[("A".."Z").to_a.map.with_index.to_a]
    hash[alpha] + 1
  end

  def get_alpha(index)
    arr = ("A".."Z").to_a
    arr[index-1]
  end

  # To hit cell
  def hit(missile)
    all_cells = get_cells(missile)
    if all_cells.is_a?(Array)
      all_cells.each do |coordinates|
        status = cells[coordinates].hit_it!
      end
    else
      coordinates = all_cells
      cells[coordinates].hit_it!
    end
  end

  def get_start_height(start)
    arr = ("A".."Z").to_a
    return start = arr.find_index(start) > 0 ? arr[arr.find_index(start) - 1] : arr[arr.find_index(start)]
  end

  # This return all effected cells
  # A => All Adjacent Cell
  # B => Parallel Adjacent Cell
  # C => Diagonal Adjacent Cell
  def get_cells(missile)
    all_affected_cells = []
    missile.split("=>").length > 1 ? (type, start_at = missile.split("=>")) : (return missile)
    height, width = start_at.split("")
    start_height_at = get_start_height(height)
    start_width_at = width.to_i > 1 ? width.to_i - 1 : width.to_i
    (start_height_at..height.next).each do |rows|
      (start_width_at..width.to_i+1).each do |column|
        if type == "b"
          all_affected_cells << "#{rows}#{column}" if (rows == height || column == width.to_i)
        elsif type == "c"
          all_affected_cells << "#{rows}#{column}" unless (rows == height || column == width.to_i)
          all_affected_cells << start_at unless all_affected_cells.include?(start_at)
        else
          all_affected_cells << "#{rows}#{column}"
        end
      end
    end
    return all_affected_cells
  end

  # To check player area all ships are destroyed
  def is_all_ships_destroyed?
    (cells.length == cells.values.select{|a| a.content == "water" }.length)
  end
end
