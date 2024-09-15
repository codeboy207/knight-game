
function love.load()
	love.graphics.setDefaultFilter("nearest", "nearest");
	love.window.setMode(50 * 16, 20 * 16);
	player = require("player");
	physics = require("physics");
	worldMap = require("tilemap");
	camera = require("camera");
	killzone = require("killzone");
	platforms = require("platforms");
end

function love.update(dt)
	player.update(dt);
	physics:update(dt);
	worldMap:update(dt);
	camera.update(dt);
end

function love.draw()
	camera.init:attach()
		worldMap:drawLayer(worldMap.layers["background"]);
		worldMap:drawLayer(worldMap.layers["trees"]);
		worldMap:drawLayer(worldMap.layers["midground"]);
		player.animations.idle:draw(player.spriteSheet, player.x, player.y, nil,nil, nil, 16, 16);
	camera.init:detach()
end
