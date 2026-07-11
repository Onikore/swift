// Arrays, dictionaries, sets, and control flow
var fruits = ["apple", "banana", "cherry"]
fruits.append("date")

for (index, fruit) in fruits.enumerated() {
    print("\(index): \(fruit)")
}

let scores: [String: Int] = ["alice": 90, "bob": 75, "carol": 88]
for (name, score) in scores.sorted(by: { $0.key < $1.key }) {
    let grade = score >= 90 ? "A" : (score >= 80 ? "B" : "C")
    print("\(name): \(score) (\(grade))")
}

let uniqueNumbers: Set<Int> = [1, 2, 2, 3, 3, 3]
print("unique: \(uniqueNumbers.sorted())")

// switch with pattern matching
for n in 1...15 {
    switch (n % 3, n % 5) {
    case (0, 0): print("FizzBuzz")
    case (0, _): print("Fizz")
    case (_, 0): print("Buzz")
    default: print(n)
    }
}
