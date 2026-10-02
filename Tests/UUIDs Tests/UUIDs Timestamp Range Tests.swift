import Testing

@testable import UUIDs

extension UUIDs.Test.`Edge Case` {
    @Test
    func `v7(unixMilliseconds:) accepts the epoch`() throws {
        let uuid = try RFC_9562.UUID.v7(unixMilliseconds: 0)
        #expect(uuid.bytes.0 == 0)
        #expect(uuid.bytes.5 == 0)
        #expect(uuid.bytes.6 >> 4 == 7)
    }

    @Test
    func `v7(unixMilliseconds:) traps on a negative timestamp`() async {
        await #expect(processExitsWith: .failure) {
            _ = try? RFC_9562.UUID.v7(unixMilliseconds: -1)
        }
    }

    @Test
    func `v7(unixMilliseconds:) traps one past the 48-bit maximum`() async {
        await #expect(processExitsWith: .failure) {
            _ = try? RFC_9562.UUID.v7(unixMilliseconds: 0x1_0000_0000_0000)
        }
    }
}
