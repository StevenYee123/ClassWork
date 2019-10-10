class Square
    def initialize(has_bomb, revealed)
        @has_bomb = has_bomb
        @revealed = revealed
        @neighbors = []
    end

    def revealed?
        @revealed
    end

    def flip
        if revealed?
            puts "This is already revealed"
        elsif @has_bomb
            puts "Game over"
        else
            @revealed = true
        end
    end

    def count_bombs
        @neighbors.count {|ele| ele.has_bomb}
    end

    def check_neighbors
        if self.count_bombs >= 1
            self.flip
            return self.count_bombs 
        end

        @neighbors.each do |neighbor|
            neighbor.check_neighbors
        end
        self.flip 
        0
    end

    def to_s
        if !has_bomb && revealed?
            return "B"
        else
            return " "
        end
    end

    private
    attr_reader :has_bomb

end