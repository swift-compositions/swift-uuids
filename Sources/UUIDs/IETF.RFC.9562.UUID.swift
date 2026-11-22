public import RFC_9562
public import Random

extension IETF.RFC.`9562`.UUID {

    public static func v7(at timestamp: IETF.RFC.`9562`.Timestamp) throws(Random.Error) -> Self {
        try unsafe v7(timestamp: timestamp, fillRandom: Random.fill)
    }
}
