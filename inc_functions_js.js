// JScript File

//--begin "EXTENSION Required for the String IndexOf() Method"

if (!Array.prototype.indexOf)

{

    Array.prototype.indexOf = function (elt /*, from*/) 

    {

        var len = this.length;

        var from = Number(arguments[1]) || 0;

        from = (from < 0)

            ? Math.ceil(from)

            : Math.floor(from);

        if (from < 0) from += len;

        for (; from < len; from++) 

        {

            if (from in this && this[from] === elt) return from;

        }

        return -1;

    };

}



//--end "EXTENSION Required for the String IndexOf() Method"

function coreLogOut()

{

	var userOption = window.confirm("To log out and end your session, click 'OK'");

	if (userOption)

		window.open('logOff.asp', '_parent');

}

function ChangeRowBackgroundColor(row)

{

    row.style.backgroundColor='#c7c7c7';

}

function RevertRowBackgroundColor(row)

{

    row.style.backgroundColor='transparent';

}

function PersistRowBackgroundColor(row) {

    row.style.backgroundColor = '#c7c7c7';

}

function PrintPage()

{

    window.print();

}

function GenerateDynamicPDF(dynamicPDFHandler) {

    window.location.href = dynamicPDFHandler;

}

function CorrectBulkSMSNumbers(numbers, iterator) {

    var temp

    if (iterator == '1') 

        {

            temp = numbers.split(/[\n\r]/g);    //Split based on newline (carriage-return) character

        }

    else if (iterator == '2') 

        {

            temp = numbers.split(',');          //split based on comma

        }

    var ret = '';



    for (var i = 0; i < temp.length; i++)       //Check all of the elements in the array

    {

        (temp[i] = temp[i].replace(/^\s+|\s+$/g, ''));      //eliminate all consecutive white spaces

        //(temp[i] = temp[i].replace(/,/gi, ''));             //eliminate all "surviving" commas within the array element...

        if (temp[i] == '') 

        {

            //do nothing

        }

        else 

        {

            if (temp[i].substr(0, 1) == '+') 
            {

                //replace only the first occurrence of '+' with '' (empty string)

                (temp[i] = temp[i].replace('+', ''));

            }

            else if (temp[i].substr(0, 1) == '0') 

            {

                //replace only the first occurrence of 0 with 234

                (temp[i] = temp[i].replace('0', '234'));

            }

            else if (temp[i].substr(0, 1) == '7' || temp[i].substr(0, 1) == '8' || temp[i].substr(0, 1) == '9')

            {

                (temp[i] = '234' + temp[i]);

            }

            // ignore numbers already in international format
            // else if (temp[i].substr(0, 3) == '234') 
            // else if (temp[i].substr(0, 3) == '232' || temp[i].substr(0, 3) == '233' || temp[i].substr(0, 3) == '234' || temp[i].substr(0, 2) == '44') 
            else 

            {

                //do nothing

            }

        }

    }



    ret = temp.join(',');

    //eliminate the trailing comma

    if (ret.substr(-1, 1) == ',') 

    {

        ret = ret.substr(0, ret.length - 1)

    }



    //eliminate duplicates from the final array

    var temp2 = EliminateDuplicates(ret.split(','));



    return temp2;

}

function EliminateDuplicates(arr) {

    var temp = new Array();

    var temp2 = new Array();

    for (i=0;i<arr.length;i++)

    {

        if (temp.indexOf(arr[i]) == -1)

        {

            temp.push(arr[i]);

        }

        else

        {

            //Duplicate found. Doing nothing...

        }

    }

    var temp2 = new Array();

    for (j = 0;j<temp.length;j++) 

    {

            if (temp[j] == '' || temp[j] == '234')

            {

                //Doing nothing...

            }

            else

            {

                //Array Element is a valid element, not empty string ('') or '234'.

                temp2.push(temp[j]);

            }

    }

    return temp2;

}

function countChars(textbox, counter, max) {

    var count = max - document.getElementById(textbox).value.length;

    if (count < 0) 

    {

        document.getElementById(counter).innerHTML = "<span style='color: red;'>" + count + "</span>"; 

    }

    else 

    {

        document.getElementById(counter).innerHTML = "<span style='color: green;'>" + count + "</span>"; 

    }

}

