/* global React */
/* global BenchStore */
/* global BenchForm */

(function(root) {
  'use strict';
  root.Index = React.createClass({
    getInitialState: function () {
      return {benches: BenchStore.all()};
    },

    _onChange: function () {
      this.setState({benches: BenchStore.all()});
    },

    componentDidMount: function () {
      BenchStore.addChangeListener(this._onChange);
      //no ApiUtil fetchBenches?? => it moved to map in phase 5
    },

    componentwillUnmount: function () {
      BenchStore.removeChangeListener(this._onChange);
    },

    render: function () {
      var benches = this.state.benches.map(function (bench) {
        return (<li key={bench.id}>{bench.description}</li>);
      });

      return (
        <div>
          <ul>{benches}</ul> 
        </div>
      );
    }


  });
}(this));
