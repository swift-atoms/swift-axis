import Axis
import Testing

@Suite
struct `Two dimensional axes exchange perpendicular positions` {
    @Suite struct `No axis perpendicular operation unit cases are defined` {}
    @Suite struct `No axis perpendicular operation boundary cases are defined` {}
    @Suite struct `No axis perpendicular operation integration cases are defined` {}

    @Test(arguments: [Axis<2>.primary, Axis<2>.secondary])
    func `perpendicular is involution in 2D`(axis: Axis<2>) {
        let perp1 = Axis<2>.perpendicular(of: axis)
        let perp2 = Axis<2>.perpendicular(of: perp1)
        #expect(perp2 == axis)
    }

    @Test
    func `perpendicular maps primary to secondary in 2D`() {
        #expect(Axis<2>.perpendicular(of: .primary) == .secondary)
    }

    @Test
    func `perpendicular maps secondary to primary in 2D`() {
        #expect(Axis<2>.perpendicular(of: .secondary) == .primary)
    }
}

@Suite
struct `Axis properties preserve indices and perpendicular behavior` {
    @Suite struct `No axis property unit cases are defined` {}
    @Suite struct `No axis property boundary cases are defined` {}
    @Suite struct `No axis property integration cases are defined` {}

    @Test(arguments: [Axis<2>.primary, Axis<2>.secondary])
    func `perpendicular property delegates to static function`(axis: Axis<2>) {
        #expect(axis.perpendicular == Axis<2>.perpendicular(of: axis))
    }

    @Test(arguments: [0, 1, 2, 3])
    func `Axis underlying values preserve their construction index`(value: Int) {
        let axis: Axis<5>?
        do throws(Axis<5>.Error) {
            axis = try Axis(value)
        } catch {
            axis = nil
        }
        #expect(axis?.underlying == value)
    }
}

@Suite
struct `Axis construction accepts exactly the indices within its dimension` {
    @Suite struct `No axis initialization unit cases are defined` {}
    @Suite struct `No axis initialization boundary cases are defined` {}
    @Suite struct `No axis initialization integration cases are defined` {}

    @Test(arguments: [0, 1, 2, 3, 4])
    func `Axis construction preserves indices within the dimension`(value: Int) {
        let axis: Axis<5>?
        do throws(Axis<5>.Error) {
            axis = try Axis(value)
        } catch {
            axis = nil
        }
        #expect(axis != nil)
        #expect(axis?.underlying == value)
    }

    @Test(arguments: [-1, 5, 10])
    func `Invalid axis construction leaves no axis value`(value: Int) {
        let axis: Axis<5>?
        do throws(Axis<5>.Error) {
            axis = try Axis(value)
        } catch {
            axis = nil
        }
        #expect(axis == nil)
    }

    @Test
    func `init throws outOfBounds for negative index`() {
        #expect(throws: Axis<3>.Error.outOfBounds(-1)) {
            _ = try Axis<3>(-1)
        }
    }

    @Test
    func `init throws outOfBounds for index at N`() {
        #expect(throws: Axis<3>.Error.outOfBounds(3)) {
            _ = try Axis<3>(3)
        }
    }
}

@Suite
struct `Axis constants identify the available dimension positions` {
    @Suite struct `No axis constant unit cases are defined` {}
    @Suite struct `No axis constant boundary cases are defined` {}
    @Suite struct `No axis constant integration cases are defined` {}

    @Test
    func `1D has only primary`() {
        #expect(Axis<1>.primary.underlying == 0)
    }

    @Test
    func `2D has primary and secondary`() {
        #expect(Axis<2>.primary.underlying == 0)
        #expect(Axis<2>.secondary.underlying == 1)
    }

    @Test
    func `3D has primary secondary and tertiary`() {
        #expect(Axis<3>.primary.underlying == 0)
        #expect(Axis<3>.secondary.underlying == 1)
        #expect(Axis<3>.tertiary.underlying == 2)
    }

    @Test
    func `4D has primary secondary tertiary and quaternary`() {
        #expect(Axis<4>.primary.underlying == 0)
        #expect(Axis<4>.secondary.underlying == 1)
        #expect(Axis<4>.tertiary.underlying == 2)
        #expect(Axis<4>.quaternary.underlying == 3)
    }
}

@Suite
struct `Axis ordering and hashing preserve index identity` {
    @Suite struct `No axis comparison unit cases are defined` {}
    @Suite struct `No axis comparison boundary cases are defined` {}
    @Suite struct `No axis comparison integration cases are defined` {}

    @Test
    func `Axis ordering follows the stored index`() {
        #expect(Axis<3>.primary < Axis<3>.secondary)
        #expect(Axis<3>.secondary < Axis<3>.tertiary)
        #expect(Axis<3>.tertiary > Axis<3>.primary)
        #expect(!(Axis<3>.tertiary < Axis<3>.primary))
    }

    @Test
    func `standard conformances are intrinsic`() {
        func acceptsComparable<T: Comparable>(_ value: T) -> T { value }
        func acceptsHashable<T: Hashable>(_ value: T) -> T { value }

        let values: Set<Axis<3>> = [.primary, .secondary, .primary]

        #expect(acceptsComparable(Axis<3>.secondary) == .secondary)
        #expect(acceptsHashable(Axis<3>.tertiary) == .tertiary)
        #expect(values.count == 2)
    }
}

@Suite
struct `Axis types retain their dimension in typed operations` {
    @Suite struct `No axis dimension type unit cases are defined` {}
    @Suite struct `No axis dimension type boundary cases are defined` {}
    @Suite struct `No axis dimension type integration cases are defined` {}

    @Test
    func `Axes of different dimensions have same index but different types`() {
        let axis2: Axis<2> = .primary
        let axis3: Axis<3> = .primary

        #expect(axis2.underlying == axis3.underlying)
        #expect(axis2.underlying == 0)

    }

    @Test
    func `Functions accepting specific dimensions enforce type safety`() {
        func process2D(_ axis: Axis<2>) -> Int {
            axis.underlying
        }

        let axis2: Axis<2> = .secondary
        #expect(process2D(axis2) == 1)

    }
}
