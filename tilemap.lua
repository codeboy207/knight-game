
sti = require("libraries/sti");
physics = require("physics");

worldMap = sti("maps/world.lua");

ground = {};

if worldMap.layers["midground_collisions"] then
	physics:addCollisionClass("ground");
	for i, obj in pairs(worldMap.layers["midground_collisions"].objects) do
		collider = physics:newRectangleCollider(obj.x, obj.y, obj.width, obj.height);
		collider:setFixedRotation(true);
		collider:setType("static");
		collider:setCollisionClass("ground");
		table.insert(ground, collider);
	end
end

bridge = {};
if worldMap.layers["bridge_collisions"] then
	local radius = 3.5;
	for i, obj in pairs(worldMap.layers["bridge_collisions"].objects) do
		collider = physics:newCircleCollider(obj.x + radius, obj.y + radius, radius);
		collider:setFixedRotation(true);
		collider:setType("static");
		table.insert(bridge, collider);
	end
end

return worldMap;
