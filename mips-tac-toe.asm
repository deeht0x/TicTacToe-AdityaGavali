.data
newLine: .asciiz "\n"
space: .asciiz " "
x: .asciiz "X"
o: .asciiz "O"
boardHeader: .asciiz "    A   B   C \n"
rowDivider: .asciiz "   ---+---+---\n"
columnDivider: .asciiz "|"
asciiArtIntro: .asciiz " __  __ _____ _____   _____    _______             _______\n|  \\/  |_   _|  __ \\ / ____|  |__   __|           |__   __|\n| \\  / | | | | |__) | (___ ______| | __ _  ___ ______| | ___   ___\n| |\\/| | | | |  ___/ \\___ \\______| |/ _` |/ __|______| |/ _ \\ / _ \\\n| |  | |_| |_| |     ____) |     | | (_| | (__       | | (_) |  __/\n|_|  |_|_____|_|    |_____/      |_|\\__,_|\\___|      |_|\\___/ \\___|\n"

whoMovesFirstMenu: .asciiz "Menu options:\n1: You\n2: Computer\n"
whoMovesFirstMessage: .asciiz "Who moves first?: "
invalidWhoMovesFirstMessage: .asciiz "Invalid player. Try again.\n"
pickMarkerMenu: .asciiz "Menu options:\n1: X\n2: O\n"
pickMarkerMessage: .asciiz "Your marker?: "
invalidMarkerMessage: .asciiz "Invalid marker. Try again.\n"

yourMoveMessage: .asciiz "Your turn\n"
computerMoveMessage: .asciiz "Computer's turn\n"
rowNumberMessage: .asciiz "Row number: "
columnLetterMessage: .asciiz "Column letter: "
invalidRowNumberMessage: .asciiz "Invalid row number. Try again.\n"
invalidColumnLetterMessage: .asciiz "Invalid column letter. Try again.\n"
invalidMoveMessage: .asciiz "Invalid move. Try again.\n"
tieMessage: .asciiz "No moves possible. Players tie.\n"
youWinMessage: .asciiz "Three in a row. You win!\n"
computerWinMessage: .asciiz "Three in a row. Computer wins!\n"
playAgainMenu: .asciiz "Menu options:\n1: Yes\n2: No\n"
playAgainMessage: .asciiz "Do you want to play again?: "
invalidPlayAgainMessage: .asciiz "Invalid response. Try again.\n"
exitMessage: .asciiz "Thank you for playing. See you next time!\n"

board: .space 9 # Represents space as 0, X as 1, and O as 2
whoMovesFirst: .space 1# Represents you as 0 and computer as 1
yourMarker: .space 1# Represents X as 1 and O as 2
computerMarker: .space 1 # Represents X as 1 and O as 2

.text
jal DisplayIntro
GameLoop:
jal ReadWhoMovesFirst
jal DisplayNewLine
jal ReadPickMarker
jal DisplayNewLine
jal ResetBoard
jal PlayGame
jal ReadPlayAgain
ExitGameLoop:
j ExitProgram

DisplayNewLine:
li $v0, 4
la $a0, newLine
syscall
jr $ra

DisplaySpace:
li $v0, 4
la $a0, space
syscall
jr $ra

DisplayX:
li $v0, 4
la $a0, x
syscall
jr $ra

DisplayO:
li $v0, 4
la $a0, o
syscall
jr $ra

DisplayBoardHeader:
li $v0, 4
la $a0, boardHeader
syscall
jr $ra

DisplayRowDivider:
li $v0, 4
la $a0, rowDivider
syscall
jr $ra

DisplayColumnDivider:
li $v0, 4
la $a0, columnDivider
syscall
jr $ra

DisplayIntro:
# Displays ASCII art intro
# Ex.
#  __  __ _____ _____   _____    _______             _______
# |  \/  |_   _|  __ \ / ____|  |__   __|           |__   __|
# | \  / | | | | |__) | (___ ______| | __ _  ___ ______| | ___   ___
# | |\/| | | | |  ___/ \___ \______| |/ _` |/ __|______| |/ _ \ / _ \
# | |  | |_| |_| |     ____) |     | | (_| | (__       | | (_) |  __/
# |_|  |_|_____|_|    |_____/      |_|\__,_|\___|      |_|\___/ \___|
# 
li $v0, 4
la $a0, asciiArtIntro
syscall
jr $ra

