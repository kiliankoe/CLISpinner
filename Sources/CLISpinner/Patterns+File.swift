import struct Foundation.Data
import class Foundation.FileManager
import class Foundation.JSONDecoder


private let manager = FileManager.default
public extension Pattern {
    static func load(from filepath: String) throws -> Pattern {
        guard manager.fileExists(atPath: filepath) else {
            throw PatternFileError.fileDoesNotExist(filepath)
        }
        guard manager.isReadableFile(atPath: filepath) else {
            throw PatternFileError.fileNotReadable(filepath)
        }

        guard let data = manager.contents(atPath: filepath) else {
            throw PatternFileError.failedToRead(filepath)
        }

        return try .load(from: data)
    }

    static func load(from data: Data) throws -> Pattern {
        return try JSONDecoder().decode(Pattern.self, from: data)
    }
}

public enum PatternFileError: Error {
    case fileDoesNotExist(String)
    case fileNotReadable(String)
    case failedToRead(String)
}

public struct Patterns: Decodable {
    private let patterns: [String: Pattern]

    public init(from filepath: String) throws {
        guard manager.fileExists(atPath: filepath) else {
            throw PatternFileError.fileDoesNotExist(filepath)
        }
        guard manager.isReadableFile(atPath: filepath) else {
            throw PatternFileError.fileNotReadable(filepath)
        }

        guard let data = manager.contents(atPath: filepath) else {
            throw PatternFileError.failedToRead(filepath)
        }

        self = try .init(from: data)
    }

    public init(from data: Data) throws {
        self = try JSONDecoder().decode(Patterns.self, from: data)
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        patterns = try container.decode([String: Pattern].self)
    }

    public subscript(pattern: String) -> Pattern? {
        return patterns[pattern]
    }
}
