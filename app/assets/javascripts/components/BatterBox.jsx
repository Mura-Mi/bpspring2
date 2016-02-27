var React = require('react');

var BatterBox = React.createClass({
  propTypes: {
    className: React.PropTypes.string,
    hasHit: React.PropTypes.bool.isRequired,
    hasHomerun: React.PropTypes.bool.isRequired,
    to_type: React.PropTypes.string.isRequired,
    to_id: React.PropTypes.number.isRequired
  },
  getInitialState: function() {
    return {
      hasHit: this.props.hasHit,
      hasHomerun: this.props.hasHomerun
    }
  },
  hit: function(interest_type) {
    $.ajax({
      url: '/interests',
       type: "POST",
       contentType: 'application/json',
       data: JSON.stringify(
         {
           interest: {
             to_type: this.props.to_type,
             to_id: this.props.to_id,
             interest_type: interest_type
           }
         }
       ),
       dataType: "json",
       success: function(data) {
         if (interest_type == "hit") {
           this.setState({hasHit: true})
         } else if (interest_type == "homerun") {
           this.setState({hasHomerun: true})
         }
       }.bind(this),
       error: function(data) {}
    })
  },
  hitStyle: function() {
    if (this.state.hasHit) {
      return {"fontSize": "1.2em", "fontWeight": "bold", "color": 'blue'};
    } else {
      return {};
    }
  },
  homerunStyle: function() {
    if (this.state.hasHomerun) {
      return {"fontSize": "1.2em", "fontWeight": "bold", "color": 'blue'};
    } else {
      return {};
    }
  },
  render: function() {
    return <div className={this.props.className}>
      <ul className="list-inline">
        <li>
          <a href="#" onClick={this.hit.bind(this, "hit")}><small>
            <i className="twa twa-baseball"></i>
            <span style={this.hitStyle()}>Hit!</span>
          </small></a>
        </li>
        <li>
          <a href="#" onClick={this.hit.bind(this, "homerun")}><small>
            <i className="twa twa-dizzy"></i>
            <span style={this.homerunStyle()}>Homerun!</span>
          </small></a>
        </li>
      </ul>
    </div>
  }
});

module.exports = BatterBox;
