var Masonry = require('react-masonry-component')
var bootstrap = require('react-bootstrap');
var Modal = bootstrap.Modal;
var Carousel = bootstrap.Carousel;
var CarouselItem = bootstrap.CarouselItem;
var EditInPlace = require('react-editinplace')

var PhotoModal = React.createClass({
  getInitialState: function() {
    return {open: false, title: 'No Title', index: 0, id:-1 };
  },
  onHide: function() {
    this.setState({open: false });
  },
  handleSelect: function(selectedIndex, selectedDirection) {
    var photo = this.props.photos[selectedIndex];
    var value = photo.title || "No Title";
    var photo_id = photo.id;
    this.setState({title: value, id: photo_id});
    this.refs.titleEditor.setState({text: value});
  },
  requestTitleChange: function(new_title) {
    var id = this.state.id;
    $.ajax(
      { url: "/event_photos/" + id,
         type: "PUT",
         contentType: 'application/json',
         data: JSON.stringify(
           {event_photo: { title: new_title }}
         ),
         dataType: "json",
         success: function(data) {
         },
         error: function(data) {}
      }
    );
  },
  render: function() {
    var src = this.state.img_url;
    var title = this.state.title || "No Title"
    var next = <i className='fa fa-angle-right'></i>
    var prev = <i className='fa fa-angle-left'></i>

    var label;
    if(this.props.editable){
      label = <EditInPlace
            ref="titleEditor"
            text={title}
            activeClassName='form-control-parent'
            onChange={this.requestTitleChange}
            />;
    } else {
      label = <div>{title}</div>
    }

    return <Modal show={this.state.open} onHide={this.onHide}>
      <div className="modal-header">
        <h4>
          {label}
        </h4>
      </div>
      <div className='modal-body'>
        <Carousel
          defaultActiveIndex={this.state.index}
          onSelect={this.handleSelect}
          interval={0}
          nextIcon={next}
          prevIcon={prev}
        >
          {
            this.props.photos.map(function(p) {
              return <CarouselItem key={p.id}>
                <div>
                  <img src={p.photo.url} className='img-responsive bgh-event-photo-carousel center-block'/>
                </div>
                <BatterBox className="text-center" hasHit={false} hasHomerun={false} to_id={p.id} to_type='EventPhoto'/>
              </CarouselItem>
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
    var title = photo.title || "No title"
    this.refs.modal.setState({open: true, title: title, img_url: photo.photo.url, index: i, id: photo.id});
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
      <PhotoModal ref='modal' photos={this.props.data} editable={this.props.editable}></PhotoModal>
    </div>
  }
});


module.exports = Photos;
