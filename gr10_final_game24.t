% Aaron Wang & Tom Li
% Dec. 4th. to Dec. 16th.
% Brain Storming v1.0
% This program will read in the number of times the user wants to play the game (N), 
% the number of cards he want to have and the target number (the number that the user 
% is going to make up of). Then, the user is going to use all of these % cards with 
% the operations of addition, subtraction, multiplication and division to try to 
% make the target number. Then the program will keep asking the user to input 
% his or her solution until it's valid. At last, the program will tell the user 
% if his answer is right or wrong, and also display one of the correct answers. 
% After playing it for N times, the program will print the final score

% set the screen in graphics mode and load the 36 card pictures
setscreen ("graphics:1000;650")
var PicID : array 1 .. 36 of int
PicID (1) := Pic.FileNew ("club1.jpg")
PicID (2) := Pic.FileNew ("club2.jpg")
PicID (3) := Pic.FileNew ("club3.jpg")
PicID (4) := Pic.FileNew ("club4.jpg")
PicID (5) := Pic.FileNew ("club5.jpg")
PicID (6) := Pic.FileNew ("club6.jpg")
PicID (7) := Pic.FileNew ("club7.jpg")
PicID (8) := Pic.FileNew ("club8.jpg")
PicID (9) := Pic.FileNew ("club9.jpg")
PicID (10) := Pic.FileNew ("dia1.jpg")
PicID (11) := Pic.FileNew ("dia2.jpg")
PicID (12) := Pic.FileNew ("dia3.jpg")
PicID (13) := Pic.FileNew ("dia4.jpg")
PicID (14) := Pic.FileNew ("dia5.jpg")
PicID (15) := Pic.FileNew ("dia6.jpg")
PicID (16) := Pic.FileNew ("dia7.jpg")
PicID (17) := Pic.FileNew ("dia8.jpg")
PicID (18) := Pic.FileNew ("dia9.jpg")
PicID (19) := Pic.FileNew ("heart1.jpg")
PicID (20) := Pic.FileNew ("heart2.jpg")
PicID (21) := Pic.FileNew ("heart3.jpg")
PicID (22) := Pic.FileNew ("heart4.jpg")
PicID (23) := Pic.FileNew ("heart5.jpg")
PicID (24) := Pic.FileNew ("heart6.jpg")
PicID (25) := Pic.FileNew ("heart7.jpg")
PicID (26) := Pic.FileNew ("heart8.jpg")
PicID (27) := Pic.FileNew ("heart9.jpg")
PicID (28) := Pic.FileNew ("spa1.jpg")
PicID (29) := Pic.FileNew ("spa2.jpg")
PicID (30) := Pic.FileNew ("spa3.jpg")
PicID (31) := Pic.FileNew ("spa4.jpg")
PicID (32) := Pic.FileNew ("spa5.jpg")
PicID (33) := Pic.FileNew ("spa6.jpg")
PicID (34) := Pic.FileNew ("spa7.jpg")
PicID (35) := Pic.FileNew ("spa8.jpg")
PicID (36) := Pic.FileNew ("spa9.jpg")

% print some card pictures in the screen to decorate
Draw.FillBox (0, 0, maxx, maxy, 29)
var numberOfCard : array 1 .. 17 of int
var locationOfX : int := 82
var locationOfY : int := 53

for i : 1 .. 16
    randint (numberOfCard (i), 1, 36)
    Pic.Draw (PicID (numberOfCard (i)), locationOfX, locationOfY, picCopy)
    if locationOfX < maxx - 153 and locationOfY < round (maxy / 2) then
	locationOfX := locationOfX + 153
    elsif locationOfX > round (maxx / 2) and locationOfY < maxy - 150 then
	locationOfY := locationOfY + 149
    elsif locationOfX > 82 and locationOfY > round (maxy / 2) then
	locationOfX := locationOfX - 153
    elsif locationOfX < round (maxx / 2) and locationOfY > 52 then
	locationOfY := locationOfY - 149
    end if
end for

% print the title in the middle of the screen
var font : int

font := Font.New ("Palatino:40:bold,italic")
Draw.Text ("Brain Storming v1.0", round (1 / 4 * maxx), round (3 / 5 * maxy), font, red)
font := Font.New ("mono:16")
Draw.Text ("----by Aaron Wang & Tom Li", round (1 / 2 * maxx), round (2 / 5 * maxy), font, blue)
Draw.Text ("press any key to continue... ", round (1 / 4 * maxx), round (1 / 3 * maxy), font, red)
colorback (52)

