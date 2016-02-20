var Masonry = require('react-masonry-component')
var Modal = require('react-bootstrap').Modal;

var PhotoModal = React.createClass({
  getInitialState: function() {
    return {open: false, title: 'No Title'};
  },
  onHide: function() {
    this.setState({open: false, title: 'No Title'});
  },
  render: function() {
    var src = this.state.img_url;
    var title = this.state.title || "No Title"
    return <Modal show={this.state.open} onHide={this.onHide}>
      <div className="modal-header"><h4>{title}</h4></div>
      <div className='modal-body'><img src={src} className='img-responsive'></img></div>
      <div className='modal-footer'><button className='btn btn-default' onClick={this.onHide}> Close </button></div>
    </Modal>
  }
})

var Photos = React.createClass({
  handleClick: function(photo) {
    this.refs.modal.setState({open: true, title: photo.title, img_url: photo.photo.url});
    console.log('click!');
  },
  render: function() {
    var op = {
      percentPosition: true,
      itemSelector:'.grid-item',
      columnWidth:'.grid-sizer'
    };
    return <div>
      <Masonry
        className='grid'
        options={op}
        disableImagesLoaded={false}
      >
        <div className='grid-sizer'></div>
        {this.props.data.map(function(photo) {
          var boundClick = this.handleClick.bind(this, photo);
          return <div className='grid-item' key={photo.id}>
            <img src={photo.photo.mini.url} onClick={boundClick}
              className='img-responsive img-rounded first-photo center-block'/>
          </div>
        }, this)}
      </Masonry>
      <PhotoModal ref='modal'></PhotoModal>
    </div>
  }
});


module.exports = Photos;
