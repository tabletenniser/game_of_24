% J2

var a, b, c, d, s : int
var steps : int := 0
get a, b, c, d, s

function A (k : int, l : int, m : int) : int
    var temp : int := m
    loop
	exit when temp = 0
	if temp div k > 0 then
	    steps := steps + k
	    temp := temp - k
	    if temp div l > 0 then
		steps := steps - l
		temp := temp - l
	    else
		steps := steps - temp
		temp := temp - temp
	    end if
	else
	    steps := steps + temp
	    temp := temp - temp
	end if
    end loop
    result steps
end A
if A (a, b, s) = A (c, d, s) then
    put "Tied"
elsif A (a, b, s) > A (c, d, s) then
    put "Nikky"
else
    put "Bryon"
end if
