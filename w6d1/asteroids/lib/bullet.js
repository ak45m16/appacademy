(function () {
  if (typeof window.Asteroids === "undefined") {
    window.Asteroids = {};
  };

  var Bullet = window.Asteroids.Bullet = function () {

  };

  window.Asteroids.Util.inherits(Bullet, window.Asteroids.MovingObject);

  Bullet.prototype.collideWith = function (asteroid) {

  };



})();
