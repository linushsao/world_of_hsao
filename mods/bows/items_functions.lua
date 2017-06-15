
bows.arrow_dig=function(self,pos,user,lastpos)
	minetest.node_dig(pos, minetest.get_node(pos), user)
	return self
end


bows.arrow_fire_object=function(self,target,hp,user,lastpos)
	bows.arrow_fire(self,lastpos,user,target:getpos())
	bows.on_hit_object(self,target,hp,user,lastpos)
	return self
end

bows.arrow_fire=function(self,pos,user,lastpos)
	local name=user:get_player_name()
	local node=minetest.get_node(lastpos).name
	if minetest.is_protected(lastpos, name) then
		minetest.chat_send_player(name, minetest.pos_to_string(lastpos) .." is protected")
	elseif minetest.registered_nodes[node].buildable_to then
		minetest.set_node(lastpos,{name="fire:basic_flame"})
	end
	return self
end

bows.arrow_build=function(self,pos,user,lastpos)
	local name=user:get_player_name()
	local node=minetest.get_node(lastpos).name
	local index=user:get_wield_index()+1
	local inv=user:get_inventory()
	local stack=inv:get_stack("main", index)
	if minetest.is_protected(lastpos, name) then
		minetest.chat_send_player(name, minetest.pos_to_string(lastpos) .." is protected")
	elseif minetest.registered_nodes[node].buildable_to
	and minetest.registered_nodes[stack:get_name()] then
		minetest.set_node(lastpos,{name=stack:get_name()})
		if bows.creative==false then
			inv:set_stack("main",index,ItemStack(stack:get_name() .. " " .. (stack:get_count()-1)))
		end
	end
	return self
end
