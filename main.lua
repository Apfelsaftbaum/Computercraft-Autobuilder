--[[This is a building programm v1.0]]--
--[[To do: more structures(maybe grouped by mods in a seperate window), add multistructures, add variables and functions to sum up code or speed up programming, cleaner and organized ui(maybe with fancy clickeffects and/or colors \o/),load external lua as addon, be creative]]--
local inputmenue
local itemcount
local slot = 1
local fuellvl
local itemcount2 = 0
local itest = 0
local acislot
local counter = 0
local calcbuild
local calcnumber
local calcint
local ergebnis
local number
local x,y,z = 1,1,1
local xa
local ya
local za


function check1()
        itemcount = turtle.getItemCount()
        if itemcount < 1 then
           slot = slot + 1    
            turtle.select(slot)
        end
end

--CHECK ITEMCOUNT

--to do:
--mabe do a splitted Check in 2 functions and check the itemtags or ids + ammount
--add it to calculator
function itemtest()
		term.clear()
		turtle.select(1)
		itest = turtle.getItemCount()
		acislot = turtle.getSelectedSlot()
		if itest == 64 then
			sleep(0.5)
			print("Check Slot 1:")
			sleep(0.7)
			print("clear")
			sleep(0,5)
			counter = counter + 1
		else
			printError("Zu wenig Items in Slot: "..acislot.. " Bitte einen Stack Thermal Evaporation Blocks in Slot: "..acislot.." geben")
			print(" ")
			sleep(1.2)
		end
		turtle.select(2)
		itest = turtle.getItemCount()
		acislot = turtle.getSelectedSlot()
		if itest == 64 then
			print("Check Slot 2:")
			sleep(0.7)
			print("clear")
			sleep(0.5)
			counter = counter + 1
		else
			printError("Zu wenig Items in Slot: "..acislot.." Bitte einen Stack Thermal Evaporation Blocks in Slot: "..acislot.." geben")
			print(" ")
			sleep(1.2)
		end
		turtle.select(3)
		itest = turtle.getItemCount()
		acislot = turtle.getSelectedSlot()
		if itest == 64 then
			print("Check Slot 3:")
			sleep(0.7)
			print("clear")
			sleep(0.5)
			counter = counter + 1
		else
			printError("Zu wenig Items in Slot: "..acislot.." Bitte einen Stack Thermal Evaporation Blocks in Slot; "..acislot.." geben")
			print(" ")
			sleep(1.2)
		end
		turtle.select(4)
		itest = turtle.getItemCount()
		acislot = turtle.getSelectedSlot()
		if itest > 27 then
			print("Check Slot 4:")
			sleep(0.7)
			print("clear")
			sleep(0.5)
			counter = counter + 1			
		else
			printError("Zu wenig Items in Slot: "..acislot.." Bitte mindestens 28 Thermal Evaporation Blocks in Slot; "..acislot.." geben")
			print(" ")
			sleep(1.2)
		end
		turtle.select(14)
		itest = turtle.getItemCount()
		acislot = turtle.getSelectedSlot()
		if itest > 0 then
			print("Check Slot 14:")
			sleep(0.7)
			print("clear")
			sleep(0.5)
			counter = counter + 1
		else
			printError("Zu wenig Items in Slot: "..acislot.." Bitte mindestens einen Controller in Slot; "..acislot.." geben")
			print(" ")
			sleep(1.2)
		end
		turtle.select(15)
		itest = turtle.getItemCount()
		acislot = turtle.getSelectedSlot()
		if itest > 1 then
			print("Check Slot 15:")
			sleep(0.7)
			print("clear")
			sleep(0.5)
			counter = counter + 1
		else
			printError("Zu wenig Items in Slot: "..acislot.." Bitte mindestens zwei Valves in Slot; "..acislot.." geben")
			print(" ")
			sleep(1.2)
		end
	
end



--ADDONS/TOOLS
--Calculator
function calc()
	term.clear()
	print("Bitte Gebäude auswählen")
	print(" ")
	print("[Thermal Evaporation Block]")
	print(" ")
	print(" ")
	print(" ")
	print(" ")
	print(" ")
	print(" ")
	print(" ")
	print(" ")
	print(" ")
	write("[Hauptmenü]                      [Exit]")
	local event, button, x, y = os.pullEvent("mouse_click")
	if button == 1 and y == 3 and x < 28 then
		calckclick()
	elseif button == 1 and y == 13 and x < 12 then
		menue()
	elseif button == 1 and y == 13 and x > 33 then
		term.clear()
		sleep(0.5)
		print("Goodbye Sir")
	else
		calc()
	end
