
function love.load()
	love.graphics.setDefaultFilter("nearest", "nearest");
	player = require("player");

end

function love.update(dt)
	player.animations.currentAnimation:update(dt);
end

function love.draw()
	player.animations.idle:draw(player.spriteSheet, player.x, player.y, nil, 2);
end
