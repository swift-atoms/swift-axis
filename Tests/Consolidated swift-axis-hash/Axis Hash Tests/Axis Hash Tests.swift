import Axis
import Hash
import Testing

@Suite
struct `Axis Hash Integration` {

    @Test
    func `Axis retains its native Hashable behavior`() {
        let axis = Axis<3>.secondary
        var hasher = Hasher()

        axis.hash(into: &hasher)
        _ = hasher.finalize()
    }

    @Test
    func `Axis supplies Hash's domain-typed value`() {
        let first: Hash.Value = hash(Axis<3>.secondary)
        let second: Hash.Value = hash(Axis<3>.secondary)

        #expect(first == second)
    }
}

private func hash<T: Hash.`Protocol`>(_ value: borrowing T) -> Hash.Value {
    value.hashValue
}
