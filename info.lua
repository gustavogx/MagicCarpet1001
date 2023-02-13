--This is an example script to give a general idea of how to build scripts
--Press F5 or click the Run button to execute it
--Scripts must be written in Lua (https://www.lua.org)
--This text editor contains an auto-complete feature for all Mesen-specific functions
--Typing "emu." will display a list containing every available API function to interact with Mesen

function printInfo()
  --Get the emulation state
  state = emu.getState()

  --Get the mouse's state (x, y, left, right, middle)
  mouseState = emu.getMouseState()

  bgColor = 0x502060FF
  fgColor = 0x30FF4040

  --Draw some rectangles and print some text
  emu.drawRectangle(0, 8, 256, 48, bgColor, true, 1)
  emu.drawRectangle(0, 8, 256, 48, fgColor, false, 1)
  emu.drawString(10,  12, "[S] " .. emu.read(0x66,type), 0xFFFFFF, 0xFF000000, 1)
  emu.drawString(42,  12, "[P] " .. emu.read(0x64,type), 0xFFFFFF, 0xFF000000, 1)
  emu.drawString(74,  12, "[H] " .. emu.read(0x0603,type), 0xFFFFFF, 0xFF000000, 1)
  emu.drawString(106, 12, "[L] " .. emu.read(0x11,type), 0xFFFFFF, 0xFF000000, 1)
  
  nObj=0
  for i=0,32,1
  do
   
    hasObj = 0x90 & emu.read(0x0434+i*6,type);
    
    x=54+i*6
    y=24
    
    emu.drawRectangle(x,y ,4,4, 0x8000FFFF, false, 1)
    
    if(hasObj~=0) then 
      emu.drawRectangle(x,y ,4,4,0x0000FFFF, true, 1)
      nObj = nObj+1

      xo=emu.read(0x0430+i*6,type)
      yo=emu.read(0x0432+i*6,type)
      emu.drawPixel(xo, yo,0x00FFFF, true)
      emu.drawString(xo+1, yo-8,i , 0xFFFFFF, 0xFF000000, 1)
    end
    

    
  end

  emu.drawString(12,22,"#obj "..nObj,0xFFFFFF, 0xFF000000, 1)
    
  emu.drawString(12, 39, "Progress: "..emu.read(0x16,type) , 0xFFFFFF, 0xFF000000, 1)

  x=emu.read(0x0400,type)
  emu.drawLine(x,0,x,239,0x0FFF0FFF)
  y=emu.read(0x0402,type)
  emu.drawLine(0,y,255,y,0x0FFF0FFF)
  emu.drawString(x+1, y-8, "Player" , 0xFFFFFF, 0xFF000000, 1)

  
 end

--Register some code (printInfo function) that will be run at the end of each frame
emu.addEventCallback(printInfo, emu.eventType.endFrame)

--Display a startup message
emu.displayMessage("Script", "Example Lua script loaded.")
