

physics = require("physics");
map = require("tilemap");
physics:addCollisionClass("killzone");

killZone = physics:newRectangleCollider(0, map.height * 16, map.width * 16, 10);
killZone:setType("static");
killZone:setFixedRotation(true);
killZone:setCollisionClass("killzone");
return killZone;