end

function calckclick()
	term.clear()
	print("Bitte Anzahl der Gebäude eingeben")
	calcnumber = read()
	print("Einen Moment")
	calcint = tonumber(calcnumber)
	sleep(0.25)
	ergebnis = 220 * calcint
	term.clear()
	print("---------")
	print("Thermal Evaporation Blocks: "..ergebnis.."x")
	ergebnis = 2 * calcint
	print("Valves: "..ergebnis.."x")
	ergebnis = 1 * calcint
	print("Controller: "..ergebnis.."x")
	print("---------")
	write("[Weiter]")
	triggermenue()
end

function triggermenue()
	local event, button, x, y = os.pullEvent("mouse_click")
	if button == 1 and y == 13 and x < 9 then
		menue()
	else
		triggermenue()
	end
end
		
--Build Thermal Evaporation Plant		
function tepsetup()
    term.clear()
	print(" ")
	print(" ")
    print("----------------------")
    print("Thermal Evaporation Block: 220 -> Slot 1-4")
    print(" ")
    print("Thermal Evaporotion Controller: 1 -> Slot 14")
    print(" ")
    print("Thermal Evaportaion Valve: 2 -> Slot 15")
    print("----------------------")
	print(" ")
	print(" ")
    print(" ")
    write("[Weiter]  [Menü]   [Itemcheck]   [Exit]")
	tepinit()
end

--[[ integer = zahlen , string = text]]--

function tepinit()
	local event, button, x, y = os.pullEvent("mouse_click")
	if button == 1 and y == 13 and x < 9 then
		itemtest()
		tepbuild()
	elseif button == 1 and y == 13 and x > 19 and x < 31 then
		itemtest()
		sleep(2)
		tepsetup()
	elseif button == 1 and y == 13 and x > 33 then
		term.clear()
		sleep(0.5)
		print("Goodbye Sir")
	elseif button == 1 and y == 13 and x > 10 and x < 17 then
		menue()
	else
		tepinit()
	end
end

function tepbuild()
		if counter == 6 then
			term.clear()
			print("Bauvorgang wird gestartet")
			turtle.select(1)
			for a = 1,18 do
				turtle.up()
				check1()
				for a = 1,4 do
					check1()
					for a = 1,3 do
						check1()
						turtle.forward()
						turtle.placeDown()
					end
					turtle.turnLeft()
				end
			end
			turtle.forward()
			turtle.turnLeft()
			turtle.forward()
			for a = 1,17 do
				turtle.down()
			end
			for a = 1,4 do
				check1()
				turtle.placeDown()
				turtle.forward()
				turtle.turnRight()
			end
			turtle.turnLeft()
			turtle.turnLeft()
			turtle.select(15)
			turtle.dig()
			turtle.place()
			for a = 1,2 do
				turtle.turnRight()
			end
			turtle.forward()
			turtle.dig()
			turtle.place()
			turtle.turnLeft()
			turtle.dig()
			turtle.forward()
			turtle.forward()
			turtle.turnLeft()
			turtle.turnLeft()
			turtle.select(14)
			turtle.place()
			turtle.turnRight()
			turtle.forward()
			turtle.forward()
			turtle.turnRight()
			turtle.down()
			term.clear()
			print("Der Vorgang wurde erfolgreich abgeschlossen")
		else
			print("Bitte Materialien auffüllen")
			sleep(2)
			tepsetup()
		end
end


--Turbine
function tursetup()
	print("Dieser Teil ist noch nicht fertig")
end

--Fussionsreaktor
function fusionsetup()
    term.clear()
	print(" ")
	print(" ")
    print("----------------------")
    print("Fusion Reactor Frame -> Slot 1-4")
    print(" ")
    print("Fusion Reactor Controller: 1 -> Slot 13")
    print(" ")
    print("Fusion Reactor Port: 3 -> Slot 14")
	print(" ")
	print("Laser Focus Matrix -> Slot 15")
    print("----------------------")
    print(" ")
    write("[Weiter]  [Menü]   [Itemcheck]   [Exit]")
	fusionclick()
