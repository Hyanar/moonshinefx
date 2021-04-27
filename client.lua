local shinestr = -1

DoMoonshine = function(time)
  print("moonshine start")
  shinestr = math.random(1,100)
  print(shinestr)

  if shinestr >= 0 and shinestr < 24 then
    print("lvl 1")
    anim = "move_m@drunk@slightlydrunk"
    shake = 0.5
    screenfx = "DRUG_gas_huffin"
    gettingPissed(anim, shake, screenfx)

  elseif shinestr >= 25 and shinestr < 50 then
    print("lvl 2")
    anim = "move_m@drunk@slightlydrunk"
    shake = 1.0
    screenfx = "v_dark"
    gettingPissed(anim, shake, screenfx)

  elseif shinestr >= 51 and shinestr < 74 then
    print("lvl 3")
    anim = "move_m@drunk@moderatedrunk"
    shake = 1.49
    screenfx = "BikerFilter"
    gettingPissed(anim, shake, screenfx)

  elseif shinestr >= 75 then
    print("lvl 4")
    anim = "move_m@drunk@verydrunk"
    shake = 1.49
    screenfx = "BeastIntro01"
    gettingPissed(anim, shake, screenfx)

  end

  ClearTimecycleModifier()
  ShakeGameplayCam('DRUNK_SHAKE', 0.0)  
  SetPedMotionBlur(GetPlayerPed(-1), false)
  ResetPedMovementClipset(GetPlayerPed(-1), 0)
  RemoveAnimSet()
  shinestr = -1
  print(shinestr)
  print("moonshine end")
end

gettingPissed = function(anim, shake, screenfx)

  ShakeGameplayCam('DRUNK_SHAKE', shake)
  SetTimecycleModifierStrength(0.0) 
  SetTimecycleModifier(screenfx)
  RequestAnimSet(anim)
  SetPedMovementClipset(GetPlayerPed(-1), anim, true)
  SetPedMotionBlur(GetPlayerPed(-1), true)

  local counter = 6000 -- roughly 1 minute of the effect
  local tick = 0
  while tick < counter do
    tick = tick + 1
    SetTimecycleModifierStrength(math.min(0.1 * (tick/(counter/40)),1.49))
    Wait(0)
  end
end

-- Uncomment this to test the shit I guess lol
--RegisterCommand("moonshine", function(...) DoMoonshine(10000); end)
