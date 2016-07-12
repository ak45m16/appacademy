/* global AppDispatcher */
/* global BenchConstants */

(function(root) {
  'use strict';
  root.FilterActions = {
    updateFilterBounds: function (data) {
      AppDispatcher.dispatch({
        actionType: BenchConstants.BENCH_BOUNDS_FILTER_CHANGED,
        benches: data
      });
    },
    updateFilterMax: function (data) {
      AppDispatcher.dispatch({
        actionType: BenchConstants.BENCH_MAX_FILTER_CHANGED,
        benches: data
      });
    },
    updateFilterMin: function (data) {
      AppDispatcher.dispatch({
        actionType: BenchConstants.BENCH_MIN_FILTER_CHANGED,
        benches: data
      });
    },
  };
}(this));