DisplayPickMarkerMenu:
li $v0, 4
la $a0, pickMarkerMenu
syscall
jr $ra

DisplayPickMarkerMessage:
li $v0, 4
la $a0, pickMarkerMessage
syscall
jr $ra

DisplayInvalidMarkerMessage:
li $v0, 4
la $a0, invalidMarkerMessage
syscall
jr $ra

DisplayWhoMovesFirstMenu:
li $v0, 4
la $a0, whoMovesFirstMenu
syscall
jr $ra

DisplayWhoMovesFirstMessage:
li $v0, 4
la $a0, whoMovesFirstMessage
syscall
jr $ra

DisplayInvalidWhoMovesFirstMessage:
li $v0, 4
la $a0, invalidWhoMovesFirstMessage
syscall
jr $ra

DisplayYourMoveMessage:
li $v0, 4
la $a0, yourMoveMessage
syscall
jr $ra

DisplayComputerMoveMessage:
li $v0, 4
la $a0, computerMoveMessage
syscall
jr $ra

DisplayRowNumberMessage:
li $v0, 4
la $a0, rowNumberMessage
syscall
jr $ra

DisplayColumnLetterMessage:
li $v0, 4
la $a0, columnLetterMessage
syscall
jr $ra

DisplayInvalidRowNumberMessage:
li $v0, 4
la $a0, invalidRowNumberMessage
syscall
jr $ra

DisplayInvalidColumnLetterMessage:
li $v0, 4
la $a0, invalidColumnLetterMessage
syscall
jr $ra

DisplayInvalidMoveMessage:
li $v0, 4
la $a0, invalidMoveMessage
syscall
jr $ra

DisplayTieMessage:
li $v0, 4
la $a0, tieMessage
syscall
jr $ra

DisplayYouWinMessage:
li $v0, 4
la $a0, youWinMessage
syscall
jr $ra

DisplayComputerWinMessage:
li $v0, 4
la $a0, computerWinMessage
syscall
jr $ra

DisplayPlayAgainMenu:
li $v0, 4
la $a0, playAgainMenu
syscall
jr $ra

DisplayPlayAgainMessage:
li $v0, 4
la $a0, playAgainMessage
syscall
jr $ra

DisplayInvalidPlayAgainMessage:
li $v0, 4
la $a0, invalidPlayAgainMessage
syscall
jr $ra

DisplayExitMessage:
li $v0, 4
la $a0, exitMessage
syscall
jr $ra

DisplayBoardAtIndex:
# Takes row index through $a0
# Takes column index through $a1
li $t0, 0 # Store board index in $t0
li $t1, 3
mult $a0, $t1 # Multiply row index by 3
mflo $t0  # Add product to board index
add $t0, $t0, $a1 # Add column index to board index
# Board index contains starting index of cell
lb $t2, board($t0) # Store value of board at index in $t2
beq $t2, 0, DisplaySpace
beq $t2, 1, DisplayX
beq $t2, 2, DisplayO
# The display functions already return to $ra

DisplayBoard:
# Formats and displays board
# Ex.
# 
#     A   B   C 
# 
# 1     |   |   
#    ---+---+---
# 2     |   |   
#    ---+---+---
# 3     |   |   
# 
la $s0, ($ra) # Store $ra in $s0
jal DisplayBoardHeader
li $t0, 0 # Store row index in $t0
IterateRows:
addi $t2, $t0, 1 # Store row index + 1 in $t2
li $v0, 1 # Display row label
la $a0, ($t2)
syscall
jal DisplaySpace
jal DisplaySpace
li $t1, 0 # Store column index in $t1
IterateColumns:
jal DisplaySpace
move $a0, $t0
move $a1, $t1
move $s1, $t0 # Store indexes
move $s2, $t1
jal DisplayBoardAtIndex # Display board at row index, column index
jal DisplaySpace
move $t0, $s1 # Restore indexes
move $t1, $s2
addi $t1, $t1, 1 # Increment column index
beq $t1, 3, ExitIterateColumns
jal DisplayColumnDivider
j IterateColumns
ExitIterateColumns:
jal DisplayNewLine
addi $t0, $t0, 1 # Increment row index
beq $t0, 3, ExitDisplayBoard
jal DisplayRowDivider
j IterateRows
ExitDisplayBoard:
jr $s0 # $s0 contains original $ra

