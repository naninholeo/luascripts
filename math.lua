--done by nani
--simple math operations
function math(operation, number1, number2)
    local tableoperations = {"+", "-", "*", "X", "x", ".", "/", "√", "root", "^"}
    if operation == "+" then
        print(number1 + number2)
    elseif operation == "-" then
        print(number1 - number2)
    elseif operation == "*" or operation ==  "X" or operation == "x" or  operation == "." then
        print(number1 * number2)
    elseif operation == "/" then 
        print(number1/number2)
    elseif operation == "root" or operation == "√" then
        print(number1^0.5)
    elseif operation == "^" then
        print(number1^number2)
    elseif not table.find(tableoperations, operation) then
        print("Not a valid operation")
    end
end
math("operation",number1,number2)