function CalculateSMSUnits(textbox, counter) {

    var count = document.getElementById(textbox).value.length;

    var smsUnits = Math.ceil(count/160);

    var message = count + ' characters (' + smsUnits + ' SMS Units)';



    document.getElementById(counter).innerHTML = message;

}

function GetMonthName(monthNumber, abbr) {

    var ret = '';

    switch (parseInt(monthNumber, 10)) {

        case 1:

            if (abbr) {

                ret = 'Jan'

            }

            else {

                ret = 'January'

            }

            break;

        case 2:

            if (abbr) {

                ret = 'Feb'

            }

            else {

                ret = 'February'

            }

            break;

        case 3:

            if (abbr) {

                ret = 'Mar'

            }

            else {

                ret = 'March'

            }

            break;

        case 4:

            if (abbr) {

                ret = 'Apr'

            }

            else {

                ret = 'April'

            }

            break;

        case 5:

            if (abbr) {

                ret = 'May'

            }

            else {

                ret = 'May'

            }

            break;

        case 6:

            if (abbr) {

                ret = 'Jun'

            }

            else {

                ret = 'June'

            }

            break;

        case 7:

            if (abbr) {

                ret = 'Jul'

            }

            else {

                ret = 'July'

            }

            break;

        case 8:

            if (abbr) {

                ret = 'Aug'

            }

            else {

                ret = 'August'

            }

            break;

        case 9:

            if (abbr) {

                ret = 'Sep'

            }

            else {

                ret = 'September'

            }

            break;

        case 10:

            if (abbr) {

                ret = 'Oct'

            }

            else {

                ret = 'October'

            }

            break;

        case 11:

            if (abbr) {

                ret = 'Nov'

            }

            else {

                ret = 'November'

            }

            break;

        case 12:

            if (abbr) {

                ret = 'Dec'

            }

            else {

                ret = 'December'

            }

            break;

        default:

            window.alert('Invalid MonthNumber');

    }



    return ret;

}

function UpdateDateLabel(monthObj, dayObj, yearObj, dateLabelObj, hiddenFieldObj)

{

    var temp = '';

    temp = GetMonthName(monthObj.options[monthObj.selectedIndex].value, true).toUpperCase() + '/' + dayObj.options[dayObj.selectedIndex].value + '/' + yearObj.options[yearObj.selectedIndex].value;



    dateLabelObj.innerHTML = temp;

    hiddenFieldObj.value = temp;

}

function CopyStandardComment(sourceObj, studentName) {

    var temp = '';



    temp = sourceObj.options[sourceObj.selectedIndex].value;



    document.getElementById(sourceObj.id.replace("lstCommentSelector", "txtAddSubjectComment")).value = temp.replace(/{x}/gi, studentName);

}

function ChangeElementClass(targetElementId, newClass) {

    document.getElementById(targetElementId).setAttribute('class', newClass);

}

//=====================================================================

// mredkj.com

function NumberFormat(num, inputDecimal) {

    this.VERSION = 'Number Format v1.5.4';

    this.COMMA = ',';

    this.PERIOD = '.';

    this.DASH = '-';

    this.LEFT_PAREN = '(';

    this.RIGHT_PAREN = ')';

    this.LEFT_OUTSIDE = 0;

    this.LEFT_INSIDE = 1;

    this.RIGHT_INSIDE = 2;

    this.RIGHT_OUTSIDE = 3;

    this.LEFT_DASH = 0;

    this.RIGHT_DASH = 1;

    this.PARENTHESIS = 2;

    this.NO_ROUNDING = -1

    this.num;

    this.numOriginal;

    this.hasSeparators = false;

    this.separatorValue;

    this.inputDecimalValue;

    this.decimalValue;

    this.negativeFormat;

    this.negativeRed;

    this.hasCurrency;

    this.currencyPosition;

    this.currencyValue;

    this.places;

    this.roundToPlaces;

    this.truncate;

    this.setNumber = setNumberNF;

    this.toUnformatted = toUnformattedNF;

    this.setInputDecimal = setInputDecimalNF;

    this.setSeparators = setSeparatorsNF;

    this.setCommas = setCommasNF;

    this.setNegativeFormat = setNegativeFormatNF;

    this.setNegativeRed = setNegativeRedNF;

    this.setCurrency = setCurrencyNF;

    this.setCurrencyPrefix = setCurrencyPrefixNF;

    this.setCurrencyValue = setCurrencyValueNF;

    this.setCurrencyPosition = setCurrencyPositionNF;

    this.setPlaces = setPlacesNF;

    this.toFormatted = toFormattedNF;

    this.toPercentage = toPercentageNF;

    this.getOriginal = getOriginalNF;

    this.moveDecimalRight = moveDecimalRightNF;

    this.moveDecimalLeft = moveDecimalLeftNF;

    this.getRounded = getRoundedNF;

    this.preserveZeros = preserveZerosNF;

    this.justNumber = justNumberNF;

    this.expandExponential = expandExponentialNF;

    this.getZeros = getZerosNF;

    this.moveDecimalAsString = moveDecimalAsStringNF;

    this.moveDecimal = moveDecimalNF;

    this.addSeparators = addSeparatorsNF;

    if (inputDecimal == null) {

        this.setNumber(num, this.PERIOD);

    } else {

        this.setNumber(num, inputDecimal);

    }

    this.setCommas(true);

    this.setNegativeFormat(this.LEFT_DASH);

    this.setNegativeRed(false);

    this.setCurrency(false);

    this.setCurrencyPrefix('$');

    this.setPlaces(2);

}

