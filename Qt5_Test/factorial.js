.pragma library
var factorialCount = 3;

function factorial(a) {
    a = parseInt(a)
    if(a > 0)
        return a * factorial(a-1);
    factorialCount += 1;
    return 1;
}
function factorialCallCount(){
    return factorialCount;
}

