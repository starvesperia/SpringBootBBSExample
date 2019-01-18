var clicked = false;
function execute() {
	if (clicked) {
		//alert('이미 수행중인 작업입니다.');
		return false;
	}
	else {
		clicked = true;
	}
}

function execute(moveTo) {
	if (clicked) {
		alert('이미 수행중인 작업입니다.');
		return false;
	}
	else {
		clicked = true;
		location = moveTo;
	}
}