% this procedure will wait until a key is pressed to restart
procedure resume
    var character : char
    character := getchar
end resume
resume
cls

% print the instructions of this program
font := Font.New ("mono:22:bold")
Draw.Text ("Please read the following instructions carefully", round (1 / 20 * maxx), round (19 / 20 * maxy), font, red)
Draw.Text ("and patiently", round (1 / 20 * maxx), round (18 / 20 * maxy), font, red)
locate (8, 1)
put "         This game will randomly display N (entered by the user) cards. "
put "         You need to use all of these cards with the operations of addition, "
put "         subtraction, multiplication and division (with brackets) to try to "
put "         make the target number (set by the user ahead of time). "
put "         For example, for 3+8=11, the target number is 11"
locate (15, 10)
put "NOTE: when you enter your solution, please: "
put "         1. please enter an expression (ex. enter '5+6' rather than '5+6=11') "
put "         2. use '+','-','*','/' for addition, subtraction, multiplication and division respectively"
put "         3. do not leave any blanks (ex. '5+6' rather than '5 + 6')"
put "         4. only '()' is allowed, no any other type of brackets, like '[]' or '{}'"
put "         For example, if you set the target number to be 24, and you have four cards 8,8,3,3, "
put "         you are supposed to type in '8/(3-8/3)'"
Draw.Text ("If you are ready, then...", round (1 / 15 * maxx), round (8 / 20 * maxy), font, red)
Draw.Text ("press any key to continue", round (1 / 6 * maxx), round (7 / 20 * maxy), font, red)
resume
colorback (29)
cls

% prompt the user to enter the number of times he or she is going to play, the number of cards and the target number
var numOfTimes, numOfCards, targetNumber : string
% declare as string just to prevent some silly people from crushing the program

put "How many times do you want to play?"
loop
    get numOfTimes
    if strintok (numOfTimes) then
	if strint (numOfTimes) > 0 then
	    exit
	end if
    end if
    put "Please enter a positive integer!!!"
end loop
put "How many cards do you want to have? (between 2 to 8)"
loop
    get numOfCards
    if strintok (numOfCards) then
	if strint (numOfCards) > 1 and strint (numOfCards) < 9 then
	    exit
	end if
    end if
    put "Please enter a positive integer between 2 to 8!!!"
end loop
put "What is the target number? (the number you are going to make with these cards)"
loop
    get targetNumber
    if strintok (targetNumber) then
	if strint (targetNumber) > 0 and strint (targetNumber) < strint (numOfCards) ** 4 then
	    exit
	end if
    end if
    put "Please enter a positive integer that is less than ", strint (numOfCards) ** 4
end loop
cls

% this subprogram will read in an expression, remove the brackets in it, and reasult the expression without brackets
function removeBrackets (expression : string) : string
    var placeRightBracket, placeLeftBracket : int := 0
    % place is the place of "(" or ")" in the expression, counting from left to right
    var answer : real

    for i : 1 .. length (expression)
	% find the place of the leftmost ")"
	if ord (expression (i)) = 41 then
	    placeRightBracket := i
	    for decreasing j : placeRightBracket .. 1
		% find the place of corresponding "("
		if ord (expression (j)) = 40 then
		    placeLeftBracket := j
		    exit
		end if
	    end for
	    exit
	end if
    end for
    % if there is no brackets, just result the expression
    if placeLeftBracket = 0 or placeRightBracket = 0 then
	result expression
    else
	% if the user didn't use brackets properly, result an random word to generate an invalid solution
	if strintok (expression (placeLeftBracket + 1)) = false or strintok (expression (placeRightBracket - 1)) = false then
	    result "invalid expression"
	    % result the expression after removing a pair of brackets to the same subprogram to remove it again
	else
	    if placeLeftBracket = 1 and placeRightBracket = length (expression) then
		result removeBrackets (expression (placeLeftBracket + 1 .. placeRightBracket - 1))
	    elsif placeLeftBracket = 1 then
		result removeBrackets (expression (placeLeftBracket + 1 .. placeRightBracket - 1) + expression (placeRightBracket + 1 .. *))
	    elsif placeRightBracket = length (expression) then
		result removeBrackets (expression (1 .. placeLeftBracket - 1) + expression (placeLeftBracket + 1 .. placeRightBracket - 1))
	    else
		result removeBrackets (expression (1 .. placeLeftBracket - 1) + expression (placeLeftBracket + 1 .. placeRightBracket - 1)
		    + expression (placeRightBracket + 1 .. *))
	    end if
	end if
    end if
