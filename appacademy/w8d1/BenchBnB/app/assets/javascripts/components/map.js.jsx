/* global React */
/* global google */
/* global BenchStore */
/* global ApiUtil */
/* global HistoryJSMixin */


(function(root) {
  'use strict';

  root.Map = React.createClass({

    componentDidMount: function () {
      var map = React.findDOMNode(this.refs.map);
      var mapOptions = {
        center: {lat: 37.7758, lng: -122.435},
        zoom: 13
      };
      // debugger;
      this.map = new google.maps.Map(map, mapOptions);
      this.map.addListener('idle', this.getBenchesInBounds);
      this.markers = [];
      BenchStore.addChangeListener(this.markMap);
    },

    extractMapBounds: function () {
      var mapBounds = this.map.getBounds(),
          northEast = mapBounds.getNorthEast(),
          southWest = mapBounds.getSouthWest(),
          bounds = {
            northEast: {lat: northEast.J, lng: northEast.M},
            southWest: {lat: southWest.J, lng: southWest.M}
          };

      return bounds;
    },

    getBenchesInBounds: function () {
      var mapBounds = this.extractMapBounds();
      root.FilterActions.updateFilterBounds(mapBounds);
      ApiUtil.fetchBenches(mapBounds);
    },

    clearMarkers: function () {
      this.markers.forEach(function (marker) {
        marker.setMap(null);
      });
      this.markers = [];
    },

    markMap: function () {
      this.clearMarkers();
      var benches = BenchStore.all();

      this.markers = benches.map(function (bench) {
        return new google.maps.Marker({
          position: {lat: bench.lat, lng: bench.lng}
        });
      }.bind(this));

      this.markers.forEach(function(marker) {
        marker.setMap(this.map);
      }.bind(this));
    },

    handleClick: function () {
      this.props.handleMapClicks(this.extractMapBounds());
    },

    render: function () {
      return (<div className="map"
                   ref="map"
                   onClick={this.handleClick}></div>);
    }
  });
}(this));
