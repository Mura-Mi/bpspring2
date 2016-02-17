var Report = React.createClass({
  render: function() {
    return <div className="grid-item grid-item--2x">
      <div className="photo-and-title">
        <img src={this.props.article.event_photos[0].photo.mini.url} />
        <div className="bgh-accent-bg-trans leaf-title">
          <span className='title'><h3>
            <a href={this.props.article.url}>{this.props.article.summary}</a>
          </h3></span>
        </div>
      </div>
    </div>
  }
});

var reports = React.createClass({
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
        this.setState({data: result.event_reports});
      }.bind(this),
      error: function(xhr, status, err) {
        console.error(this.props.url, status, err.toString());
      }.bind(this)
    });
  },
  render: function() {
    return <div className='grid bgh-event-reports-grid'>
      <div className='grid-sizer'></div>
      {this.state.data.map(function(article) {
        return <Report article={article} key={article.id} />;
      })}
    </div>
  }
});
