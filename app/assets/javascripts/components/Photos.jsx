var Masonry = require('react-masonry-component')

var Photo = React.createClass({
  onClick: function() {
    alert('image clicked! (debug message)');
  },
  render: function() {
    var src = this.props.data.photo.mini.url;
    return <div className='grid-item'>
      <img src={src} onClick={this.onClick} className='img-responsive img-rounded first-photo center-block'/>
    </div>
  }
});

var Photos = React.createClass({
  render: function() {
    var op = {
      percentPosition: true,
      itemSelector:'.grid-item',
      columnWidth:'.grid-sizer'
    };
    return <Masonry
      className='grid'
      options={op}
      disableImagesLoaded={false}
    >
      <div className='grid-sizer'></div>
      {this.props.data.map((photo)=>{
        return <Photo data={photo} key={photo.id} />
      })}
    </Masonry>;
  }
});


module.exports = Photos;
