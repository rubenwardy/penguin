
local S = mobs.intllib

mobs:register_mob("penguin:penguin", {
	type = "animal",
	passive = true,
	reach = 1,
	hp_min = 1,
	hp_max = 4,
	armor = 200,
	collisionbox = {-0.268, -0.5, -0.268,  0.268, 0.167, 0.268},
	visual = "mesh",
	mesh = "penguin_penguin.obj",
	drawtype = "front",
	textures = {
		{"penguin_penguin.png"},
	},
	sounds = {},
	makes_footstep_sound = false,
	walk_velocity = 1,
	run_velocity = 2,
	runaway = true,
	jump = true,
	drops = {
		{name = "mobs:meat_raw", chance = 1, min = 1, max = 1},
	},
	water_damage = 1,
	lava_damage = 4,
	light_damage = 0,
	fear_height = 2,
	-- animation = {
	-- 	speed_normal = 15,
	-- 	stand_start = 1,
	-- 	stand_end = 15,
	-- 	walk_start = 16,
	-- 	walk_end = 24,
	-- 	punch_start = 16,
	-- 	punch_end = 24,
	-- },
	follow = {},
	view_range = 8,
	on_rightclick = function(self, clicker)

		-- feed or tame
		if mobs:feed_tame(self, clicker, 4, true, true) then
			return
		end

		-- Monty Python tribute
		local item = clicker:get_wielded_item()

		if item:get_name() == "mobs:lava_orb" then

			if not minetest.setting_getbool("creative_mode") then
				item:take_item()
				clicker:set_wielded_item(item)
			end

			-- self.object:set_properties({
			-- 	textures = {"mobs_bunny_evil.png"},
			-- })

			self.type = "monster"
			self.object:set_hp(20)

			return
		end

		mobs:capture_mob(self, clicker, 30, 50, 80, false, nil)
	end,

	attack_type = "dogfight",
	damage = 5,
})

mobs:register_spawn("penguin:penguin",
	{"default:dirt_with_snow", "default:ice", "default:snow"}, 20, 10, 15000, 2, 31000, true)

mobs:register_egg("penguin:penguin", S("Bunny"), "mobs_bunny_inv.png", 0)
