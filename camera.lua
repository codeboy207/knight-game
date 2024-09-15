
player = require("player");
hump = require("libraries/camera");
map = require("tilemap");

camera = {};
camera.position = {};
camera.position.x = 0;
camera.position.y = 0;

camera.zoom = 3;

camera.init = hump(camera.position.x, camera.position.y, camera.zoom);


function camera.update(dt)
	ww = love.graphics.getWidth();
	wh = love.graphics.getHeight();
	camera.position.x = player.x;
	camera.position.y = player.y;
	camera.init:lookAt(camera.position.x, camera.position.y);
end

return camera;
