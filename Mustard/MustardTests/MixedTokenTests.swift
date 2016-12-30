//
//  MixedTokenTests.swift
//  Mustard
//
//  Created by Mathew Sanders on 12/30/16.
//  Copyright © 2016 Mathew Sanders. All rights reserved.
//

import XCTest
import Mustard

typealias MixedMatch = (tokenType: MixedToken, text: String, range: Range<String.Index>)

enum MixedToken: TokenType {
    
    case word
    case number
    case emoji
    
    init() {
        self = .word
    }
    
    static let wordToken = WordToken()
    static let numberToken = NumberToken()
    static let emojiToken = EmojiToken()
    
    func tokenCanInclude(scalar: UnicodeScalar) -> Bool {
        switch self {
        case .word: return MixedToken.wordToken.tokenCanInclude(scalar: scalar)
        case .number: return MixedToken.numberToken.tokenCanInclude(scalar: scalar)
        case .emoji: return MixedToken.emojiToken.tokenCanInclude(scalar: scalar)
        }
    }
    
    func tokenType(startingWith scalar: UnicodeScalar) -> TokenType? {
        
        if let _ = MixedToken.wordToken.tokenType(startingWith: scalar) {
            return MixedToken.word
        }
        else if let _ = MixedToken.numberToken.tokenType(startingWith: scalar) {
            return MixedToken.number
        }
        else if let _ = MixedToken.emojiToken.tokenType(startingWith: scalar) {
            return MixedToken.emoji
        }
        return nil
    }
}

class MixedTokenTests: XCTestCase {
    
    func testMixedTokens() {
        
        let tokens: [MixedMatch] = "123👩‍👩‍👦‍👦Hello world👶again👶🏿45.67".tokens()
        
        XCTAssert(tokens.count == 8, "Unexpected number of tokens [\(tokens.count)]")
        
        XCTAssert(tokens[0].tokenType == .number)
        XCTAssert(tokens[0].text == "123")
        
        XCTAssert(tokens[1].tokenType == .emoji)
        XCTAssert(tokens[1].text == "👩‍👩‍👦‍👦")
        
        XCTAssert(tokens[2].tokenType == .word)
        XCTAssert(tokens[2].text == "Hello")
        
        XCTAssert(tokens[3].tokenType == .word)
        XCTAssert(tokens[3].text == "world")
    
        XCTAssert(tokens[4].tokenType == .emoji)
        XCTAssert(tokens[4].text == "👶")
        
        XCTAssert(tokens[5].tokenType == .word)
        XCTAssert(tokens[5].text == "again")
        
        XCTAssert(tokens[6].tokenType == .emoji)
        XCTAssert(tokens[6].text == "👶🏿")
        
        XCTAssert(tokens[7].tokenType == .number)
        XCTAssert(tokens[7].text == "45.67")
        
    }
}