GetBoardAtIndex:
# Takes row index through $a0
# Takes column index through $a1
# Returns board at index value through $v0
li $t0, 0 # Store board index in $t0
li $t1, 3
mult $a0, $t1 # Multiply row index by 3
mflo $t0  # Add product to board index
add $t0, $t0, $a1 # Add column index to board index
# Board index contains starting index of cell
lb $v0, board($t0) # Store value of board at index in $v0
jr $ra

SetBoardAtIndex:
# Takes row index through $a0
# Takes column index through $a1
# Takes board at index value through $a2
li $t0, 0 # Store board index in $t0
li $t1, 3
mult $a0, $t1 # Multiply row index by 3
mflo $t0  # Add product to board index
add $t0, $t0, $a1 # Add column index to board index
# Board index contains starting index of cell
sb $a2, board($t0)
jr $ra

ResetBoard:
li $t0, 0 # Store board index in $t0
li $t1, 0
ResetBoardAtIndex:
sb $t1, board($t0)
addi $t0, $t0, 1 # Increment board index
beq $t0, 9, ExitResetBoard
j ResetBoardAtIndex
ExitResetBoard:
jr $ra

ReadWhoMovesFirst:
sw $ra, ($sp) # Push $ra on stack
addi $sp, $sp, -4
jal DisplayNewLine
jal DisplayWhoMovesFirstMenu
jal DisplayNewLine
ReadWhoMovesFirstHelper:
jal DisplayWhoMovesFirstMessage
li $v0, 12
syscall # $v0 contains who moves first
beq $v0, 49, SaveWhoMovesFirst
beq $v0, 50, SaveWhoMovesFirst
jal DisplayNewLine
jal DisplayInvalidWhoMovesFirstMessage
j ReadWhoMovesFirstHelper
SaveWhoMovesFirst:
addi $v0, $v0, -49 # Sanitize who moves first
sb $v0, whoMovesFirst
addi $sp, $sp, 4
lw $ra, ($sp) # Pop original $ra off stack
jr $ra

ReadPickMarker:
sw $ra, ($sp) # Push $ra on stack
addi $sp, $sp, -8
jal DisplayNewLine
jal DisplayPickMarkerMenu
jal DisplayNewLine
ReadPickMarkerHelper:
jal DisplayPickMarkerMessage
li $v0, 12
syscall # $v0 contains who moves first
beq $v0, 49, SaveYourMarker
beq $v0, 50, SaveYourMarker
jal DisplayNewLine
jal DisplayInvalidMarkerMessage
j ReadPickMarkerHelper
SaveYourMarker:
addi $v0, $v0, -49 # Sanitize who moves first
sb $v0, yourMarker
sgt  $v0, $v0, $zero
sb $v0, computerMarker
addi $sp, $sp, 8
lw $ra, ($sp) # Pop original $ra off stack
jr $ra


PlayGame:
la $s3, ($ra) # Store $ra in $s3
li $s4, 0 # Store move count in $s4
PlayMove:
jal DisplayNewLine
jal DisplayBoard
jal DisplayNewLine
li $t0, 2
div $s4, $t0
mfhi $t0
beq $t0, 0, PlayWhoMovesFirstMove
beq $t0, 1, PlayWhoMovesSecondMove
PlayWhoMovesFirstMove:
lb $t0, whoMovesFirst
beq $t0, 0, PlayYourMove
beq $t0, 1, PlayComputerMove
PlayWhoMovesSecondMove:
lb $t0, whoMovesFirst
beq $t0, 0, PlayComputerMove
beq $t0, 1, PlayYourMove
ContinuePlayMove:
addi $s4, $s4, 1 # Increment move count
beq $s4, 9, TieReached
j PlayMove

