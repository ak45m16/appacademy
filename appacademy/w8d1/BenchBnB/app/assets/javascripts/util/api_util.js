/* global ApiActions */
(function(root) {
  'use strict';
  root.ApiUtil = {
    fetchBenches: function (bounds) {

      var onSuccess = function (data) {
        ApiActions.receiveAll(data);
      };

      var ajaxOptions = {
        url: '/api/benches',
        type: 'GET',
        data: {bounds: bounds.bounds, min: bounds.min, max: bounds.max},
        dataType: 'json',
        success: onSuccess
      };

      $.ajax(ajaxOptions);
    },

    createBench: function (benchParams) {
      var onSuccess = function (data) {
        ApiActions.addBench(data);
      };

      var ajaxOptions = {
        url: '/api/benches',
        type: 'POST',
        data: benchParams,
        dataType: 'json',
        success: onSuccess
      };

      $.ajax(ajaxOptions);
    }

  };
}(this));
