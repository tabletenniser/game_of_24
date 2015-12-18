% J4

function check (a : array 1 .. * of int, period : int, no : int) : boolean
    for i : 1 .. no - 1
	exit when i + period > no - 1
	if a (i) not= a (i + period) then
	    result false
	end if
    end for
    result true
end check

loop
    var command : string
    var l : int
    var b : int := 1
    get command : *
    exit when command = "0"
    l := strint (command (1))
    var temp : array 1 .. l of int
    var dif : array 1 .. l - 1 of int
    for i : 3 .. 2 * l + 1 by 2
	temp (b) := strint (command (i))
	if b > 1 then
	    dif (b - 1) := temp (b) - temp (b - 1)
	end if
	b := b + 1
    end for
    for i : 1 .. l
	if check (dif, i, l) = true then
	    put i
	    exit
	end if
    end for
end loop
