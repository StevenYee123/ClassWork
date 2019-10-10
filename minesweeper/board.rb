require 'byebug'
require_relative 'square'
class Board

    def self.make_bombs
        bombs_arr = Array.new(10)
        bombs_arr.each_with_index do |ele, idx|
            bombs_arr[idx] = Square.new(true, false)
        end
        bombs_arr
    end

    def self.make_safe_spaces
        safe_spaces = Array.new(71)
        safe_spaces.each_with_index do |ele, idx|
            safe_spaces[idx] = Square.new(false, false)
        end
        safe_spaces
    end

    def initialize
        @grid = Array.new(9) { Array.new(9) }
        make_squares = Board.make_bombs + Board.make_safe_spaces
        self.populate(make_squares.shuffle)
        render
    end

    def populate(arr)
        @grid.each_with_index do |sub, idx1|
            sub.each_with_index do |ele, idx2|
                @grid[idx1][idx2] = arr.shift
            end
        end
        # debugger
    end

    def render
        puts "  #{(0..8).to_a.join(" ")} "
        @grid.each_with_index do |row, i|
            puts i.to_s + " " + row.join(" ")
        end
    end


end

board = Board.new