end removeBrackets

% this program test if the expression entered is valid or not
function validityOfSolution (expression : string, value : array 1 .. * of real) : boolean
    var numberOfRightBracket, numberOfLeftBracket : int := 0
    var validity : boolean := true
    var withoutBrackets : string
    var correspond, correspondCardToNumber : boolean
    var countNumbers : int := 0

    % check if there is any other character rather than numbers, arithmetic operators and brackets
    for i : 1 .. length (expression)
	if (ord (expression (i)) < 47 or ord (expression (i)) > 57) and (ord (expression (i)) < 40 or ord (expression (i)) > 43) and ord (expression (i)) not= 45 then
	    validity := false
	end if
    end for
    if validity = true then
	% remove brackets in the expression
	withoutBrackets := removeBrackets (expression)
	for i : 1 .. length (withoutBrackets) by 2
	    if strintok (withoutBrackets (i)) = false then
		validity := false
	    elsif validity = true then
		countNumbers := countNumbers + 1
		% make sure the user uses the number from the card
		correspond := false
		for j : 1 .. strint (numOfCards)
		    if value (j) = strint (withoutBrackets (i)) then
			correspond := true
		    end if
		    % make sure the user has used all the cards
		    correspondCardToNumber := false
		    for k : 1 .. length (withoutBrackets) by 2
			if strrealok (withoutBrackets (k)) = true then
			    if value (j) = strreal (withoutBrackets (k)) then
				correspondCardToNumber := true
			    end if
			end if
		    end for
		    if correspondCardToNumber = false then
			validity := false
		    end if
		end for
		if correspond = false then
		    validity := false
		end if
	    end if
	end for
	% make sure the user has the same number of numbers in the expression as the number of cards
	if validity = true then
	    if countNumbers not= strint (numOfCards) then
		validity := false
	    end if
	end if

	for i : 2 .. length (withoutBrackets) by 2
	    if strintok (withoutBrackets (i)) = true then
		validity := false
	    end if
	end for
    end if
    result validity
end validityOfSolution

% this subprogram will result the value after doing the appropriate operation (i.e. +, -, * or /) between the two real numbers
function operation (operator : int, numOne : real, numTwo : real) : real
    % result to the function is declared as real type because division will generate a real type
    var product : real
    case operator of
	label 42 :
	    product := numOne * numTwo
	label 43 :
	    product := numOne + numTwo
	label 45 :
	    product := numOne - numTwo
	label 47 :
	    if numTwo = 0 then
		product := -101
		% The divisor cannot be zero
	    else
		product := numOne / numTwo
	    end if
	label :
	    product := -101
    end case
    % According to the ASCII number of these four operators, namely "+-*/", operate the appropriate calculation
    result product
end operation

% this subprogram will read in an expression of string type (without brackets), and result the value of this expression
function calculationWithoutBracket (expression : string) : real
    var numOne, numTwo : string
    var countOperator, countLevelTwo, countLevelOne : int := 0
    % Level Two means the operations of multiplication and division
    % Level One means the operations of addition and subtraction
    % count is the number of operators in the input expression
    var placeOperator, placeLevelTwo, placeLevelOne : array 0 .. length (expression) of int
    % place is the place of operator, counting from left to right
    var answer : real

    % if there is nothing in the expression, just result it
    if length (expression) = 0 then
	result strreal (expression)
    else
	for i : 1 .. length (expression)
	    if ord (expression (i)) = 42 or ord (expression (i)) = 47 then
		countLevelTwo := countLevelTwo + 1
		placeLevelTwo (countLevelTwo) := i
		placeOperator (countLevelTwo + countLevelOne) := i
	    elsif ord (expression (i)) = 43 or ord (expression (i)) = 45 then
		countLevelOne := countLevelOne + 1
		placeLevelOne (countLevelOne) := i
		placeOperator (countLevelTwo + countLevelOne) := i
	    end if
	end for
	countOperator := countLevelOne + countLevelTwo
	if countOperator = 0 then
	    result strreal (expression)
	    % the case that there is only one operator in the expression
	elsif countOperator = 1 then
	    numOne := expression (1 .. placeOperator (1) - 1)
	    numTwo := expression (placeOperator (1) + 1 .. *)
	    answer := operation (ord (expression (placeOperator (1))), strreal (numOne), strreal (numTwo))
	    result answer
	else
	    % operate the calculation of multiplication and division first
	    if countLevelTwo > 0 then
		for i : 1 .. countOperator
		    if placeOperator (i) = placeLevelTwo (1) then
			if i = 1 then
			    numOne := expression (1 .. placeLevelTwo (1) - 1)
			else
			    numOne := expression (placeOperator (i - 1) + 1 .. placeLevelTwo (1) - 1)
			end if
			if i = countOperator then
			    numTwo := expression (placeLevelTwo (1) + 1 .. *)
			else
			    numTwo := expression (placeLevelTwo (1) + 1 .. placeOperator (i + 1) - 1)
			end if
			answer := operation (ord (expression (placeLevelTwo (1))), strreal (numOne), strreal (numTwo))
			if answer < 0 then
			    result answer
			end if
			if i = 1 then
			    result calculationWithoutBracket (realstr (answer, 5) + expression (placeOperator (i + 1) .. *))
			elsif i = countOperator then
			    result calculationWithoutBracket (expression (1 .. placeOperator (i - 1)) + realstr (answer, 5))
			else
			    result calculationWithoutBracket (expression (1 .. placeOperator (i - 1)) + realstr (answer, 5) + expression (placeOperator (i + 1) .. *))
			end if
			exit
		    end if
		end for
	    else
		% operate the calculation with the two numbers
		numOne := expression (1 .. placeLevelOne (1) - 1)
		numTwo := expression (placeLevelOne (1) + 1 .. placeLevelOne (2) - 1)
		answer := operation (ord (expression (placeLevelOne (1))), strreal (numOne), strreal (numTwo))
		if answer < 0 then
		    result answer
		end if
		result calculationWithoutBracket (realstr (answer, 5) + expression (placeLevelOne (2) .. *))
	    end if
	end if
    end if