function setInputDecimalNF(val) {

    this.inputDecimalValue = val;

}

function setNumberNF(num, inputDecimal) {

    if (inputDecimal != null) {

        this.setInputDecimal(inputDecimal);

    }

    this.numOriginal = num;

    this.num = this.justNumber(num);

}

function toUnformattedNF() {

    return (this.num);

}

function getOriginalNF() {

    return (this.numOriginal);

}

function setNegativeFormatNF(format) {

    this.negativeFormat = format;

}

function setNegativeRedNF(isRed) {

    this.negativeRed = isRed;

}

function setSeparatorsNF(isC, separator, decimal) {

    this.hasSeparators = isC;

    if (separator == null) separator = this.COMMA;

    if (decimal == null) decimal = this.PERIOD;

    if (separator == decimal) {

        this.decimalValue = (decimal == this.PERIOD) ? this.COMMA : this.PERIOD;

    } else {

        this.decimalValue = decimal;

    }

    this.separatorValue = separator;

}

function setCommasNF(isC) {

    this.setSeparators(isC, this.COMMA, this.PERIOD);

}

function setCurrencyNF(isC) {

    this.hasCurrency = isC;

}

function setCurrencyValueNF(val) {

    this.currencyValue = val;

}

function setCurrencyPrefixNF(cp) {

    this.setCurrencyValue(cp);

    this.setCurrencyPosition(this.LEFT_OUTSIDE);

}

function setCurrencyPositionNF(cp) {

    this.currencyPosition = cp

}

function setPlacesNF(p, tr) {

    this.roundToPlaces = !(p == this.NO_ROUNDING);

    this.truncate = (tr != null && tr);

    this.places = (p < 0) ? 0 : p;

}

function addSeparatorsNF(nStr, inD, outD, sep) {

    nStr += '';

    var dpos = nStr.indexOf(inD);

    var nStrEnd = '';

    if (dpos != -1) {

        nStrEnd = outD + nStr.substring(dpos + 1, nStr.length);

        nStr = nStr.substring(0, dpos);

    }

    var rgx = /(\d+)(\d{3})/;

    while (rgx.test(nStr)) {

        nStr = nStr.replace(rgx, '$1' + sep + '$2');

    }

    return nStr + nStrEnd;

}

