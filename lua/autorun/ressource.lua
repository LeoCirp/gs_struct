local function count_bits(n)
  local count = 1
  while n > 0 do
    n = bit.rshift(n, 1)
    count = count + 1
  end
  return count
end
local function Sound (dir)
  sound.PlayFile("sound/"..dir, "noplay", function(station)
    if (IsValid(station)) then station:Play() end
  end)
end
hook.Add("GS_NombreDeBitNecessaire", "bitneed", count_bits)
hook.Add("GS_CLIENT_SOUND","use exten sound", Sound)