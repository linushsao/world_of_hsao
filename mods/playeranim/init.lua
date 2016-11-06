local model = minetest.get_modpath("3d_armor") and "armor" or "normal"

local ANIM_STAND = 1
local ANIM_MINE = 2
local ANIM_WALK = 3
local ANIM_WALK_MINE = 4
local ANIM_SNEAK = 5
local ANIM_LAY = 6
local ANIM_SIT = 7
local RESET_BODY = 8

local BODY = "Body"
local HEAD = "Head"
local LARM = "Arm_Left"
local RARM = "Arm_Right"
local LLEG = "Leg_Left"
local RLEG = "Leg_Right"
local CAPE = "Cape"

local vn = vector.new

local bone_pos = {
	["normal"] = {
		Head = vn(0, 6, 0),
		Body = vn(0, -3, 0),
		Arm_Right = vn(3.9, 6.5, 0),
		Arm_Left = vn(-3.9, 6.5, 0),
		Leg_Right = vn(1, 0, 0),
		Leg_Left = vn(-1, 0, 0),
		Cape = vn(0, 6.5, 1.5)
	},
	["armor"] = {
		Head = vn(0, 6.75, 0),
		Body = vn(0, -3.5, 0),
		Arm_Left = vn(2, 6.5, 0),
		Arm_Right = vn(-2, 6.5, 0),
		Leg_Left = vn(1, 0, 0),
		Leg_Right = vn(-1, 0, 0),
		Cape = vn(0, 6.75, 1.5)
	}
}

local anim_def = {
	["normal"] = {
		Head = vn(0, 0, 0),
		Body = vn(0, 0, 0),
		Arm_Right = vn(180, 0, 0),
		Arm_Left = vn(180, 0, 0),
		Leg_Right = vn(0, 0, 0),
		Leg_Left = vn(0, 0, 0),
		Cape = vn(0, 0, 180)
	},
	["armor"] = {
		Head = vn(0, 0, 0),
		Body = vn(0, 0, 0),
		Arm_Right = vn(180, 0, -9),
		Arm_Left = vn(180, 0, 9),
		Leg_Right = vn(0, 0, 0),
		Leg_Left = vn(0, 0, 0),
		Cape = vn(180, 0, 180)
	}
}	

local function rotbone(player, bone, x, y, z)
	x, y, z = x or 0, y or 0, z or 0
	local rotate = anim_def[model][bone] or vn(0, 0, 0)
	player:set_bone_position(bone, bone_pos[model][bone], vector.add(vn(x, y, z), rotate))
end

local r = {}
local m = {}
local look = {}

local animations = {
	[ANIM_STAND] = function(player)
		rotbone(player, BODY)
		rotbone(player, RARM)
		rotbone(player, LARM)
		rotbone(player, RLEG)
		rotbone(player, LLEG)
		rotbone(player, CAPE)
	end,
	[ANIM_WALK] = function(player)
		local r = r[player:get_player_name()]
		rotbone(player, RARM, r*40)
		rotbone(player, LARM, r*-40)
		rotbone(player, RLEG, r*-40)
		rotbone(player, LLEG, r*40)
		rotbone(player, CAPE, r*30+35)
	end,
	[ANIM_MINE] = function(player)
		local r = r[player:get_player_name()]
		local look = look[player:get_player_name()]
		rotbone(player, RARM, r*20+80+look)
		rotbone(player, LARM)
		rotbone(player, RLEG)
		rotbone(player, LLEG)
		rotbone(player, CAPE, r*5+10)
	end,
	[ANIM_WALK_MINE] = function(player)
		local r = r[player:get_player_name()]
		local look = look[player:get_player_name()]
		rotbone(player, RARM, r*20+80+look)
		rotbone(player, LARM, r*-40)
		rotbone(player, RLEG, r*-40)
		rotbone(player, LLEG, r*40)
		rotbone(player, CAPE, r*30+35)
	end,
	[ANIM_SNEAK] = function(player)
		rotbone(player, BODY, 10)
	end,
	[ANIM_LAY] = function(player)
		player:set_bone_position("Body", vn(0, -9, 0), vn(270, 0, 0))
		rotbone(player, HEAD)
	end,
	[ANIM_SIT] = function(player)
		local bodypos = bone_pos[model]["Body"]
		bodypos.y = bodypos.y-6
		player:set_bone_position("Body", bodypos, vn(0, 0, 0))
		rotbone(player, LARM)
		rotbone(player, RARM)
		rotbone(player, LLEG, 90)
		rotbone(player, RLEG, 90)
	end,
	[RESET_BODY] = function(player)
		rotbone(player, BODY)
	end
}

