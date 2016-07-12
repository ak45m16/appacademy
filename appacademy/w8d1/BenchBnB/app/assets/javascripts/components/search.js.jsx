/* global React */
/* global Index */
/* global Map */
/* global FilterParams */
(function(root) {
  'use strict';
  root.Search = React.createClass({
    getInitialState: function () {
      return({bounds: "", max:"", min:""});
    },
    handleMapClicks: function (coords) {
      this.props.history.pushState(null, "benches/new", coords);
    },
    updateState: function () {
      this.setState(FilterParams.get());
      root.ApiUtil.fetchBenches(this.state);
    },
    componentDidMount: function () {
      FilterParams.addChangeListener(this.updateState);
    },
    render: function () {
      return (
        <div>
          <Index />
          <Map handleMapClicks={this.handleMapClicks}/>
          <FilterParams/>
        </div>
      );
    }
  });
}(this));
