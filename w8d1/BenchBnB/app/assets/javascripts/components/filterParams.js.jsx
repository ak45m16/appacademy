/* global React */
/* global google */
/* global BenchStore */
/* global ApiUtil */
/* global HistoryJSMixin */


(function(root) {
  'use strict';

  root.FilterParams = React.createClass({
    getInitialState: function () {
      return({bounds:"", min:"", max:""});
    },
    handleMinSeats: function (e) {
      e.preventDefault();
      root.FilterActions.updateFilterMin(e.target.value);
      //call filter action
    },
    handleMaxSeats: function (e) {
      e.preventDefault();
      root.FilterActions.updateFilterMin(e.target.value);
      //call filter action
    },
    render: function () {
      return(
        <form>
          minSeats
          <input type='text' onChange={this.handleMinSeats} value={this.state.min}/>
          maxSeats
          <input type='text' onChange={this.handleMaxSeats} value={this.state.max}/>
        </form>
      );
    }
  });
}(this));
