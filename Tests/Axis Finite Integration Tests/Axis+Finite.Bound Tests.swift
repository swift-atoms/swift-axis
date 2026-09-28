import Finite
import Ordinal
import Axis
import Testing

@Suite
struct `Axis Finite Integration` {
    @Test
    func `finite bound matches axis dimension`() {
        #expect(Axis<3>.finiteBound == Finite.Bound<3>())
        #expect(Axis<4>.finiteBound == Finite.Bound<4>())
    }

    @Test
    func `axis maps to ordinal`() {
        #expect(Axis<3>.primary.ordinal.rawValue == 0)
        #expect(Axis<3>.secondary.ordinal.rawValue == 1)
        #expect(Axis<3>.tertiary.ordinal.rawValue == 2)
    }

    @Test(arguments: [UInt(0), 1, 2, 3])
    func `ordinal round trips through axis`(rawValue: UInt) {
        let axis = Axis<4>(ordinal: Ordinal(rawValue))
        #expect(axis?.ordinal.rawValue == rawValue)
    }

    @Test
    func `out of bounds ordinal is rejected`() {
        #expect(Axis<3>(ordinal: Ordinal(UInt(3))) == nil)
        #expect(Axis<3>(ordinal: Ordinal(UInt.max)) == nil)
    }

    @Test
    func `finite bound contains checked axes`() {
        let bound = Finite.Bound<3>()
        #expect(bound.contains(Axis<3>.primary))
        #expect(bound.contains(Axis<3>.tertiary))
    }

    @Test
    func `finite bound rejects unchecked invalid axes`() {
        let bound = Finite.Bound<3>()
        #expect(!bound.contains(Axis<3>(_unchecked: (), -1)))
        #expect(!bound.contains(Axis<3>(_unchecked: (), 3)))
    }
}
