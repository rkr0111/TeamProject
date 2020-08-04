
//

//

//

var colorSelect = document.querySelector(".colorSelectContents > select");
var colorOpt = document.querySelectorAll(".colorSelectContents > select option");
var totalChoiceContainer = document.querySelector(".totalChoiceContainer");
var totalChoice = document.querySelector(".totalChoice");


// select option click event
colorOpt.addeventlistener("click", function() {
	totalChoiceContainer.removeClass("hidden");
});

function colorSelected() {
	var clrOptVal = "";
	for(int i=0; i<colorOpt.length; i++) {
		if(colorOpt[i].selected) {
			clrOptVal = colorOpt[i].value;
		}
	}
}