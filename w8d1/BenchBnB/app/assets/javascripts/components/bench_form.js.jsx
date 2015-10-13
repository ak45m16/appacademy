/* global React */
/* global ApiUtil */

(function(root) {
  'use strict';
  root.BenchForm = React.createClass({
    mixins: [ReactRouter.History],
    getInitialState: function () {
      return({description:"", lat:"", lng:"", seating:""});
    },
    componentDidMount: function () {
      var pos = this.props.location.query;
      this.setState({lat:pos["northEast"]["lat"]});
      this.setState({lng:pos["northEast"]["lng"]});
    },
    handleLatChange: function (e) {
      this.setState({lat: parseInt(e.target.value)});
    },
    handleLngChange: function (e) {
      this.setState({lng: parseInt(e.target.value)});
    },
    handleSeatChange: function (e) {
      this.setState({seating: parseInt(e.target.value)});
    },
    handleDesChange: function (e) {
      this.setState({description: e.target.value});
    },
    createBench: function (e) {
      e.preventDefault();
      var data = {bench: this.state};
      ApiUtil.createBench(data);
    },
    render: function () {
      return(
        <form onSubmit={this.createBench}>
          Latitude
          <input type='text' onChange={this.handleLatChange} value={this.state.lat}/>
          Longitude
          <input type='text' onChange={this.handleLngChange} value={this.state.lng}/>
          Description
          <input type='text' onChange={this.handleDesChange} value={this.state.description}/>
          Seats
          <input type='text' onChange={this.handleSeatChange} value={this.state.seating}/>
          <input type='submit' value='Create'/>
        </form>
      );
    }
  });
}(this));
