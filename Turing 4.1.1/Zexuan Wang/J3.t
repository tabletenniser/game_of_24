% J3

var a, b : int := 0
var command : string

loop
    get command : *
    exit when command (1) = "7"
    if command (1) = "1" then
	if command (3) = "A" then
	    a := strint (command (5))
	else
	    b := strint (command (5))
	end if
    elsif command (1) = "2" then
	if command (3) = "A" then
	    put a
	else
	    put b
	end if
    elsif command (1) = "3" then
	if command (3) = "A" and command (5) = "A" then
	    a := a + a
	elsif command (3) = "A" and command (5) = "B" then
	    a := a + b
	elsif command (3) = "B" and command (5) = "A" then
	    b := b + a
	elsif command (3) = "B" and command (5) = "B" then
	    b := b + b
	end if
    elsif command (1) = "4" then
	if command (3) = "A" and command (5) = "A" then
	    a := a * a
	elsif command (3) = "A" and command (5) = "B" then
	    a := a * b
	elsif command (3) = "B" and command (5) = "A" then
	    b := b * a
	elsif command (3) = "B" and command (5) = "B" then
	    b := b * b
	end if
    elsif command (1) = "5" then
	if command (3) = "A" and command (5) = "A" then
	    a := a - a
	elsif command (3) = "A" and command (5) = "B" then
	    a := a - b
	elsif command (3) = "B" and command (5) = "A" then
	    b := b - a
	elsif command (3) = "B" and command (5) = "B" then
	    b := b - b
	end if
    elsif command (1) = "6" then
	if command (3) = "A" and command (5) = "A" then
	    a := a div a
	elsif command (3) = "A" and command (5) = "B" then
	    a := a div b
	elsif command (3) = "B" and command (5) = "A" then
	    b := b div a
	elsif command (3) = "B" and command (5) = "B" then
	    b := b div b
	end if
    end if
end loop
