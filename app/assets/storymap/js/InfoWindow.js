
var InfoWindowContainer = React.createClass({displayName: "InfoWindowContainer",
	componentDidMount:function(){
		console.log("hihihi")
	},
	render: function() {
		return (
			React.createElement("div", {id: "info-window-list-container"}, 
				React.createElement(InfoWindowList, null)
			)
		);
	}

});

var InfoWindowList = React.createClass({displayName: "InfoWindowList",
	componentDidMount:function(){
		var target=this.refs.InfoWindowList.getDOMNode();
		$(target).sortable({
		  containment: "#info-window-list-container"
		});
		$(target).disableSelection();
		$(target).on("sortupdate",this.updateHandler);
	},
	updateHandler:function(event,ui){
			dataStore.storymap.slides=$(".item-container")
				.map(function(index,item){return dataStore.storymap.slides[$(item).data("index")];}).toArray();
			$(".item-container").each(function(index,item){
				$(item).data("index",index);
			});
			console.log(JSON.stringify(dataStore));
			
	},
	getItemList:function(){
		return dataStore.storymap.slides.map(function(item,index){
			return React.createElement(InfoWindowItem, {itemObject: item, itemIndex: index})
		});
	},
	render: function() {
		return (
			React.createElement("ul", {ref: "InfoWindowList", id: "info-window-list"}, 
				
					this.getItemList()
				
			)
		);
	}

});

var InfoWindowItem = React.createClass({displayName: "InfoWindowItem",
	componentDidMount:function(){
		this.setupIndex(this.props.itemIndex);
	},
	componentDidUpdate:function(){
		this.setupIndex(this.props.itemIndex);
	},
	setupIndex:function(index){
		$(this.refs.ItemContainer.getDOMNode()).data("index",index);
	},
	getStyle:function(){

		return {"background-image":"url("+this.props.itemObject.media.url+")"};
	},
	render: function() {
		return (
			React.createElement("li", {ref: "ItemContainer", id: "item-container-"+this.props.itemIndex, className: "item-container"}, 
				React.createElement("div", {style: this.getStyle(), id: "item-content-box-" +this.props.itemIndex, className: "item-content-box"}, 
					
					React.createElement("div", {className: "item-headline"}, 
						this.props.itemObject.text.headline
					)
					
				)
			)
		);
	}

});