PlayYourMove:
jal DisplayYourMoveMessage
jal DisplayNewLine
ReadRowNumber:
jal DisplayRowNumberMessage
li $v0, 12
syscall # $v0 contains row number as character
move $s0, $v0 # Store row number in $s0
jal DisplayNewLine
beq $s0, 49, SanitizeRowNumber
beq $s0, 50, SanitizeRowNumber
beq $s0, 51, SanitizeRowNumber # Row number is 1, 2, or 3
jal DisplayInvalidRowNumberMessage
j ReadRowNumber
ReadColumnLetter:
jal DisplayColumnLetterMessage
li $v0, 12
syscall # $v0 contains column letter as character
move $s1, $v0 # Store column letter in $s1
jal DisplayNewLine
beq $s1, 65, SanitizeUpperColumnLetter
beq $s1, 66, SanitizeUpperColumnLetter
beq $s1, 67, SanitizeUpperColumnLetter
beq $s1, 97, SanitizeLowerColumnLetter
beq $s1, 98, SanitizeLowerColumnLetter
beq $s1, 99, SanitizeLowerColumnLetter # Column letter is A, B, C, a, b, or c
jal DisplayInvalidColumnLetterMessage
j ReadColumnLetter
SanitizeRowNumber:
addi $s0, $s0, -49
j ReadColumnLetter
SanitizeUpperColumnLetter:
addi $s1, $s1 -65
j ValidateMove
SanitizeLowerColumnLetter:
addi $s1, $s1, -97
j ValidateMove
ValidateMove:
move $a0, $s0
move $a1, $s1
jal GetBoardAtIndex # $v0 contains value of board at index
beq $v0, 0, MakeYourMove # Board at index must be empty
jal DisplayInvalidMoveMessage
jal DisplayNewLine
j ReadRowNumber
MakeYourMove:
move $a0, $s0
move $a1, $s1
setYourMarker:
lb $a2, yourMarker
beq $a2,0, setYourX
beq $a2,1,setYourO
setYourX: 
li $a2, 1 # You are X
j continueMove
setYourO:
li $a2, 2 #You are O
continueMove:
jal SetBoardAtIndex
beq $a2,1,checkYourX
beq $a2,2,checkYourO
checkYourX:
li $a0, 1 # You are X
jal CheckForWin
j ContinuePlayMove
checkYourO:
li $a0,2 #You are O
jal CheckForWin
j ContinuePlayMove

PlayComputerMove:
jal DisplayComputerMoveMessage
li $s0, 0 # Store number of board empty values in $s0
li $t0, 0 # Store board index in $t0
CountBoardEmptyValues:
lb $t1, board($t0)
bnez $t1, NotBoardEmptyValueInCount
addi $s0, $s0, 1 # Increment board empty values
NotBoardEmptyValueInCount:
addi $t0, $t0, 1 # Increment board index
beq $t0, 9, CountedBoardEmptyValues
j CountBoardEmptyValues
CountedBoardEmptyValues:
li $a0, 0
move $a1, $s0
li $v0, 42
syscall # a0 contains unsanitized board index with empty value
li $t0, 0 # Store board index in $t0
SanitizeBoardIndex:
lb $t1, board($t0)
bnez $t1, NotBoardEmptyValueInSanitize
beqz $a0, MakeComputerMove
addi $a0, $a0, -1 # Decrement unsanitized board index
NotBoardEmptyValueInSanitize:
addi $t0, $t0, 1 # Increment board index
j SanitizeBoardIndex
MakeComputerMove:
lb $a0, computerMarker
beq $a0, 1 setComputerX
beq $a0, $t6, setComputerO
setComputerX:
li $a0,1 #Computer is X
j continueComputerMove
setComputerO:
li $a0,  2# Computer is O
continueComputerMove:
sb $a0, board($t0)
jal CheckForWin
j ContinuePlayMove

TieReached:
jal DisplayNewLine
jal DisplayBoard
jal DisplayNewLine
jal DisplayTieMessage
j ExitGame

