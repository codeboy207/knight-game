
anim8 = require("libraries/anim8");
physics = require("physics");
player = {};

player.x = 100;
player.y = 10;
player.speed = 150;

player.speed = 350;
player.jumpVelocity = -300;
player.spriteSheet = love.graphics.newImage("/assets/sprites/knight.png");
player.grid = anim8.newGrid(32, 32, player.spriteSheet:getWidth(), player.spriteSheet:getHeight());
player.animations = {};
player.collider = physics:newCircleCollider(player.x,player.y,5);
physics:addCollisionClass("player");
player.collider:setFixedRotation(true);
player.collider:setCollisionClass("player");
player.animations.idle = anim8.newAnimation(player.grid("1-4", 1), 0.3);
player.currentAnimation = player.animations.idle;


player.collider:setPreSolve(function(player_collider, platform_collider, contact) 
	playerClass = player_collider.collision_class;
	platformClass = platform_collider.collision_class;

	if playerClass == "player" and platformClass == "platform" then
		local vx, vy = player.collider:getLinearVelocity();
		if vy < 0 then
			contact:setEnabled(false);
		end
	end
end)


function player.move(direction) 
	local vx, vy = player.collider:getLinearVelocity();
	player.collider:setLinearVelocity(player.speed * direction, vy);
end

function player.jump()
	local vx, vy = player.collider:getLinearVelocity();
	if vy == 0 then
		player.collider:setLinearVelocity(vx, player.jumpVelocity);
	end
end

function player.stop()
	local vx, vy = player.collider:getLinearVelocity();
	player.collider:setLinearVelocity(0, vy);
end


function player.update(dt) 
	player.currentAnimation:update(dt);
	player.x = player.collider:getX();
	player.y = player.collider:getY() - 7;
	isMoving = false;
	if love.keyboard.isDown("right") then
		player.move(1);
		isMoving = true;
	elseif love.keyboard.isDown("left") then
		player.move(-1);
		isMoving = true;
	elseif love.keyboard.isDown("space") then
		player.jump();
	end

	if not isMoving then
		player.stop();
	end

	player.isDied();
end

function player.isDied()
	if player.collider:enter("killzone") then
		print("you die");
	end
end
return player
