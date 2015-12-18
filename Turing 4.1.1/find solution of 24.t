% these variables are decalred as a public variable, so that it can be used later on
var numOfCards:="4"
var targetNumber:="10"

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
var num:array 1..4 of real:=init(9,5,6,7)
put answer(num,strint(numOfCards))
put finalExp (strint (numOfCards) - 1)