end calculationWithoutBracket

% this subprogram will read in an expression of string type (with brackets), and result the value of this expression
function calculation (expression : string) : real
    var placeRightBracket, placeLeftBracket : int := 0
    var answer : real
    for i : 1 .. length (expression)
	if ord (expression (i)) = 41 then
	    placeRightBracket := i
	    for decreasing j : placeRightBracket .. 1
		if ord (expression (j)) = 40 then
		    placeLeftBracket := j
		    exit
		end if
	    end for
	    exit
	end if
    end for
    % if there is no brackets in the expression, then use the subprogram above to calculate the answer
    if placeRightBracket = 0 then
	result calculationWithoutBracket (expression)
	% if there are brackets in the expression, then use the subprogram above to calculate the value inside the brackets,
	% remove the brackets, and result the expression to calculate it again
    else
	answer := calculationWithoutBracket (expression (placeLeftBracket + 1 .. placeRightBracket - 1))
	if answer < 0 then
	    result - 101
	else
	    if placeLeftBracket = 1 and placeRightBracket = length (expression) then
		result answer
	    elsif placeLeftBracket = 1 then
		result calculation (realstr (answer, 5) + expression (placeRightBracket + 1 .. *))
	    elsif placeRightBracket = length (expression) then
		result calculation (expression (1 .. placeLeftBracket - 1) + realstr (answer, 5))
	    else
		result calculation (expression (1 .. placeLeftBracket - 1) + realstr (answer, 5) + expression (placeRightBracket + 1 .. *))
	    end if
	end if
    end if
end calculation