end

function fusionclick()
	local event, button, x, y = os.pullEvent("mouse_click")
	if button == 1 and y == 13 and x < 9 then
		fusionbuildglass()
	elseif button == 1 and y == 13 and x > 19 and x < 31 then
		fusionclick()
	elseif button == 1 and y == 13 and x > 33 then
		term.clear()
		sleep(0.5)
		print("Goodbye Sir")
	elseif button == 1 and y == 13 and x > 10 and x < 17 then
		menue()
	else
		fusionclick()
	end
end

function fusionbuildglass()
	turtle.select(1)
	up(1)
	for a = 1,5 do
		check1()
		forward(1)
		turtle.placeDown(1)
	end
	left(1)
	forward(1)
	left(1)
	for a = 1,3 do
		forward(1)
		placedown(1)
	end
	right(1)
	forward(1)
	right(1)
	forward(1)
	placedown(1)
	forward(1)
	right(1)
	forward(3)
	placedown(1)
	right(1)
	for a = 1,2 do
		check1()
		forward(1)
		placedown(1)
	end
	left(1)
	forward(1)
	left(1)
	forward(1)
	placedown(1)
	--Ebene 1 fertig
	fuelcapacity()
	up(1)
	forward(2)
	left(1)
	for a = 1,4 do
			forward(1)
			placedown(1)
			forward(1)
			turtle.select(12)
			placedown(1)
			forward(1)
			turtle.select(1)
			placedown(1)
			forward(1)
			left(1)
	end
	--Ebene 2 fertig
	fuelcapacity()
	turtle.select(1)
	up(1)
	placedown(1)
	turtle.select(12)
	forward(1)
	placedown(1)
	turtle.select(15)
	forward(1)
	placedown(1)
	turtle.select(12)
	forward(1)
	placedown(1)
	turtle.select(1)
	forward(1)
	placedown(1)
	left(1)
	for a = 1,3 do
			turtle.select(1)
			placedown(1)
			forward(1)
			turtle.select(12)
			placedown(1)
			turtle.select(14)
			forward(1)
			placedown(1)
			turtle.select(12)
			forward(1)
			placedown(1)
			turtle.select(1)
			forward(1)
			placedown(1)
			left(1)
	end
	--Ebene 3 fertig
	up(1)
	fuelcapacity()
	for a = 1,4 do
			forward(1)
			placedown(1)
			forward(1)
			turtle.select(12)
			placedown(1)
			forward(1)
			turtle.select(1)
			placedown(1)
			forward(1)
			left(1)
	end
	--Ebene 4 fertig
	fuelcapacity()
	up(1)
	left(1)
	forward(2)
	right(1)
	
	placedown(1)
	forward(1)
	placedown(1)
	forward(1)
	turtle.select(13)
	placedown(1)
	forward(1)
	turtle.select(1)
	placedown(1)
	forward(1)
	placedown(1)
	forward(1)
	right(1)
	forward(1)
	right(1)
	forward(2)
	for a = 1,3 do
		placedown(1)
		forward(1)
	end
	left(1)
	forward(1)
	left(1)
	forward(2)
	placedown(1)
	forward(2)
	left(1)
	forward(3)
	left(1)
	for a = 1,3 do 
		forward(1)
		placedown(1)
	end
	right(1)
	forward(1)
	right(1)
	forward(1)
	placedown(1)
	menue()
end

