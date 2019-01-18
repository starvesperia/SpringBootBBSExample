var multipleSubmitFlag = false;
function fncSubmit(formName) {
    if(multipleSubmitFlag) {
        alert('제출 중입니다.');
        return false;
    }
    else {
        multipleSubmitFlag = true;
        formName.submit();
    }
}
