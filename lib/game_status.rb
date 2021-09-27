# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #top row win
  [3,4,5], # middle row win
  [6,7,8], #bottom row win
  [0,4,8], #diag left-right win
  [2,4,6], #diag right-left win
  [0,3,6], #left col win
  [1,4,7], #middle col win
  [2,5,8] #right col win
]

def won?(board)
  #iterate win combos
  WIN_COMBINATIONS.each do |combo|
    if board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X"
      return combo
    elsif board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O"
      return combo
    else
      false
    end
  end
  false
end

def full?(board)
  if board.detect{|pos| pos == " "}
    return false
  else
    return true
  end
end

def draw?(board)
  if full?(board) == true && won?(board) == false
    return true
  else
    return false
  end
end

def over?(board)
  if draw?(board) == true || won?(board) != false
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board) != false
    if board[won?(board)[0]] == "X"
      return "X"
    else
      return "O"
    end
  else
    return nil
  end
end