/* global EventEmitter */
/* global BenchConstants */
/* global filterParamsStore */

(function(root) {
  'use strict';

  var data = {bounds:"", min:"", max:""};

  root.filterParamsStore = $.extend({}, EventEmitter.prototype, {
    get: function () {
      return data;
    },
    updateBounds: function (data) {
      data.bounds = data;

    },
    updateMin: function (data) {
      data.min = data;
    },
    updateMax: function (data) {
      data.max = data;
    },
    addChangeListener: function (callback) {
      this.on(BenchConstants.BENCH_CHANGE_EVENT, callback);
    },
    removeChangeListener: function (callback) {
      this.removeListener(BenchConstants.BENCH_CHANGE_EVENT, callback);
    },
    dispatcherID: root.AppDispatcher.register(function(payload) {
      switch (payload.actionType) {
        case (BenchConstants.BENCH_BOUNDS_FILTER_CHANGED):
          this.updateBounds(payload.benches);
          filterParamsStore.emit(BenchConstants.BENCH_CHANGE_EVENT);
          break;
        case (BenchConstants.BENCH_MIN_FILTER_CHANGED):
          this.updateMin(payload.benches);
          filterParamsStore.emit(BenchConstants.BENCH_CHANGE_EVENT);
          break;
        case (BenchConstants.BENCH_MAX_FILTER_CHANGED):
          this.updateMax(payload.benches);
          filterParamsStore.emit(BenchConstants.BENCH_CHANGE_EVENT);
          break;
      }
    })
  });



}(this));
