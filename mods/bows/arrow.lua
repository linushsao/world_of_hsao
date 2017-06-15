bows.on_hit_object=function(self,target,hp,user,lastpos)
	target:set_hp(target:get_hp()-hp)
	target:punch(self.user, {full_punch_interval=1.0,damage_groups={fleshy=4}}, "bows:bow_wood", nil)
	bows.on_hit_node(self)
	return self
end

bows.on_hit_node=function(self,pos,user,lastpos)
	self.object:set_hp(0)
	self.object:punch(self.object, {full_punch_interval=1.0,damage_groups={fleshy=4}}, "bows:bow_wood", nil)
	return self
end

minetest.register_entity("bows:arrow",{
	hp_max = 1,
	visual="wielditem",
	visual_size={x=.20,y=.20},
	collisionbox = {0,0,0,0,0,0},
	physical=false,
	textures={"air"},
	smartshop=true,
	on_activate = function(self, staticdata)
		if bows.tmp and bows.tmp.arrow ~= nil then
			self.arrow=bows.tmp.arrow
			self.user=bows.tmp.user
			self.name=bows.tmp.name
			self.dmg=bows.registed_arrows[self.name].damage
			bows.tmp=nil
			self.object:set_properties({textures={self.arrow}})
		else
			self.object:remove()
		end
	end,
	arrow=true,
	timer=0,
	x=0,
	y=0,
	z=0,
	on_step=	function(self, dtime)
		self.timer=self.timer+dtime
		local pos=self.object:getpos()
		if (self.user==nil or self.timer>4 ) or minetest.get_node(pos) and minetest.registered_nodes[minetest.get_node(pos).name].walkable then
			bows.registed_arrows[self.name].on_hit_node(self,pos,self.user,{x=self.x,y=self.y,z=self.z})
			minetest.sound_play(bows.registed_arrows[self.name].on_hit_sound, {pos=pos, gain = 1.0, max_hear_distance = 7})
			bows.on_hit_node(self)
			return self
		end
		self.x=pos.x
		self.y=pos.y
		self.z=pos.z
		for i, ob in pairs(minetest.get_objects_inside_radius(pos, 1)) do
			if ob and ((bows.pvp and ob:is_player() and ob:get_player_name()~=self.user:get_player_name()) or (ob:get_luaentity() and ob:get_luaentity().arrow==nil and ob:get_luaentity().name~="__builtin:item" )) then
				bows.registed_arrows[self.name].on_hit_object(self,ob,self.dmg,self.user,{x=self.x,y=self.y,z=self.z})
				bows.on_hit_node(self)
				minetest.sound_play(bows.registed_arrows[self.name].on_hit_sound, {pos=pos, gain = 1.0, max_hear_distance = 7})
				return
			end
		end
	end,
})
