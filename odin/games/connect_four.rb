class Board
  Player = Struct.new(:name)
  def initialize
    puts "Player 1, what is your name?"
    name1=gets.chomp
    @player1=Player.new(name1)
    puts "Player 2, what is your name?"
    name2=gets.chomp
    @player2=Player.new(name2)
    create_grid
  end
  def create_grid
    @grid=[[0.0,0.1,0.2,0.3,0.4,0.5,0.6],
           [1.0,1.1,1.2,1.3,1.4,1.5,1.6],
           [2.0,2.1,2.2,2.3,2.4,2.5,2.6],
           [3.0,3.1,3.2,3.3,3.4,3.5,3.6],
           [4.0,4.1,4.2,4.3,4.4,4.5,4.6],
           [5.0,5.1,5.2,5.3,5.4,5.5,5.6]]
    @right_diagonals=[["00","11","22","33","44","55"],
                     ["01","12","23","34","45","56"],
                     ["02","13","24","35","46"],
                     ["03","14","25","36"],
                     ["10","21","32","43","54"],
                     ["20","31","42","53"]]
    @left_diagonals=[["06","15","24","33","42","51"],
                     ["05","14","23","32","41","50"],
                     ["04","13","22","31","40"],
                     ["03","12","21","30"],
                     ["16","25","34","43","52"],
                     ["26","35","44","53"]]
  end
  def access
    @grid
  end
  def show
    @grid.each do |row|
      print row
      puts "\n"
    end
  end
  def play
    while true
    puts "#{@player1.name}, pick a location on the grid to place your red chip (denoted by an R) by providing the numbers without the decimal. For instance, the top/left-most corner is 00."
    location1=gets.chomp
    locationr=location1[0].to_i
    locationc=location1[1].to_i
    change_r(locationr,locationc)
    show
    row_winr=row_check_for_win_r
    col_winr=col_check_for_win_r
    diag_r=check_for_diagonals_r
    diag_l=check_for_diagonals_l
    if row_winr==true || col_winr==true || diag_r=="R wins!" || diag_l=="R wins!"
      puts "#{@player1} and the R chips win!"
      exit
    end
    puts "#{@player2.name}, pick a location on the grid to place your black chip (denoted by an B) by providing the numbers without the decimal. For instance, the top/left-most corner is 00."
    location2=gets.chomp
    locationr=location2[0].to_i
    locationc=location2[1].to_i
    change_b(locationr,locationc)
    show
    row_winb=row_check_for_win_b
    col_winb=col_check_for_win_b
    diag_r=check_for_diagonals_r
    diag_l=check_for_diagonals_l
    if row_winb==true || col_winb==true || diag_r=="B wins!" || diag_l=="B wins!"
      puts "#{@player2} and the B chips win!"
      exit
    end
    end
  end
  def change_r(inputr,inputc)
    @grid[inputr][inputc]="R"
  end
  def change_b(inputr,inputc)
    @grid[inputr][inputc]="B"
  end
  def row_check_for_win_r
    wordr=""
    @grid.each do |row|
      row.each do |cell|
        wordr << cell.to_s
        if wordr.include?("RRRR")
          return true
        end
      end
    end
  end
  def row_check_for_win_b
    wordb=""
    @grid.each do |row|
      row.each do |cell|
        wordb << cell.to_s
        if wordb.include?("BBBB")
          return true
        end
      end
    end
  end
  def col_check_for_win_r
    wordr=""
    i=0
    while i<7
      j=0
      while j<6
        wordr << @grid[j][i].to_s
        if wordr.include?("RRRR")
          return true
        end
        j=j+1
      end
      i=i+1
    end
  end
  def col_check_for_win_b
    wordb=""
    i=0
    while i<7
      j=0
      while j<6
        wordb << @grid[j][i].to_s
        if wordb.include?("BBBB")
          return true
        end
        j=j+1
      end
      i=i+1
    end
  end
  def check_for_diagonals_r
    word=""
    @right_diagonals.each do |row|
      row.each do |cell|
        word << @grid[cell[0].to_i][cell[1].to_i].to_s
        if word.include?("RRRR")
          return "R wins!"
        elsif word.include?("BBBB")
          return "B wins!"
        end
      end
    end
  end
  def check_for_diagonals_l
    word=""
    @left_diagonals.each do |row|
      row.each do |cell|
        word << @grid[cell[0].to_i][cell[1].to_i].to_s
        if word.include?("RRRR")
          return "R wins!"
        elsif word.include?("BBBB")
          return "B wins!"
        end
      end
    end
  end
end

# connect_four=Board.new
# connect_four.show
# connect_four.play