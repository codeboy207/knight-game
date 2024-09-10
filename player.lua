
anim8 = require("libraries/anim8");
physics = require("physics");
player = {};

player.x = 10;
player.y = 10;
player.speed = 150;

player.speed = 150;
player.jumpVelocity = -300;
player.spriteSheet = love.graphics.newImage("/assets/sprites/knight.png");
player.grid = anim8.newGrid(32, 32, player.spriteSheet:getWidth(), player.spriteSheet:getHeight());
player.animations = {};
player.collider = physics:newRectangleCollider(player.x,player.y, 14, 22);

player.animations.idle = anim8.newAnimation(player.grid("1-4", 1), 0.3);
player.currentAnimation = player.animations.idle;


function player.move(direction) 
	local vx, vy = player.collider:getLinearVelocity();
	player.collider:setLinearVelocity(player.speed * direction, vy);
end

function player.jump()
	local vx, vy = player.collider:getLinearVelocity();
	player.collider:setLinearVelocity(vx, player.jumpVelocity);
end


function player.update(dt) 
	player.currentAnimation:update(dt);
	player.x = player.collider:getX();
	player.y = player.collider:getY() - 11;

	if love.keyboard.isDown("d") then
		player.move(1);
	elseif love.keyboard.isDown("a") then
		player.move(-1);
	elseif love.keyboard.isDown("w") then
		player.jump();
	end
end

return player