% these variables are decalred as a public variable, so that it can be used later on
var finalExp : array 1 .. strint (numOfCards) - 1 of string
var expOfi : array 1 .. strint (numOfCards) of string
var expOfj : array 1 .. strint (numOfCards) of string
% this subprogram calculate the answer to the corresponding cards and target number
function answer (number : array 1 .. * of real, sizeOfNumber : int) : boolean
    var newSizeOfNumber : int
    var newNumbers : array 1 .. 15 of real
    var newNumber : array 1 .. strint (numOfCards) of real
    var expOfOperation : array 1 .. strint (numOfCards) of string

    % if there is only a number, the answer to the cards is the number
    if sizeOfNumber = 1 then
	if abs (number (1) - strint (targetNumber)) < 0.01 then
	    % since the operation of division is involved, then the value may lose some accurity
	    result true
	else
	    result false
	end if
    else
	% select two numbers from these cards, and check all those four different operations
	for i : 1 .. sizeOfNumber - 1               % i is the first number
	    for j : i + 1 .. sizeOfNumber           % j is the second number
		% copy the array and remove the two selected numbers from it
		for operation : 1 .. 6
		    for copyArray : 1 .. sizeOfNumber
			newNumbers (copyArray) := number (copyArray)
		    end for
		    newSizeOfNumber := sizeOfNumber
		    for RemoveFirstNum : i + 1 .. newSizeOfNumber
			newNumbers (RemoveFirstNum - 1) := newNumbers (RemoveFirstNum)
		    end for
		    newSizeOfNumber := newSizeOfNumber - 1
		    if j > 1 then
			for RemoveSecondNum : j .. newSizeOfNumber
			    newNumbers (RemoveSecondNum - 1) := newNumbers (RemoveSecondNum)
			end for
		    end if
		    newSizeOfNumber := newSizeOfNumber - 1
		    expOfi (newSizeOfNumber + 1) := realstr (number (i), 2)
		    expOfj (newSizeOfNumber + 1) := realstr (number (j), 2)
		    % try different operations of these two numbers (i.e. addition, subtraction, division and multiplication)
		    case operation of
			label 1 :
			    newNumber (newSizeOfNumber + 1) := number (i) + number (j)
			    expOfOperation (newSizeOfNumber + 1) := "(" + expOfi (newSizeOfNumber + 1) + "+" + expOfj (newSizeOfNumber + 1) + ")"
			label 2 :
			    if number (i) > number (j) then
				newNumber (newSizeOfNumber + 1) := number (i) - number (j)
				expOfOperation (newSizeOfNumber + 1) := "(" + expOfi (newSizeOfNumber + 1) + "-" + expOfj (newSizeOfNumber + 1) + ")"
			    end if
			label 3 :
			    if number (j) > number (i) then
				newNumber (newSizeOfNumber + 1) := number (j) - number (i)
				expOfOperation (newSizeOfNumber + 1) := "(" + expOfj (newSizeOfNumber + 1) + "-" + expOfi (newSizeOfNumber + 1) + ")"
			    end if
			label 4 :
			    newNumber (newSizeOfNumber + 1) := number (i) * number (j)
			    expOfOperation (newSizeOfNumber + 1) := "(" + expOfi (newSizeOfNumber + 1) + "*" + expOfj (newSizeOfNumber + 1) + ")"
			label 5 :
			    if number (j) not= 0 then
				newNumber (newSizeOfNumber + 1) := number (i) / number (j)
				expOfOperation (newSizeOfNumber + 1) := "(" + expOfi (newSizeOfNumber + 1) + "/" + expOfj (newSizeOfNumber + 1) + ")"
			    end if
			label 6 :
			    if number (i) not= 0 then
				newNumber (newSizeOfNumber + 1) := number (j) / number (i)
				expOfOperation (newSizeOfNumber + 1) := "(" + expOfj (newSizeOfNumber + 1) + "/" + expOfi (newSizeOfNumber + 1) + ")"
			    end if
		    end case
		    % add the result to the array
		    for decreasing addNum : newSizeOfNumber .. 1
			newNumbers (addNum + 1) := newNumbers (addNum)
		    end for
		    newSizeOfNumber := newSizeOfNumber + 1
		    newNumbers (1) := newNumber (newSizeOfNumber)
		    % if the solution is found, result true, and record the solution as finalExp
		    if answer (newNumbers, newSizeOfNumber) = true then
			if newSizeOfNumber = 1 then
			    finalExp (1) := expOfOperation (1)
			else
			    for decreasing p : newSizeOfNumber .. 1
				if realstr (newNumber (newSizeOfNumber), 2) = expOfi (p) then
				    finalExp (newSizeOfNumber) := finalExp (newSizeOfNumber - 1) (1 .. index (finalExp (newSizeOfNumber - 1), expOfi (p)) - 1) +
					expOfOperation (newSizeOfNumber) +
					finalExp (newSizeOfNumber - 1) (index (finalExp (newSizeOfNumber - 1), expOfi (p)) + length (expOfi (p)) .. *)
				    exit
				elsif realstr (newNumber (newSizeOfNumber), 2) = expOfj (p) then
				    finalExp (newSizeOfNumber) := finalExp (newSizeOfNumber - 1) (1 .. index (finalExp (newSizeOfNumber - 1), expOfj (p)) - 1) +
					expOfOperation (newSizeOfNumber) +
					finalExp (newSizeOfNumber - 1) (index (finalExp (newSizeOfNumber - 1), expOfj (p)) + length (expOfj (p)) .. *)
				    exit
				end if
			    end for
			end if
			result true
		    end if
		end for
	    end for
	end for
    end if
    result false
end answer

