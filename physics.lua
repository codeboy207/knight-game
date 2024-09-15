

windfield = require("libraries/windfield");

physics = windfield.newWorld(0, 0, true);
physics:setGravity(0, 800);

return physics;


