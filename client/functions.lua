function round(num, decimal)
	local mult = 10^(decimal)
	return math.floor(num * mult + 0.5) / mult
end

function SetTextCoords(data)
	local minDimension, maxDimension = GetModelDimensions(data.objHash)
	local dimensions = maxDimension - minDimension
	local dx, dy = tonumber(dimensions.x), tonumber(dimensions.y)
	if dy <= -1 or dy >= 1 then dx = dy end
	if data.fixText then
		return GetOffsetFromEntityInWorldCoords(data.object, dx/2, 0, 0)
	else
		return GetOffsetFromEntityInWorldCoords(data.object, -dx/2, 0, 0)
	end
end

function loadAnimDict(dict)
	while (not HasAnimDictLoaded(dict)) do
		RequestAnimDict(dict)
		Citizen.Wait(0)
	end
end

function DrawInfos(text)
	SetTextColour(255, 255, 255, 255)   -- Color
	SetTextFont(4)					  -- Font
	SetTextScale(0.4, 0.4)			  -- Scale
	SetTextWrap(0.0, 1.0)			   -- Wrap the text
	SetTextCentre(false)				-- Align to center(?)
	SetTextDropshadow(0, 0, 0, 0, 255)  -- Shadow. Distance, R, G, B, Alpha.
	SetTextEdge(50, 0, 0, 0, 255)	   -- Edge. Width, R, G, B, Alpha.
	SetTextOutline()					-- Necessary to give it an outline.
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(0.015, 0.71)			   -- Position
end