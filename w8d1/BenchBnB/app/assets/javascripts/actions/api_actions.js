/* global AppDispatcher */
/* global BenchConstants */

(function(root) {
  'use strict';
  root.ApiActions = {
    receiveAll: function (benches) {
      AppDispatcher.dispatch({
        actionType: BenchConstants.BENCHES_RECEIVED,
        benches: benches
      });
    },

    addBench: function (bench) {
      AppDispatcher.dispatch({
        actionType: BenchConstants.BENCH_CREATED,
        bench: bench
      });
    }
  };
}(this));
