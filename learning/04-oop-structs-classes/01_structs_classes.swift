// Structs (value types) vs classes (reference types)
struct Point {
    var x: Double
    var y: Double

    func distance(to other: Point) -> Double {
        ((x - other.x) * (x - other.x) + (y - other.y) * (y - other.y)).squareRoot()
    }
}

class Counter {
    private(set) var value = 0
    func increment() { value += 1 }
}

var p1 = Point(x: 0, y: 0)
var p2 = p1
p2.x = 10
print("p1: \(p1.x), p2: \(p2.x)")  // struct copy — p1 unaffected

let counterA = Counter()
let counterB = counterA
counterB.increment()
print("counterA.value: \(counterA.value)")  // class reference — shared state

// inheritance
class Shape {
    func area() -> Double { 0 }
}
class Circle: Shape {
    let radius: Double
    init(radius: Double) { self.radius = radius }
    override func area() -> Double { .pi * radius * radius }
}
let circle = Circle(radius: 2)
print("circle area: \(circle.area())")
