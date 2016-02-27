var React = require('react');

var BatterBox = React.createClass({
  propTypes: {
    className: React.PropTypes.string
  },
  render: function() {
    return <div className={this.props.className}>
      <ul className="list-inline">
        <li>
          <a href="#"><small>
            <i className="twa twa-baseball"></i>
            Hit!
          </small></a>
        </li>
        <li>
          <a href="#"><small>
            <i className="twa twa-dizzy"></i>
            Homerun!
          </small></a>
        </li>
      </ul>
    </div>
  }
});

module.exports = BatterBox;
