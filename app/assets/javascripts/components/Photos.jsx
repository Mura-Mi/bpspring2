var Masonry = require('react-masonry-component')
var bootstrap = require('react-bootstrap');
var Modal = bootstrap.Modal;
var Carousel = bootstrap.Carousel;
var CarouselItem = bootstrap.CarouselItem;

var PhotoModal = React.createClass({
  getInitialState: function() {
    return {open: false, title: 'No Title', index: 0};
  },
  onHide: function() {
    this.setState({open: false, title: 'No Title'});
  },
  handleSelect: function(selectedIndex, selectedDirection) {
    var value = this.props.photos[selectedIndex].title || "No Title";
    this.setState({title: value})
  },
  render: function() {
    var src = this.state.img_url;
    return <Modal show={this.state.open} onHide={this.onHide}>
      <div className="modal-header"><h4>{this.state.title}</h4></div>
      <div className='modal-body'>
        <Carousel defaultActiveIndex={this.state.index} onSelect={this.handleSelect} interval={0}>
          {
            this.props.photos.map(function(p) {
              return <CarouselItem key={p.id}><img src={p.photo.url} className='img-responsive'/></CarouselItem>
            })
          }
        </Carousel>
      </div>
      <div className='modal-footer'><button className='btn btn-default' onClick={this.onHide}> Close </button></div>
    </Modal>
  }
})

var Photos = React.createClass({
  handleClick: function(photo, i) {
    this.refs.modal.setState({open: true, title: photo.title, img_url: photo.photo.url, index: i});
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
        {this.props.data.map(function(photo, i) {
          var boundClick = this.handleClick.bind(this, photo, i);
          return <div className='grid-item' key={photo.id}>
            <img src={photo.photo.mini.url} onClick={boundClick}
              className='img-responsive img-rounded first-photo center-block'/>
          </div>
        }, this)}
      </Masonry>
      <PhotoModal ref='modal' photos={this.props.data}></PhotoModal>
    </div>
  }
});


module.exports = Photos;
