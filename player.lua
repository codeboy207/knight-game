
anim8 = require("libraries/anim8");
player = {};

player.x = 10;
player.y = 10;

player.speed = 150;
player.spriteSheet = love.graphics.newImage("/assets/sprites/knight.png");
player.grid = anim8.newGrid(32, 32, player.spriteSheet:getWidth(), player.spriteSheet:getHeight());
player.animations = {};

player.animations.idle = anim8.newAnimation(player.grid("1-4", 1), 0.3);
player.animations.currentAnimation = player.animations.idle;


function player.move(direction) 
	
end


function player.update(dt) 
end

return player
