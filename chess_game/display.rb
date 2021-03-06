require 'colorize'
require_relative 'cursor'
require_relative 'board' 

class Display 
    attr_reader :cursor 

    def initialize
        @board = Board.new
        @cursor = Cursor.new([0,0], @board)

    end 

    def render
        @board.grid.each_with_index do |row, i| 
            print_line = "" 
            row.each_with_index do |square, j| 
                current_square = ""
                if square.is_a?(Piece)
                    current_square = " P " 
                    
                else
                    current_square = " - "




                end 
                if [i, j] == self.cursor.cursor_pos
                    if self.cursor.selected
                        current_square = current_square.green
                    else
                        current_square = current_square.red 
                    end
                end 
                print_line += current_square
            end
            puts print_line 
        end 
        return nil 
    end 

    def move_around
        system("clear")
        while true 
            self.render 
            @cursor.get_input 
            system("clear")
        end  
    end 
end 