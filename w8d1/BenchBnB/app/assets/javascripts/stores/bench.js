/* global EventEmitter */
/* global BenchConstants */


(function(root) {
  'use strict';
  var _benches = [];

  function resetBenches (newBenches) {
    _benches = newBenches;
  }

  function addBench (bench) {
    _benches.push(bench);
  }

  root.BenchStore = $.extend({}, EventEmitter.prototype, {
    all: function () {
      return _benches.slice(0);
    },

    addChangeListener: function (callback) {
      this.on(BenchConstants.BENCH_CHANGE_EVENT, callback);
    },

    removeChangeListener: function (callback) {
      this.removeListener(BenchConstants.BENCH_CHANGE_EVENT, callback);
    },

    emitChange: function () {
      this.emit(BenchConstants.BENCH_CHANGE_EVENT);
    },


    dispatcherID: root.AppDispatcher.register(function(payload) {
      switch (payload.actionType) {
        case (BenchConstants.BENCHES_RECEIVED):
          resetBenches(payload.benches);
          BenchStore.emitChange();
          break;
        case (BenchConstants.BENCH_CREATED):
          addBench(payload.bench);
          BenchStore.emitChange();
          break;
      }
    })
  });
}(this));