function fusionbuild()
	turtle.select(1)
	up(1)
	for a = 1,5 do
		check1()
		forward(1)
		turtle.placeDown(1)
	end
	left(1)
	forward(1)
	left(1)
	for a = 1,3 do
		forward(1)
		placedown(1)
	end
	right(1)
	forward(1)
	right(1)
	forward(1)
	placedown(1)
	forward(1)
	right(1)
	forward(3)
	placedown(1)
	right(1)
	for a = 1,2 do
		check1()
		forward(1)
		placedown(1)
	end
	left(1)
	forward(1)
	left(1)
	forward(1)
	placedown(1)
	--Ebene 1 erledigt
	up(1)
	forward(2)
	left(1)
	for a = 1,4 do
		for a = 1,4 do
			forward(1)
			placedown(1)
		end
		forward(1)
		left(1)
	end
	--Ebene 2 erledigt
	up(1)
	placedown(1)
	for a= 1,4 do
		for a = 1,4 do
			forward(1)
			placedown(1)
		end
		left(1)
	end
	--Ebene 3 erledigt
	up(1)
	for a = 1,4 do
		for a = 1,3 do
			forward(1)
			placedown(1)
		end
		forward(1)
		left(1)
	end
	--Ebene 4 erledigt
	forward(2)
	left(1)
	forward(5)
	left(2)
	--übergang letzte Ebene
	up(1)
	for a = 1,5 do
		forward(1)
		turtle.placeDown(1)
	end
	left(1)
	forward(1)
	left(1)
	for a = 1,3 do
		forward(1)
		placedown(1)
	end
	right(1)
	forward(1)
	right(1)
	forward(1)
	placedown(1)
	forward(1)
	right(1)
	forward(3)
	placedown(1)
	right(1)
	for a = 1,2 do
		forward(1)
		placedown(1)
	end
	left(1)
	forward(1)
	left(1)
	forward(1)
	placedown(1)
	--Base Cunstruct ready
	--Build Controller + Port + Laser Matrix
	left(1)
	forward(2)
	turtle.digDown()
	down(3)
	forward(1)
	turtle.dig()
	turtle.select(14)
	turtle.place()
	for a = 1,2 do
		back(1)
		left(1)
		forward(1)
		turtle.dig()
		turtle.place()
	end
	back(1)
	left(1)
	forward(1)
	turtle.dig()
	turtle.select(15)
	turtle.place()
	back(1)
	up(3)
	turtle.select(13)
	placedown(1)
	left(2)
	forward(3)
	down(5)
end

--BUILDINGFUNCTIONS
--some code improvements to make instructions smaller
--Directions
function forward(number)
	for a=1,number do
		turtle.forward()
	end
end

function back(number)
	for a=1,number do
		turtle.back()
	end
end

function up(number)
	for a=1,number do
		turtle.up()
	end
end

function down(number)
	for a=1,number do 
		turtle.down()
	end
end

function left(number)
	for a = 1,number do
		turtle.turnLeft()
	end
end

function right(number)
	for a = 1,number do
		turtle.turnRight()
	end
end


--Other functions
--Coardinte System
function move(x1,y1,z1)
	if x1 > x then
		xa = x1 - x
		if xa > 0 then
			left(1)
			forward(xa)
			right(1)
		end
	elseif x1 < x then
		xa = x - x1
		if xa > 0 then
			right(1)
			forward(xa)
			left(1)
		end
	end
	x = x1
	if y1 > y then
		ya = y1 - y
		forward(ya)	
	elseif y1 < y then
		ya = y - y1	
		back(ya)
	end
	y = y1
	if z1 > z then
		za = z1 - z
		up(za)
	elseif z1 < z then
		za = z - z1
		down(za)
	end
	z = z1
end

function build(slot,x2,y2,z2) --always needs to be one higher; maybe fix this later
	if x2 > x then
		xa = x2 - x
		if xa > 0 then
			left(1)
			forward(xa)
			right(1)
		end
	elseif x2 < x then
		xa = x - x2
		if xa > 0 then
			right(1)
			forward(xa)
			left(1)
		end
	end
	x = x2
	if y2 > y then
		ya = y2 - y	
		forward(ya)		
	elseif y2 < y then
		ya = y - y2	
		back(ya)	
	end
	y = y2
	if z2 > z then
		za = z2 - z		
		up(za)
	elseif z2 < z then
		za = z - z2	
		down(za)
	end
	z = z2
	turtle.select(slot)
	placedown()
end

function placedown()
	check1()
	turtle.placeDown()
end

function fuelcapacity()
	print(turtle.getFuelLevel())
end
	

--UTILITY/UI/INFRASTRUCTURE
--Mainmenue
function menue()
    term.clear()
	print("Hauptmenü")
    print(" ")
    print(" ")
    print("Autobuilder")
    print(" ")
	print("Made by Appletree")
    print(" ")
    print(" ")
    print(" ")
    print(" ")
    print(" ")
    print(" ")
	write("[Gebäude/Maschine]  [Tools]      [Exit]")
	menueclick()
end

