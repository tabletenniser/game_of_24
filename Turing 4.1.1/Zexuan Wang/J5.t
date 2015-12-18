% J5

% A recursion
var minimum : int := 999
function mini (a : int, b : int, c : int) : boolean
    if a = 0 and b = 0 then
	if c < minimum then
	    minimum := c
	    result true
	end if
    elsif c > 5 then
	result false
    else
	if mini (a - 2, b - 1, c + 1) = true then
	end if
	if mini (a - 2, b + 1, c + 1) = true then
	end if
	if mini (a + 2, b - 1, c + 1) = true then
	end if
	if mini (a + 2, b + 1, c + 1) = true then
	end if
	if mini (a - 1, b - 2, c + 1) = true then
	end if
	if mini (a + 1, b - 2, c + 1) = true then
	end if
	if mini (a - 1, b + 2, c + 1) = true then
	end if
	if mini (a + 1, b + 2, c + 1) = true then
	end if
    end if
    result true
end mini

% main program
var start : string
var ending : string
var aX, aY, bX, bY, xDiff, yDiff : int

get start : *
get ending : *
aX := strint (start (1))
aY := strint (start (3))
bX := strint (ending (1))
bY := strint (ending (3))
xDiff := bX - aX
yDiff := bY - aY
if mini (xDiff, yDiff, 0) = true then
end if
put minimum
