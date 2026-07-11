// async/await and structured concurrency
import Foundation

func fetchNumber(delayMs: UInt64, value: Int) async -> Int {
    try? await Task.sleep(nanoseconds: delayMs * 1_000_000)
    return value
}

func sumConcurrently() async -> Int {
    async let a = fetchNumber(delayMs: 100, value: 10)
    async let b = fetchNumber(delayMs: 50, value: 20)
    async let c = fetchNumber(delayMs: 10, value: 30)
    return await a + b + c
}

// Top-level code in a single-file script is an implicit async context.
let total = await sumConcurrently()
print("total: \(total)")

let results = await withTaskGroup(of: Int.self) { group in
    for i in 1...5 {
        group.addTask { await fetchNumber(delayMs: 5, value: i * i) }
    }
    var collected: [Int] = []
    for await value in group { collected.append(value) }
    return collected.sorted()
}
print("squares: \(results)")