% main program for the game
var solution : string
var word : array 1 .. 20 of string
var num : array 1 .. 20 of int
var number : array 1 .. * of int := init (0)
var count, countCorrect : int := 0
var valueOfSolution : real
var score : real := 0
loop
    cls
    colorback (29)
    % display some random stuff while the computer is operating
    font := Font.New ("serif:15")
    Draw.Text ("It may take a while to set it up, go back and drink a cup of tea...", 60, 600, font, red)
    var x : int := round (maxx / (strint (numOfCards) + 1) - 35)
    var value : array 1 .. strint (numOfCards) of real
    var card : array 1 .. strint (numOfCards) of int
    loop
	% record the value for the corresponding cards
	for i : 1 .. strint (numOfCards)
	    randint (card (i), 1, 36)
	    value (i) := card (i) mod 9
	    if card (i) mod 9 = 0 then
		value (i) := 9
	    end if
	end for
	% if there is a solution, then display the pictures of cards
	if answer (value, strint (numOfCards)) = true then
	    cls
	    font := Font.New ("serif:20")
	    Draw.Text ("Here are your " + numOfCards + " Cards:", 60, 620, font, red)
	    for i : 1 .. strint (numOfCards)
		Pic.Draw (PicID (card (i)), x, maxy - 170, picCopy)
		x := x + round (maxx / (strint (numOfCards) + 1))
		delay (500)
	    end for
	    exit
	end if
    end loop
    % print the current score at the bottom of the screen
    font := Font.New ("serif:20:bold")
    Draw.Text ("Your Score: " + realstr (score, 4) + "%", 530, 50, font, red)
    locate (15, 1)
    put "Please enter your solution... (enter -1 to give up and display the correct answer)"
    loop
	get solution
	font := Font.New ("mono:17:bold")
	% if the user enters -1 and gives up, display the correct answer
	if solution = "-1" then
	    Draw.Text ("The correct answer should be " + finalExp (strint (numOfCards) - 1) + "=" + targetNumber, 30, 5 * round (maxy / 20), font, blue)
	    exit
	else
	    % check if the user's solution is valid, keep asking until a valid solution is entered
	    if validityOfSolution (solution, value) = true then
		valueOfSolution := calculation (solution)
		if valueOfSolution = strint (targetNumber) then
		    Draw.Text ("Correct Answer!!! good job!", 30, 5 * round (maxy / 20), font, red)
		    countCorrect := countCorrect + 1
		    exit
		else
		    Draw.Text ("Wrong Answer, please try next time... :(", 30, 6 * round (maxy / 20), font, red)
		    Draw.Text ("The correct answer should be " + finalExp (strint (numOfCards) - 1) + "=" + targetNumber, 30, 5 * round (maxy / 20), font, blue)
		    exit
		end if
	    else
		put "Invalid solution, please enter again!"
	    end if
	end if
    end loop
    Draw.Text ("Press any key to continue...", 30, 4 * round (maxy / 20), font, blue)
    resume
    count := count + 1
    score := countCorrect / count * 100
    exit when count = strint (numOfTimes)
end loop
cls


% Display a set of card pictures to decorate
Draw.FillBox (0, 0, maxx, maxy, 52)
locationOfX := 82
locationOfY := 53
for i : 1 .. 16
    randint (numberOfCard (i), 1, 36)
    Pic.Draw (PicID (numberOfCard (i)), locationOfX, locationOfY, picCopy)
    if locationOfX < maxx - 153 and locationOfY < round (maxy / 2) then
	locationOfX := locationOfX + 153
    elsif locationOfX > round (maxx / 2) and locationOfY < maxy - 150 then
	locationOfY := locationOfY + 149
    elsif locationOfX > 82 and locationOfY > round (maxy / 2) then
	locationOfX := locationOfX - 153
    elsif locationOfX < round (maxx / 2) and locationOfY > 52 then
	locationOfY := locationOfY - 149
    end if
end for

% Print the score of the user
font := Font.New ("Palatino:23:bold,italic")
Draw.Text ("Thank You For Using Brain Storming v1.1", round (1 / 5 * maxx), round (12 / 20 * maxy), font, red)
Draw.Text ("Your have answered " + intstr (countCorrect) + " question(s) correctly ", round (1 / 5 * maxx), round (10 / 20 * maxy), font, red)
Draw.Text ("out of " + intstr (count) + " question(s)", round (1 / 5 * maxx), round (8 / 20 * maxy), font, red)
Draw.Text ("Your Final Score is " + realstr (score, 0) + "%", round (1 / 5 * maxx), round (6 / 20 * maxy), font, red)
