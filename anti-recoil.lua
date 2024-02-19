function math.round(arg)
  return math.floor(arg + 0.5)
end

function math.isOdd(number)
  return number % 2 ~= 0
end

local linear_T = {
  [0] = { 1, 0 },
  [1] = { 0, 1 },
  [2] = { -1, 0 },
  [3] = { 0, -1 },
}

local orders = { 1, 2, 2, 2, 1}

function ARAntiRecoil()
  local axis = { 0 , 0 }
  local n = 0
  for i = 1, 5 do
    axis = linear_T[n] 
    for k = 0, orders[i] + 1 do
      OutputLogMessage("Working \n")
      MoveMouseRelative(axis[1], axis[2])
      Sleep(1)
    end
    n = n + 1
    if n >= 3 then
      n = 0
    end
  end
end

function Test()
  local n = 8
  for i = 0, orders[1] do
    MoveMouseRelative(n, 0)
  end
  for i = 0, orders[2] do
    MoveMouseRelative(0, n)
  end
  for i = 0, orders[3] do
    MoveMouseRelative(-n, 0)
  end
  for i = 0, orders[4] do
    MoveMouseRelative(0, -n)
  end
  for i = 0, orders[5] do
    MoveMouseRelative(n, 0)
  end
end


function OnEvent(event, arg)
  if (event == "PROFILE_ACTIVATED") then
    EnablePrimaryMouseButtonEvents(true)
  end
  if IsKeyLockOn("scrolllock") then
    if (event == "MOUSE_BUTTON_PRESSED" and arg == 1) then
      if IsMouseButtonPressed(3) then
        OutputLogMessage("["..GetDate("%H:%M:%S").."] Triggered Anti Recoil\n")
        goto continue
      end
      ::continue::
      local randomNum = math.random(4, 12)
      if math.isOdd(randomNum) then
        randomNum = randomNum - 1
      end

      local k = 0
      repeat
        if k < 14 then
          MoveMouseRelative(0, 10)
          k = k + 1
        end

        MoveMouseRelative(-randomNum/2, 10)
        Sleep(10)
        MoveMouseRelative(randomNum, -10)
        Sleep(10)
        MoveMouseRelative(-randomNum/2, 0)
        Sleep(10)
      until not IsMouseButtonPressed(1)
    end
  else 
    if (event == "MOUSE_BUTTON_PRESSED" and arg == 1) then
      if IsMouseButtonPressed(3) then
        OutputLogMessage("["..GetDate("%H:%M:%S").."] Triggered Anti Recoil SMG\n")
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