function menueclick()
	local event, button, x, y = os.pullEvent("mouse_click")
	if button == 1 and y == 13 and x < 19 then
		buildmenue()
	elseif button == 1 and y == 13 and x > 20 and x < 28 then
		tools()
	elseif button == 1 and y == 13 and x > 33 then
		term.clear()
		sleep(0.5)
		print("Goodbye Sir")
	else
		menueclick()
	end
end
--Buildmenue
function buildmenue()
	term.clear()
	print("Gebäude/Maschinen Menü")
	print(" ")
    print("Maschinen:")
	print("------ ")
    print("[Thermal Evaporation Plant]")
    print("--")
	print("[Turbine]")
    print("--")
    print("[Fusionsreaktor luftgekühlt]")
    print("-- ")
    print(" ")
    print(" ")
	write("[Hauptmenü]          1  [>]      [Exit]")
	buildmenueclick()
end

function buildmenueclick()
	local event, button, x, y = os.pullEvent("mouse_click")
	if button == 1 and y == 13 and x < 12 then
		menue()
	elseif button == 1 and y == 13 and x > 24 and x < 28 then
		buildmenue2()
	elseif button == 1 and y == 13 and x > 33 then
		term.clear()
		sleep(0.5)
		print("Goodbye Sir")
	elseif button == 1 and y == 5 and x < 28 then
		tepsetup()
	elseif button == 1 and y == 7 and x < 10 then
		tursetup()
	elseif button == 1 and y == 9 and x < 29 then
		fusionsetup()
	else
		buildmenueclick()
	end
end
--Buildmenue Page 2
function buildmenue2()
	term.clear()
	print("Gebäude / Maschinen Menü")
	print(" ")
    print(" ")
    print(" ")
    print(" ")
	print(" ")
    print(" ")
    print(" ")
    print(" ")
    print(" ")
    print(" ")
    print(" ")
	write("[Hauptmenü]     [<]  2  [>]      [Exit]")
	buildmenueclick2()
end

function buildmenueclick2()
	local event, button, x, y = os.pullEvent("mouse_click")
	if button == 1 and y == 13 and x < 12 then
		menue()
	elseif button == 1 and y == 13 and x > 33 then
		term.clear()
		sleep(0.5)
		print("Goodbye Sir")
	elseif button == 1 and y == 13 and x > 16 and x < 20 then
		buildmenue()
	else
		buildmenueclick2()
	end
end
--Tools
function tools()
	term.clear()
	print("Tools")
	print("-----")
    print("[Calculator]")
    print("--")
    print("[Multibuild]")
	print("--")
    print(" ")
    print(" ")
    print(" ")
    print(" ")
    print(" ")
    print(" ")
	write("[Hauptmenü]          1  [>]      [Exit]")
	toolsclick()
end

function toolsclick()
	local event, button, x, y = os.pullEvent("mouse_click")
	if button == 1 and y == 13 and x < 12 then
		menue()
	elseif button == 1 and y == 3 and x < 13 then
		--calc()
		testbuild()
	elseif button == 1 and y == 13 and x > 33 then
		term.clear()
		sleep(0.5)
		print("Goodbye Sir")
	else
		toolsclick()
	end
end
--Startup
function startup()
local event, button, x, y = os.pullEvent("mouse_click")
	if button == 1 and y == 13 and x < 9 and fuellvl > 1000 then
		turtle.select(1)
		menue()
	elseif button == 1 and fuellvl > 1000 then
		startup()
	else
		refu()
		term.clear()
		print(" ")
		printError("Bitte Programm neu starten!") --cancel start because turtle cant pull enough fuel for building
		printError("Turtle hat zu wenig Kohle")
		print(" ")
	end
end

--Refuel the Turtle

--Fix the Bug turtle not starting on some occasions because of fuel but wont refuel
--balance fuel lvl
function refu()
	if turtle.getFuelLevel() < 1500 then
		turtle.select(16)
		turtle.refuel(8)
	end 
end

--Check if turtle can start

--!!Remove Bug on startup without clear command!!
function core()
	refu() --refuel turtle
	fuellvl = turtle.getFuelLevel()
	term.clear()
	print(" ")
	print(" ")
    print(" ")
    print("Autobuilder")
    print(" ")
	print("Made by Appletree")
    print(" ")
    print(" ")
    print(" ")
    print(" ")
	print("Bitte Kohle in Slot 16 geben")
	print(" ")
	write("[Weiter]")
	startup()--call startup function
end

--actuall start of the script
core()
