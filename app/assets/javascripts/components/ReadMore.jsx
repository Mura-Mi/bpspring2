var React = require('react');

var ReadMore = React.createClass({
  propTypes: {
    text: React.PropTypes.string
  },
  getInitialState: function() {
    return {
      isOpen: false
    }
  },
  isTooShort: function() {
    return this.props.text == null || this.props.text.length < 100;
  },
  mytext: function() {
    if(this.props.text == null || this.props.text === "") {
      return "";
    }

    var text;
    if (this.state.isOpen || this.isTooShort()) {
      return this.replaceNewLine(this.props.text);
    } else {
      return this.replaceNewLine(this.props.text.substring(0, 80).concat("..."));
    }
  },
  replaceNewLine: function(text) {
      var lines = text.split("\r\n");
      return lines.map(function(line, i) {
          return <div key={i}>{line}</div>
        });
  },
  toggleCollapse: function() {
    this.setState(
      {
        isOpen: !this.state.isOpen
      }
    );
  },
  buttonCaption: function() {
    return this.state.isOpen ? "Close Comment" : "Read More"
  },
  render: function() {
    var disp = this.isTooShort() ? 'none' : 'inherit';
    var style = {display: disp};
    return <div>
      {this.mytext()}
      <a href='#' onClick={this.toggleCollapse} style={style}>
        <small>{this.buttonCaption()}</small>
      </a>
    </div>
  }
});

module.exports = ReadMore;
