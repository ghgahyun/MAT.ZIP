function check(regExp, e, msg) {
    if (regExp.test(e.value)) {
        return true;
    }
    alert(msg);
    e.select();
    e.focus();
    return false;
}

function CheckAddFood() {

    var foodId = document.getElementById("foodId");
    var name = document.getElementById("name");
    var unitPrice = document.getElementById("unitPrice");
    var description = document.getElementById("description");
    var form = document.newFood;

	if (!check(/^[A-Z]{2}[0-9]{3,10}$/, foodId,
	        "[음식 코드]\n영문 대문자 2자와 숫자를 조합하여 5~12자까지 입력하세요.\n첫 두 글자는 반드시 국가명 코드로 시작해야 합니다."))
	        return false;

    if (name.value.length < 4 || name.value.length > 50) { 
        alert("[음식명]\n최소 4자에서 최대 50자까지 입력하세요");
        name.select();
        name.focus();
        return false;
    }

    if (unitPrice.value.length == 0 || isNaN(unitPrice.value)) {
        alert("[가격]\n숫자만 입력하세요");
        unitPrice.select();
        unitPrice.focus();
        return false;
    }

    if (unitPrice.value < 0) {
        alert("[가격]\n음수를 입력할 수 없습니다");
        unitPrice.select();
        unitPrice.focus();
        return false;
    }
    
    if (!check(/^\d+(?:[.]?[\d]{1,2})?$/, unitPrice,
        "[가격]\n소수점 둘째 자리까지만 입력하세요")) {
        return false;
    }
    
    if (description.value.length < 50) { 
        alert("[짧은 설명]]\n최소 50자 이상 입력하세요");
        description.select();
        description.focus();
        return false;
    }

    form.submit();
}