var CommentBox = React.createClass({
  render: function() {
    return (
      <div className="commentBox"
        <h1>Comments</h1>
        <CommentList />
        <CommentForm />
      </div>
    );
  }
});

React.render(
  <CommentBox />,
  document.getElementById('content')
);

var CommentList = React.createClass({
  render: function() {
    return (
      <div className="commentList">
        <Comment author="author One">a comment</Comment>
        <Comment author="author Two">another comment</Comment>
      </div>
    );
  }
});

var CommentForm = React.createClass({
  render: function() {
    return (
      <div className="commentForm">
        Hello, world! I am a CommentForm.
      </div>
    );
  }
});

var converter = new Showdown.converter();
var Comment = React.createClass({
  render: function(){
    // props.children is the nested content
    var rawMarkup = converter.makeHtml(this.props.children.toString());
    return (
      <div className="comment">
        <h2 className="commentAuthor">
          {this.props.author}
        </h2>
        // use this workaround to keep the html from being escaped
        <span dangerouslySetInnerHTML={{__html: rawMarkup}} />
      </div>
    );
  }
});


var data = [
  {author: "Pete Hunt", text: "This is one comment"},
  {author: "Jordan Walke", text: "This is *another* comment"}
];


