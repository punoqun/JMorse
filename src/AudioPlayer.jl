"""
AudioPlayer module - Handles audio playback of Morse code
Follows Single Responsibility Principle
"""
module AudioPlayer

export play_morse_code

# Morse timing constants (in seconds)
const DOT_DURATION = 0.1
const DASH_DURATION = DOT_DURATION * 3
const SYMBOL_GAP = DOT_DURATION
const CHAR_GAP = DOT_DURATION * 3
const WORD_GAP = DOT_DURATION * 7
const FREQUENCY = 800  # Hz

"""
    play_morse_code(morse::AbstractString)

Play morse code as audio beeps.
Uses '.' for dot, '-' for dash, ' ' for character gap, '/' for word gap
"""
function play_morse_code(morse::AbstractString)
    try
        # Use a simple beep approach with shell commands
        # This is platform-dependent but works on most Unix systems
        for char in morse
            if char == '.'
                play_beep(DOT_DURATION)
                sleep(SYMBOL_GAP)
            elseif char == '-'
                play_beep(DASH_DURATION)
                sleep(SYMBOL_GAP)
            elseif char == ' '
                sleep(CHAR_GAP)
            elseif char == '/'
                sleep(WORD_GAP)
            end
        end
    catch e
        @warn "Could not play audio: $e"
    end
end

"""
    play_beep(duration::Float64)

Play a single beep for the specified duration.
Uses system beep or generates tone if available.
"""
function play_beep(duration::Float64)
    try
        # Try to use play command from sox if available
        if Sys.which("play") !== nothing
            run(pipeline(`play -n synth $duration sine $FREQUENCY`, devnull))
        elseif Sys.which("beep") !== nothing
            run(pipeline(`beep -f $FREQUENCY -l $(Int(duration*1000))`, devnull))
        elseif Sys.which("paplay") !== nothing
            # Generate a simple sine wave and play it with paplay
            run(pipeline(`paplay --raw --rate=44100 --format=s16le --channels=1`, devnull))
        else
            # Fallback: just print to indicate beep
            print(".")
            sleep(duration)
        end
    catch e
        # Silent fallback - just sleep for the duration
        sleep(duration)
    end
end

end # module
