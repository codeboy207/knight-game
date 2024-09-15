
worldMap = require("tilemap");
physics = require("physics");
platforms = {};
if worldMap.layers["platform_collisions"] then
	physics:addCollisionClass("platform");
	for i, obj in pairs(worldMap.layers["platform_collisions"].objects) do
		platformCollider = physics:newRectangleCollider(obj.x, obj.y,obj.width, obj.height);
		platformCollider:setFixedRotation(true);
		platformCollider:setType("static");
		platformCollider:setCollisionClass("platform");
		table.insert(platforms, platformsCollider);
	end
end

return platforms;

