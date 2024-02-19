function math.round(arg)
  return math.floor(arg + 0.5)
end

function math.isOdd(number)
  return number % 2 ~= 0
end

function OnEvent(event, arg)
  if (event == "PROFILE_ACTIVATED") then
    EnablePrimaryMouseButtonEvents(true)
  end
  if IsKeyLockOn("scrolllock") then
    if (event == "MOUSE_BUTTON_PRESSED" and arg == 1)then
      if IsMouseButtonPressed(3)then
        OutputLogMessage("["..GetDate("%H:%M:%S").."] Triggered No Recoil\n")
        repeat
          local randomNum = math.random(16, 43)
           if math.isOdd(randomNum) then
            randomNum = randomNum - 1
          end
          
          MoveMouseRelative(-randomNum/2, 10)
          Sleep(math.random(15, 43))
          MoveMouseRelative(randomNum, -10)
          Sleep(math.random(15, 43))
          MoveMouseRelative(-randomNum/2, 10)
          Sleep(math.random(15, 43))
        until not IsMouseButtonPressed(1)
      end
    end
  else 
    if (event == "MOUSE_BUTTON_PRESSED" and arg == 1) then
      if IsMouseButtonPressed(3)then
        OutputLogMessage("["..GetDate("%H:%M:%S").."] Triggered No Recoil SMG\n")
        local i = 60
        repeat
          local randomNum = math.random(15, 36)
          if math.isOdd(randomNum) then
            randomNum = randomNum - 1
          end
          
          local n = math.round(i/10)
          
          MoveMouseRelative(randomNum/2, n)
          Sleep(5)
          MoveMouseRelative(-randomNum, n)
          Sleep(5)
          MoveMouseRelative(randomNum/2, n)
          Sleep(5)
          if i > 0 then
            i = i - 1
          end 
        until not IsMouseButtonPressed(1)
      end
    end
  end
end