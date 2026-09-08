import Axis
import Testing

@Suite
struct `Axis Equation Integration` {
    @Test
    func `Axis satisfies Equation Protocol`() {
        func acceptsEquationProtocol<T: Equation.`Protocol`>(_ value: T) -> T {
            value
        }

        #expect(acceptsEquationProtocol(Axis<3>.secondary) == .secondary)
    }

    @Test
    func `Equation Protocol compares axes`() {
        func equationEquals<T: Equation.`Protocol`>(_ lhs: T, _ rhs: T) -> Bool {
            lhs == rhs
        }

        #expect(equationEquals(Axis<3>.primary, .primary))
        #expect(!equationEquals(Axis<3>.primary, .secondary))
    }

    @Test
    func `Equality remains dimension specific`() {
        #expect(Axis<2>.secondary == Axis<2>.secondary)
        #expect(Axis<4>.tertiary != Axis<4>.quaternary)
    }
}