CheckForWin:
sw $ra, ($sp) # Push $ra on stack
addi $sp, $sp, -4
jal CheckRows
jal CheckColumns
jal CheckDiagonals
addi $sp, $sp, 4
lw $ra, ($sp) # Pop original $ra off stack
jr $ra
FoundYouWin:
addi $sp, $sp, 4 # Pop original $ra off stack
jal DisplayNewLine
jal DisplayBoard
jal DisplayNewLine
jal DisplayYouWinMessage
j ExitGame
FoundComputerWin:
addi $sp, $sp, 4 # Pop original $ra off stack
jal DisplayNewLine
jal DisplayBoard
jal DisplayNewLine
jal DisplayComputerWinMessage
j ExitGame

CheckRows:
sw $ra, ($sp) # Push $ra on stack
addi $sp, $sp, -4
li $a1, 0
jal CheckRow
li $a1, 3
jal CheckRow
li $a1, 6
jal CheckRow
addi $sp, $sp, 4
lw $ra, ($sp) # Pop original $ra off stack
jr $ra
CheckRow:
la $t0, board
add $t0, $t0, $a1
lb $t1, 0($t0)
lb $t2, 1($t0)
lb $t3, 2($t0)
bne $t1, $a0, NotRowWin
bne $t2, $a0, NotRowWin
bne $t3, $a0, NotRowWin
lb  $t0, yourMarker
addi $t0, $t0, 1
beq $a0, $t0, FoundYouWin
j FoundComputerWin
NotRowWin:
jr $ra

CheckColumns:
sw $ra, ($sp) # Push $ra on stack
addi $sp, $sp, -4
li $a1, 0
jal CheckColumn
li $a1, 1
jal CheckColumn
li $a1, 2
jal CheckColumn
addi $sp, $sp, 4
lw $ra, ($sp) # Pop original $ra off stack
jr $ra
CheckColumn:
la $t0, board
add $t0, $t0, $a1
lb $t1, 0($t0)
lb $t2, 3($t0)
lb $t3, 6($t0)
bne $t1, $a0, NotColumnWin
bne $t2, $a0, NotColumnWin
bne $t3, $a0, NotColumnWin
lb  $t0, yourMarker
addi $t0, $t0, 1
beq $a0, $t0, FoundYouWin
j FoundComputerWin
NotColumnWin:
jr $ra

CheckDiagonals:
addi $sp, $sp, -4 # Note: Leave for symmetry
CheckFirstDiagonal:
la $t0, board
lb $t1, 0($t0)
lb $t2, 4($t0)
lb $t3, 8($t0)
bne $t1, $a0, CheckSecondDiagonal
bne $t2, $a0, CheckSecondDiagonal
bne $t3, $a0, CheckSecondDiagonal
bne $t3, $a0, NotRowWin
lb  $t0, yourMarker
addi $t0, $t0, 1
beq $a0, $t0, FoundYouWin
j FoundComputerWin
CheckSecondDiagonal:
la $t0, board
lb $t1, 2($t0)
lb $t2, 4($t0)
lb $t3, 6($t0)
bne $t1, $a0, NotDiagonalWin
bne $t2, $a0, NotDiagonalWin
bne $t3, $a0, NotDiagonalWin
bne $t3, $a0, NotRowWin
lb  $t0, yourMarker
addi $t0, $t0, 1
beq $a0, $t0, FoundYouWin
j FoundComputerWin
NotDiagonalWin:
addi $sp, $sp, 4 # Note: Leave for symmetry
jr $ra

ReadPlayAgain:
jal DisplayNewLine
jal DisplayPlayAgainMenu
jal DisplayNewLine
ReadPlayAgainHelper:
jal DisplayPlayAgainMessage
li $v0, 12
syscall # $v0 contains play again
move $t0, $v0 # Store play again in $t0
jal DisplayNewLine
beq $t0, 49, GameLoop
beq $t0, 50, ExitGameLoop
jal DisplayInvalidPlayAgainMessage
j ReadPlayAgainHelper

ExitGame:
jr $s3 # $s3 contains original $ra

ExitProgram:
jal DisplayNewLine
jal DisplayExitMessage
li $v0, 10
syscall
