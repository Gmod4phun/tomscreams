// Tom's screams from Tom & Jerry, inspired by an Insurgency workshop item

TomScreamsEnabled = true

hook.Add("EntityEmitSound", "TomScreams", function(t)
	local e = t.Entity
	if !IsValid(e) then return end
	if TomScreamsEnabled then
		if e:IsNPC() and e:Health() <= 0 and !t.SoundName:find("tomscream") then
			timer.Simple(0.01, function()
				if IsValid(e) and !e.PlayedTomScream then
					e.PlayedTomScream = true
					e:EmitSound("gmod4phun/tomscreams/tomscream"..math.random(1,9)..".wav", 75, 100, 1)
				end
			end)
			return false
		end
	end
end)
