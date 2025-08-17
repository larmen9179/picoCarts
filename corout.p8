pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
function _init()
	plr={}
	plr.x=32
	plr.y=64
	routines={}

	async(function()
		animate(plr,"x",64)
		wait(10)
		animate(plr,"x",96,30,easeoutquad)
		wait(30)
		animate(plr,"y",32)
	end)
end

function _update()
	for r in all(routines) do 
		if (costatus(r)) == "dead" then
			del(routines, r)
		else
			assert(coresume(r))
		end
	end
end

function _draw()
	cls()
	rectfill(plr.x,plr.y,plr.x+8,plr.y+8,7)
	?#routines
end

function async(func)
	add(routines,cocreate(func))
end

function animate(obj,k,v,f,e)
	local init=obj[k]
	f=f or 30
	e=e or linear
	
	for i=1,f do
		obj[k]=lerp(init,v,e(i/f))
		yield()
	end
end

function linear(t)
	return t
end

function lerp(a,b,t)
	return a+(b-a)*t
end

function easeoutquad(t)
	t-=1
	return 1-t*t
end

function easeinbounce(t)
	t=1-t
	local n1=7.5625
	local d1=2.75

	if (t<1/d1) then
		return 1-n1*t*t;
	elseif(t<2/d1) then
		t-=1.5/d1
		return 1-n1*t*t-.75;
	elseif(t<2.5/d1) then
		t-=2.25/d1
		return 1-n1*t*t-.9375;
	else
		t-=2.625/d1
		return 1-n1*t*t-.984375;
	end
end

function wait(f)
	for i=1,f do
		yield()
	end
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