local player_anim = {}
local player_sneak = {}
local FULL_STEP = {}
local step = 0

local function animation(player, anim)
	local name = player:get_player_name()
	if anim == ANIM_WALK
	or anim == ANIM_MINE
	or anim == ANIM_WALK_MINE
	or player_anim[name] ~= anim then
		animations[anim](player)
		player_anim[name] = anim
		return
	end
	player_anim[name] = nil
end

local function head_movement(player, controls)
	local pitch = player:get_look_pitch() * 180 / math.pi
	local look
	if controls.left and not controls.right then
		look = vn(pitch, -10, 0)
	elseif controls.right and not controls.left then
		look = vn(pitch, 10, 0)
	else
		look = vn(pitch, 0, 0)
	end
	rotbone(player, HEAD, look.x, look.y, look.z)
end

local function sneak_anim(player, controls)
	animation(player, controls.sneak and ANIM_SNEAK or RESET_BODY)
end

local function anim_speed(name, controls)
	if controls.sneak then
		FULL_STEP[name] = 0.7
	else
		FULL_STEP[name] = 0.5
	end
end

local function set_model(player)
	if model == "normal" then
		player:set_properties({
			mesh = "character.b3d",
			textures = {"character.png"}
		})
	end
	animation(player, ANIM_STAND)
	FULL_STEP[player:get_player_name()] = 0.5
end

minetest.register_on_joinplayer(function(player)
	set_model(player)
end)

minetest.register_on_leaveplayer(function(player)
	local name = player:get_player_name()
	player_anim[name] = nil
	FULL_STEP[name] = nil
	r[name] = nil
	m[name] = nil
	look[name] = nil
end)

minetest.register_chatcommand("fixmodel", {
	description = "Fix Player Model",
	func = function(name)
		local player = minetest.get_player_by_name(name)
		if not player then
			return false, "Player not found"
		end
		set_model(player)
		return true, "Done."
	end
})

minetest.register_globalstep(function(dtime)
	step = dtime + step
	if step >= 60 then
		step = 0
	end
	for _, player in ipairs(minetest.get_connected_players()) do
		local name = player:get_player_name()
		local anim = default.player_get_animation(player).animation

		if anim == "lay" then
			animation(player, RESET_BODY)
			animation(player, ANIM_STAND)
			animation(player, ANIM_LAY)
			return
		end

		local controls = player:get_player_control()

		m[name] = step / FULL_STEP[name]
		r[name] = math.sin(m[name] * 2 * math.rad(120))
		look[name] = math.deg(player:get_look_pitch())

		if anim == "walk" then
			anim_speed(name, controls)
			animation(player, ANIM_WALK)
			sneak_anim(player, controls)
		elseif anim == "mine" then
			anim_speed(name, controls)
			animation(player, ANIM_MINE)
			sneak_anim(player, controls)
		elseif anim == "walk_mine" then
			anim_speed(name, controls)
			animation(player, ANIM_WALK_MINE)
			sneak_anim(player, controls)
		elseif anim == "sit" then
			animation(player, ANIM_SIT)
		else
			animation(player, ANIM_STAND)
			sneak_anim(player, controls)
		end

		head_movement(player, controls)
	end
end)
