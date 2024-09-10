
function love.load()
	love.graphics.setDefaultFilter("nearest", "nearest");
	player = require("player");
	world = require("physics");
	killZone = world:newRectangleCollider(0, love.graphics.getHeight() - 10, love.graphics.getWidth(), 10);
	killZone:setType("static");
end

function love.update(dt)
	player.update(dt);
	world:update(dt);
end

function love.draw()
	player.animations.idle:draw(player.spriteSheet, player.x, player.y, nil, 2, nil, 16, 16);
	world:draw();
end
