// Functions, closures, and higher-order functions
func greet(_ name: String, greeting: String = "Hello") -> String {
    "\(greeting), \(name)!"
}
print(greet("Swift"))
print(greet("world", greeting: "Hi"))

func makeMultiplier(by factor: Int) -> (Int) -> Int {
    { number in number * factor }
}
let triple = makeMultiplier(by: 3)
print(triple(7))

let numbers = [1, 2, 3, 4, 5, 6]
let evenSquares = numbers
    .filter { $0 % 2 == 0 }
    .map { $0 * $0 }
    .reduce(0, +)
print("sum of even squares: \(evenSquares)")

// variadic + trailing closure
func repeatTask(times: Int, task: () -> Void) {
    for _ in 0..<times { task() }
}
repeatTask(times: 3) { print("tick") }
