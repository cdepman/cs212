extension String {
  func charAt(index: Int) -> Character {
    let r = advance(self.startIndex, index)
    return self[r]
  }
}

class Calculator {


  func collectInput(input: String) {
    if input == "=" {
      if contains(parenOps, nextEquation.charAt(count(nextEquation) - 1)) || (contains(nonParenOps, nextEquation.charAt(count(nextEquation) - 1))) {
        nextEquation = dropLast(nextEquation)
      } 
      executeEquation(parseIntoDelimitedArray(nextEquation))
      return
    }
    if !contains(legalChars, input){
      return
    } else if (contains(parenOps, input) || contains(nonParenOps, input)) && (contains(parenOps, input.charAt(count(input) - 1)) || (contains(nonParenOps, input.charAt(count(input) - 1)))) {
        nextEquation = dropLast(nextEquation)
    }
    nextEquation += input
  }
  var total: Int = 0
  var nextEquation: String = ""
  var lastOperation: String = ""
  let parenOps: [String] = ["*", "/"]
  let nonParenOps: [String] = ["-", "+"]
  let legalChars: [String] = ["0","1","2","3","4","5","6","7","8","9","+","-","*","/"]

  func parseIntoDelimitedArray(rawInput: String) -> [String] {

    let rawInput = map(rawInput) { String($0) }
    let inputLength: Int = rawInput.count

    var calculation: [String] = ["("]

    for idx in (0...(inputLength-1)) {
      var char = rawInput[idx]
      println(char)
      if let num = char.toInt() {
        var nextIndex: Int = idx + 1
        if (inputLength > nextIndex) && contains(parenOps, rawInput[idx+1]) {
            calculation.append(rawInput[idx])
          } else if (inputLength > nextIndex) && contains(nonParenOps, rawInput[idx+1]) {
            calculation.append(rawInput[idx])
            calculation.append(")")
          } else {
            calculation.append(rawInput[idx])
          }
      } else {
        switch rawInput[idx] {
          case "+", "-":
            calculation.append(rawInput[idx])
            calculation.append("(")
          case "*", "/":
            calculation.append(rawInput[idx])
          default:
            calculation.append("")
        }
      }
    }
    calculation.append(")")
    return calculation
  }

  func executeEquation(equation: [String]) -> Int {
    if equation.count == 1 {
      return equation[0].toInt()!
    }
    var next = [String]()
    var idx = 0
    while idx < equation.count {
      if (idx + 1) < equation.count {
        if equation[idx] == "(" && equation[idx + 1] != "(" {
          var start = idx
          var end = idx
          while equation[end] != ")" && end < equation.count {
            end++
          }
          var resolvedExpression = evaluateSubExpression(Array(equation[(start+1)..<end]))
          next.append(resolvedExpression)
          if (end + 1) < equation.count {
            println("END: " + toString(end))
            next.append(equation[end + 1])
          }
          idx = end
        } else {
          println("ABOUT TO APPEND an OPEN PAREN")
          next.append("(")
        }
      } else {
        next.append(equation[idx])
      }
      idx++
    }
    println("DONE WITH WHILE LOOP")
    println("NEW EQ:")
    println(next)
    println("<>")
    return executeEquation(next)
  }

  func evaluateSubExpression(expression: [String]) -> String {
    var result = expression[0]
    if (expression.count == 1) {
      return result
    }
    var operation: String = expression[1]
    var value1 = expression[0].toInt()!
    var value2 = expression[2].toInt()!

    switch operation {
      case "+":
        return evaluateSubExpression([toString(value1 + value2)] + expression[3..<expression.count])
      case "-":
        return evaluateSubExpression([toString(value1 - value2)] + expression[3..<expression.count])
      case "*":
        return evaluateSubExpression([toString(value1 * value2)] + expression[3..<expression.count])
      case "/":
        return evaluateSubExpression([toString(value1 / value2)] + expression[3..<expression.count])
      default:
        return "0"
    }
  }
}



// executeEquation(["(","1",")"])

executeEquation(parseIntoDelimitedArray("3+3"))
