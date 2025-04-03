
function printInfo()
	--Get the emulation state
	state = emu.getState()
	
	--Get the mouse's state (x, y, left, right, middle)
	mouseState = emu.getMouseState()  
	
	bgColor = 0x502060FF
	fgColor = 0x30FF4040
	
	
	speed = emu.read(0x66,emu.memType.nesMemory)
	power = emu.read(0x64,emu.memType.nesMemory)
	health = emu.read(0x0603,emu.memType.nesMemory)
	lives = emu.read(0x11,emu.memType.nesMemory)
	stage = emu.read(0x15,emu.memType.nesMemory)
	
	--Draw some rectangles and print some text
	emu.drawRectangle(0, 8, 256, 48, bgColor, true)
	emu.drawRectangle(0, 8, 256, 48, fgColor, false)
	emu.drawString(10,  12, "[S] " .. speed, 0xFFFFFF, 0xFF000000)
	emu.drawString(42,  12, "[P] " .. power, 0xFFFFFF, 0xFF000000)
	emu.drawString(74,  12, "[H] " .. health, 0xFFFFFF, 0xFF000000)
	emu.drawString(116, 12, "[L] " .. lives, 0xFFFFFF, 0xFF000000)
	emu.drawString(175, 12, "Stage " .. stage, 0xFFFFFF, 0xFF000000)

	nObj=0
	listStart = 0x30
	listStep  = 0x6
	
	posXLo = 0x0400
	posXHi = 0x0401
	posYLo = 0x0402
	posYHi = 0x0403
	attributes = 0x0404
	
	for i=0,31,1
	do
	
		--x=54+i*listStep
		--y=24
		
		-- Check if object is active
		hasObj = 0x80 & emu.read(attributes+listStart+i*listStep,emu.memType.nesMemory);    
		
		-- Draw empty slot as default
		emu.drawRectangle(x,y ,4,4, 0x8000FFFF, false)
	
		-- If object is active, draw it
		if(hasObj~=0) then 
			
			emu.drawRectangle(x,y ,4,4,0x0000FFFF, true)
			nObj = nObj+1
			
			-- Get object's X and Y position (lo-byte only)
			xo=emu.read(posXLo+listStart+i*listStep,emu.memType.nesMemory)
			yo=emu.read(posYLo+listStart+i*listStep,emu.memType.nesMemory)
		  
			colorText = 0xFFFFFF
			colorPoint= 0x00FFFF
	
			if(emu.read(0x0431+i*listStep,emu.memType.nesMemory)>0) then
				-- If object is offscreen, use transparent colors
				colorText = 0x80FFFFFF
				colorPoint= 0x80FFFF00	     
			end
	
			emu.drawPixel(xo, yo,colorPoint, true) -- Draw object's position
			emu.drawString(xo+1, yo-8,  i, colorText, 0xFF000000) -- Write the object's index
			
			animAddress = emu.read(0x0531+i*listStep,emu.memType.nesMemory)
			animAddress = animAddress+256*emu.read(0x0532+i*listStep,emu.memType.nesMemory)
		  
			if	(emu.read(posXHi+listStart+i*listStep,emu.memType.nesMemory)==0 
				and (emu.read(posYHi+listStart+i*listStep,emu.memType.nesMemory)==0) )then
				emu.drawString(xo+16, yo+1, string.format("$%02X", animAddress), colorText, 0xFF000000)
				h1xo=emu.read(0x702+listStart+i*listStep,emu.memType.nesMemory)
				h2xo=emu.read(0x703+listStart+i*listStep,emu.memType.nesMemory)
				h1yo=emu.read(0x704+listStart+i*listStep,emu.memType.nesMemory)
				h2yo=emu.read(0x705+listStart+i*listStep,emu.memType.nesMemory)
				wo=h2xo-h1xo
				ho=h2yo-h1yo 
				emu.drawRectangle(h1xo,h1yo,wo,ho,0x0000FFFF,false)
			end
		end
	
	
	end	
	
	emu.drawString(12,22,"#obj "..nObj,0xFFFFFF, 0xFF000000)
	emu.drawString(12, 39,"Enemy Wave #"..emu.read(0x5B,emu.memType.nesMemory),0xFFFFFF, 0xFF000000)    
	emu.drawString(106, 39, "Next: "..emu.read(0x5C,emu.memType.nesMemory) , 0xFFFFFF, 0xFF000000)
	emu.drawString(175, 39, "Progress: "..emu.read(0x16,emu.memType.nesMemory) , 0xFFFFFF, 0xFF000000)

	x=emu.read(posXLo,emu.memType.nesMemory)
	--emu.drawLine(x,0,x,239,0x0FFF0FFF)
	y=emu.read(posYLo,emu.memType.nesMemory)
	--emu.drawLine(0,y,255,y,0x0FFF0FFF)
	emu.drawString(x+1, y-8, "Player" , 0xFFFFFF, 0xFF000000)
	
	h1x=emu.read(0x702,emu.memType.nesMemory)
	h2x=emu.read(0x703,emu.memType.nesMemory)
	h1y=emu.read(0x704,emu.memType.nesMemory)
	h2y=emu.read(0x705,emu.memType.nesMemory)
	w=h2x-h1x
	h=h2y-h1y 
	emu.drawRectangle(h1x,h1y,w,h,0x0000FFFF,false,1)
end

--Register some code (printInfo function) that will be run at the end of each frame
emu.addEventCallback(printInfo, emu.eventType.endFrame);

--Display a startup message
emu.displayMessage("Script", "Objects Visible.")