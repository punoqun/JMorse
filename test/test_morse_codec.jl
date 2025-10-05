"""
Tests for MorseCodec module
"""

push!(LOAD_PATH, joinpath(@__DIR__, "..", "src"))
include("../src/MorseCodec.jl")

using .MorseCodec
using Test

@testset "MorseCodec Tests" begin
    @testset "Encoding to Morse" begin
        # Test basic encoding
        @test encode_to_morse("A") == ".- .-.-"
        @test encode_to_morse("SOS") == "... --- ... .-.-"
        @test encode_to_morse("HELLO") == ".... . .-.. .-.. --- .-.-"
        
        # Test with spaces (word separation)
        result = encode_to_morse("HELLO WORLD")
        @test occursin("/", result)
        @test endswith(result, ".-.-")
        
        # Test numbers
        @test encode_to_morse("123") == ".---- ..--- ...-- .-.-"
        
        # Test special characters
        @test encode_to_morse("!") == "-.-.-- .-.-"
        
        # Test unknown character
        @test occursin("#", encode_to_morse("~"))
        
        # Test empty string
        @test encode_to_morse("") == ""
        
        # Test case insensitivity
        @test encode_to_morse("hello") == encode_to_morse("HELLO")
    end
    
    @testset "Decoding from Morse" begin
        # Test basic decoding
        @test decode_from_morse(".- .-.-") == "A"
        @test decode_from_morse("... --- ...") == "SOS"
        @test decode_from_morse(".... . .-.. .-.. ---") == "HELLO"
        
        # Test with word separator
        @test decode_from_morse(".... . .-.. .-.. --- / .-- --- .-. .-.. -..") == "HELLO WORLD"
        
        # Test with end marker
        @test decode_from_morse(".- .-.-") == "A"
        @test decode_from_morse(".- / -... .-.-") == "A B"
        
        # Test numbers
        @test decode_from_morse(".---- ..--- ...--") == "123"
    end
    
    @testset "Round-trip conversion" begin
        # Test that encoding then decoding returns original text
        test_strings = ["HELLO", "WORLD", "SOS", "TEST 123", "HELLO WORLD"]
        
        for text in test_strings
            morse = encode_to_morse(text)
            decoded = decode_from_morse(morse)
            @test decoded == text
        end
    end
end

println("All MorseCodec tests passed!")
