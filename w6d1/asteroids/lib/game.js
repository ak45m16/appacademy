(function () {
  if (typeof window.Asteroids === "undefined") {
    window.Asteroids = {};
  }

  var Game = window.Asteroids.Game = function (x, y, numAsteroids) {
    this.x = x;
    this.y = y;
    this.numAsteroids = numAsteroids;
    this.asteroids = [];
    this.addAsteroids(numAsteroids);
  };

  Game.WIDTH = 500;
  Game.HEIGHT = 500;

  Game.prototype.addAsteroids = function () {
    for (var i = 0; i < this.numAsteroids; i++) {
      var pos = [ Math.floor(Math.random()*Game.WIDTH), Math.floor(Math.random()*Game.HEIGHT) ];
      this.asteroids.push(new window.Asteroids.Asteroid(pos, this));
    }
  };

  Game.prototype.draw = function (ctx) {
    ctx.clearRect(0, 0, Game.WIDTH, Game.WIDTH);

    this.asteroids.forEach(function(asteroid) {
       asteroid.draw(ctx);
    });
  };

  Game.prototype.moveObjects = function () {
    this.asteroids.forEach(function(asteroid) {
      asteroid.move();
    });
  };

  Game.prototype.wrap = function (pos) {
    if (pos[0] > Game.WIDTH) {
      return [0, pos[1]];
    } else if (pos[1] > Game.HEIGHT){
      return [pos[0], 0];
    } else {
      return pos;
    }
  };

  Game.prototype.checkCollisions = function () {
    for (var i = 0; i < this.asteroids.length; i++) {
      for (var j = i + 1; j < this.asteroids.length; j++) {
        if (this.asteroids[i].isCollidedWith(this.asteroids[j])) {
          alert("COLLISION");
        }
      }
    }
  };

  Game.prototype.step = function () {
    this.moveObjects();
    this.checkCollisions();
  };
 })();