function toFormattedNF() {

    var pos;

    var nNum = this.num;

    var nStr;

    var splitString = new Array(2);

    if (this.roundToPlaces) {

        nNum = this.getRounded(nNum);

        nStr = this.preserveZeros(Math.abs(nNum));

    } else {

        nStr = this.expandExponential(Math.abs(nNum));

    }

    if (this.hasSeparators) {

        nStr = this.addSeparators(nStr, this.PERIOD, this.decimalValue, this.separatorValue);

    } else {

        nStr = nStr.replace(new RegExp('\\' + this.PERIOD), this.decimalValue);

    }

    var c0 = '';

    var n0 = '';

    var c1 = '';

    var n1 = '';

    var n2 = '';

    var c2 = '';

    var n3 = '';

    var c3 = '';

    var negSignL = (this.negativeFormat == this.PARENTHESIS) ? this.LEFT_PAREN : this.DASH;

    var negSignR = (this.negativeFormat == this.PARENTHESIS) ? this.RIGHT_PAREN : this.DASH;

    if (this.currencyPosition == this.LEFT_OUTSIDE) {

        if (nNum < 0) {

            if (this.negativeFormat == this.LEFT_DASH || this.negativeFormat == this.PARENTHESIS) n1 = negSignL;

            if (this.negativeFormat == this.RIGHT_DASH || this.negativeFormat == this.PARENTHESIS) n2 = negSignR;

        }

        if (this.hasCurrency) c0 = this.currencyValue;

    } else if (this.currencyPosition == this.LEFT_INSIDE) {

        if (nNum < 0) {

            if (this.negativeFormat == this.LEFT_DASH || this.negativeFormat == this.PARENTHESIS) n0 = negSignL;

            if (this.negativeFormat == this.RIGHT_DASH || this.negativeFormat == this.PARENTHESIS) n3 = negSignR;

        }

        if (this.hasCurrency) c1 = this.currencyValue;

    }

    else if (this.currencyPosition == this.RIGHT_INSIDE) {

        if (nNum < 0) {

            if (this.negativeFormat == this.LEFT_DASH || this.negativeFormat == this.PARENTHESIS) n0 = negSignL;

            if (this.negativeFormat == this.RIGHT_DASH || this.negativeFormat == this.PARENTHESIS) n3 = negSignR;

        }

        if (this.hasCurrency) c2 = this.currencyValue;

    }

    else if (this.currencyPosition == this.RIGHT_OUTSIDE) {

        if (nNum < 0) {

            if (this.negativeFormat == this.LEFT_DASH || this.negativeFormat == this.PARENTHESIS) n1 = negSignL;

            if (this.negativeFormat == this.RIGHT_DASH || this.negativeFormat == this.PARENTHESIS) n2 = negSignR;

        }

        if (this.hasCurrency) c3 = this.currencyValue;

    }

    nStr = c0 + n0 + c1 + n1 + nStr + n2 + c2 + n3 + c3;

    if (this.negativeRed && nNum < 0) {

        nStr = '<font color="red">' + nStr + '</font>';

    }

    return (nStr);

}

function toPercentageNF() {

    nNum = this.num * 100;

    nNum = this.getRounded(nNum);

    return nNum + '%';

}

function getZerosNF(places) {

    var extraZ = '';

    var i;

    for (i = 0; i < places; i++) {

        extraZ += '0';

    }

    return extraZ;

}

function expandExponentialNF(origVal) {

    if (isNaN(origVal)) return origVal;

    var newVal = parseFloat(origVal) + '';

    var eLoc = newVal.toLowerCase().indexOf('e');

    if (eLoc != -1) {

        var plusLoc = newVal.toLowerCase().indexOf('+');

        var negLoc = newVal.toLowerCase().indexOf('-', eLoc);

        var justNumber = newVal.substring(0, eLoc);

        if (negLoc != -1) {

            var places = newVal.substring(negLoc + 1, newVal.length);

            justNumber = this.moveDecimalAsString(justNumber, true, parseInt(places));

        } else {

            if (plusLoc == -1) plusLoc = eLoc;

            var places = newVal.substring(plusLoc + 1, newVal.length);

            justNumber = this.moveDecimalAsString(justNumber, false, parseInt(places));

        }

        newVal = justNumber;

    }

    return newVal;

}

function moveDecimalRightNF(val, places) {

    var newVal = '';

    if (places == null) {

        newVal = this.moveDecimal(val, false);

    } else {

        newVal = this.moveDecimal(val, false, places);

    }

    return newVal;

}

function moveDecimalLeftNF(val, places) {

    var newVal = '';

    if (places == null) {

        newVal = this.moveDecimal(val, true);

    } else {

        newVal = this.moveDecimal(val, true, places);

    }

    return newVal;

}

