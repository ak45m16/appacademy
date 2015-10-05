//remove hard-coded stuff
(function () {
  if (typeof window.Asteroids === "undefined") {
    window.Asteroids = {};
  };

  var Ship = window.Asteroids.Ship = function (game) {
    this.vel = [0, 0];
    this.radius = Ship.RADIUS;
    this.color = Ship.COLOR;
    this.game = game;
    this.pos = [Math.floor(Math.random()*500), Math.floor(Math.random()*500)];
    window.Asteroids.MovingObject.call(this, this.pos, this.vel, 25, "green", this.game);
  };

  Ship.COLOR = "green"
  Ship.RADIUS = 25;

  window.Asteroids.Util.inherits(Ship, window.Asteroids.MovingObject);

  Ship.prototype.relocate = function () {
    this.pos = [Math.floor(Math.random()*500), Math.floor(Math.random()*500)];
    this.vel = [0, 0];
  };

  Ship.prototype.power = function(impulse) {
    this.vel[0] += impulse[0];
    this.vel[1] += impulse[1];
  };

})();
