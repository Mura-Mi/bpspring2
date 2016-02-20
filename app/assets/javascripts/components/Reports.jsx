var React = require('react');
var Masonry = require('react-masonry-component');

var Report = React.createClass({
  render: function() {
    var divClass = "bgh-event-report-preview grid-item";

    if (!this.props.article.comment || this.props.article.comment.length < 10) {
    } else if (this.props.article.comment.length > 40) {
      divClass += " grid-item--3x"
    } else {
      divClass += " grid-item--2x"
    }

    var src = this.props.article.digest_photo


    return <div className={divClass}>
      <div className="photo-and-title">
        <img src={src} className="event_photo img-rounded" />
        <div className="bgh-accent-bg-trans leaf-title">
          <span className='title'><h3>
            <a href={this.props.article.url}>{this.props.article.summary}</a>
          </h3></span>
        </div>
      </div>


      <div className='leaf bgh-accent-bg-trans'>
        <div className='event-info'>{this.props.article.event_summary}</div>
        <div className='comment'>{this.props.article.comment}</div>
      </div>
    </div>
  }
});

var Reports = React.createClass({
  getInitialState: function() {
    return {
      data: []
    }
  },
  componentDidMount: function() {
    $.ajax({
      url: this.props.url,
      dataType: 'json',
      success: function(result) {
        this.setState({data: result})
      }.bind(this),
      error: function(xhr, status, err) {
        console.error(this.props.url, status, err.toString());
      }.bind(this)
    });
  },
  render: function() {
    var op = {
      percentPosition: true,
      itemSelector:'.grid-item',
      columnWidth:'.grid-sizer'
    };
    return (<Masonry
      className='grid bgh-event-reports-grid' options={op}
      disableImagesLoaded={false}
    >
      <div className='grid-sizer'></div>
      {this.state.data.map(function(article) {
        return <Report article={article} key={article.id} />;
      })}
    </Masonry>)
  }
});

module.exports = Reports;
