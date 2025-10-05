"""
MorseCodec module - Handles text to morse code conversion and vice versa
Follows Single Responsibility Principle
"""
module MorseCodec

export encode_to_morse, decode_from_morse

# Morse code mapping dictionary
const CHAR_TO_MORSE = Dict(
    'A' => ".-",    'B' => "-...",  'C' => "-.-.",  'D' => "-..",
    'E' => ".",     'F' => "..-.",  'G' => "--.",   'H' => "....",
    'I' => "..",    'J' => ".---",  'K' => "-.-",   'L' => ".-..",
    'M' => "--",    'N' => "-.",    'O' => "---",   'P' => ".--.",
    'Q' => "--.-",  'R' => ".-.",   'S' => "...",   'T' => "-",
    'U' => "..-",   'V' => "...-",  'W' => ".--",   'X' => "-..-",
    'Y' => "-.--",  'Z' => "--..",
    '0' => "-----", '1' => ".----", '2' => "..---", '3' => "...--",
    '4' => "....-", '5' => ".....", '6' => "-....", '7' => "--...",
    '8' => "---..", '9' => "----.",
    '&' => ".-...", '\'' => ".----.", '@' => ".--.-.", ')' => "-.--.-",
    '(' => "-.--.", ':' => "---...", ',' => "--..--", '=' => "-...-",
    '!' => "-.-.--", '.' => ".-.-.-", '-' => "-....-", '+' => ".-.-.",
    '"' => ".-..-.", '?' => "..--..", '/' => "-..-."
)

# Reverse mapping for decoding
const MORSE_TO_CHAR = Dict(v => k for (k, v) in CHAR_TO_MORSE)

"""
    encode_to_morse(text::AbstractString) -> String

Convert text to Morse code.
Characters are separated by spaces, words by ' / ', and end with ' .-.-'
Unknown characters are represented as '#'
"""
function encode_to_morse(text::AbstractString)
    words = split(text, ' ')
    morse_parts = String[]
    
    for word in words
        word_morse = String[]
        for char in word
            upper_char = uppercase(char)
            if haskey(CHAR_TO_MORSE, upper_char)
                push!(word_morse, CHAR_TO_MORSE[upper_char])
            else
                push!(word_morse, "#")
            end
        end
        if !isempty(word_morse)
            push!(morse_parts, join(word_morse, " "))
        end
    end
    
    result = join(morse_parts, " / ")
    if !isempty(result)
        result *= " .-.-"
    end
    return result
end

"""
    decode_from_morse(morse::AbstractString) -> String

Convert Morse code back to text.
Expects format: characters separated by spaces, words by ' / '
"""
function decode_from_morse(morse::AbstractString)
    # Remove end marker if present
    morse = replace(morse, r"\s*\.-\.-\s*$" => "")
    
    # Split by word separator
    words = split(morse, " / ")
    text_parts = String[]
    
    for word in words
        chars = split(strip(word), " ")
        word_text = ""
        for char_morse in chars
            char_morse = strip(char_morse)
            if isempty(char_morse)
                continue
            elseif char_morse == "#"
                word_text *= "#"
            elseif haskey(MORSE_TO_CHAR, char_morse)
                word_text *= MORSE_TO_CHAR[char_morse]
            else
                word_text *= "?"
            end
        end
        if !isempty(word_text)
            push!(text_parts, word_text)
        end
    end
    
    return join(text_parts, " ")
end

end # module
