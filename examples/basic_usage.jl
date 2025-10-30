"""
Basic usage examples for JMorse modules
"""

push!(LOAD_PATH, joinpath(@__DIR__, "..", "src"))
include("../src/MorseCodec.jl")
include("../src/AudioPlayer.jl")

using .MorseCodec
using .AudioPlayer

println("=== JMorse Basic Usage Examples ===\n")

# Example 1: Encode text to Morse code
println("Example 1: Encoding text to Morse")
text = "HELLO WORLD"
morse = encode_to_morse(text)
println("Text: $text")
println("Morse: $morse")
println()

# Example 2: Decode Morse code to text
println("Example 2: Decoding Morse to text")
morse_input = "... --- ... / .-- --- .-. .-.. -.."
decoded = decode_from_morse(morse_input)
println("Morse: $morse_input")
println("Text: $decoded")
println()

# Example 3: Round-trip conversion
println("Example 3: Round-trip conversion")
original = "JULIA IS AWESOME"
encoded = encode_to_morse(original)
decoded = decode_from_morse(encoded)
println("Original: $original")
println("Encoded: $encoded")
println("Decoded: $decoded")
println("Match: $(original == decoded)")
println()

# Example 4: Handling special characters
println("Example 4: Special characters and numbers")
special = "SOS 123!"
morse_special = encode_to_morse(special)
println("Text: $special")
println("Morse: $morse_special")
println()

# Example 5: Play Morse code (uncomment to hear beeps)
# println("Example 5: Playing Morse code")
# println("Playing SOS...")
# play_morse_code("... --- ...")
# println("Done!")

println("=== Examples completed ===")