function moveDecimalAsStringNF(val, left, places) {

    var spaces = (arguments.length < 3) ? this.places : places;

    if (spaces <= 0) return val;

    var newVal = val + '';

    var extraZ = this.getZeros(spaces);

    var re1 = new RegExp('([0-9.]+)');

    if (left) {

        newVal = newVal.replace(re1, extraZ + '$1');

        var re2 = new RegExp('(-?)([0-9]*)([0-9]{' + spaces + '})(\\.?)');

        newVal = newVal.replace(re2, '$1$2.$3');

    } else {

        var reArray = re1.exec(newVal);

        if (reArray != null) {

            newVal = newVal.substring(0, reArray.index) + reArray[1] + extraZ + newVal.substring(reArray.index + reArray[0].length);

        }

        var re2 = new RegExp('(-?)([0-9]*)(\\.?)([0-9]{' + spaces + '})');

        newVal = newVal.replace(re2, '$1$2$4.');

    }

    newVal = newVal.replace(/\.$/, '');

    return newVal;

}

function moveDecimalNF(val, left, places) {

    var newVal = '';

    if (places == null) {

        newVal = this.moveDecimalAsString(val, left);

    } else {

        newVal = this.moveDecimalAsString(val, left, places);

    }

    return parseFloat(newVal);

}

function getRoundedNF(val) {

    val = this.moveDecimalRight(val);

    if (this.truncate) {

        val = val >= 0 ? Math.floor(val) : Math.ceil(val);

    } else {

        val = Math.round(val);

    }

    val = this.moveDecimalLeft(val);

    return val;

}

function preserveZerosNF(val) {

    var i;

    val = this.expandExponential(val);

    if (this.places <= 0) return val;

    var decimalPos = val.indexOf('.');

    if (decimalPos == -1) {

        val += '.';

        for (i = 0; i < this.places; i++) {

            val += '0';

        }

    } else {

        var actualDecimals = (val.length - 1) - decimalPos;

        var difference = this.places - actualDecimals;

        for (i = 0; i < difference; i++) {

            val += '0';

        }

    }

    return val;

}

function justNumberNF(val) {

    newVal = val + '';

    var isPercentage = false;

    if (newVal.indexOf('%') != -1) {

        newVal = newVal.replace(/\%/g, '');

        isPercentage = true;

    }

    var re = new RegExp('[^\\' + this.inputDecimalValue + '\\d\\-\\+\\(\\)eE]', 'g');

    newVal = newVal.replace(re, '');

    var tempRe = new RegExp('[' + this.inputDecimalValue + ']', 'g');

    var treArray = tempRe.exec(newVal);

    if (treArray != null) {

        var tempRight = newVal.substring(treArray.index + treArray[0].length);

        newVal = newVal.substring(0, treArray.index) + this.PERIOD + tempRight.replace(tempRe, '');

    }

    if (newVal.charAt(newVal.length - 1) == this.DASH) {

        newVal = newVal.substring(0, newVal.length - 1);

        newVal = '-' + newVal;

    }

    else if (newVal.charAt(0) == this.LEFT_PAREN

&& newVal.charAt(newVal.length - 1) == this.RIGHT_PAREN) {

        newVal = newVal.substring(1, newVal.length - 1);

        newVal = '-' + newVal;

    }

    newVal = parseFloat(newVal);

    if (!isFinite(newVal)) {

        newVal = 0;

    }

    if (isPercentage) {

        newVal = this.moveDecimalLeft(newVal, 2);

    }

    return newVal;

}

//=====================================================================

function ChangeElementContents(elementId, newText) {

    document.getElementById(elementId).innerHTML = newText;

}

function GetFeeStreamsTotal(checkboxArrayId, textboxId) {

    //	document.getElementById(checkboxArrayId)

    //return document.getElementsByName(checkboxArrayId).length;

    var chkArray = document.getElementsByName(checkboxArrayId);

    var currentAmount = 0;

    var totalAmount = 0;



    for (i = 0; i < chkArray.length; i++) {

        //alert(i);

        currentAmount = parseFloat(chkArray[i].value);

        if (chkArray[i].checked) {

            totalAmount = parseFloat(totalAmount) + currentAmount

        }

        else {

            totalAmount = totalAmount

        }

    }

    //add the free-form textbox added by the Bursar

    totalAmount = totalAmount + parseFloat(document.getElementById(textboxId).value);



    return new NumberFormat(totalAmount).toFormatted(); // totalAmount.toFormatted;

}

function MM_jumpMenu(targ, selObj, restore) { //v3.0

    eval(targ + ".location='" + selObj.options[selObj.selectedIndex].value + "'");

    if (restore) selObj.selectedIndex = 0;

}

