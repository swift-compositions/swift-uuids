public import RFC_9562
public import Random

extension RFC_9562.UUID {

    public static func v7(at timestamp: RFC_9562.Timestamp) throws(Random.Error) -> Self {
        try unsafe v7(timestamp: timestamp, fillRandom: Random.fill)
    }
}
