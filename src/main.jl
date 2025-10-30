"""
JMorse - Main entry point
Coordinates all modules following Dependency Inversion Principle
"""

# Add src directory to load path
push!(LOAD_PATH, @__DIR__)

# Import modules
include("MorseCodec.jl")
include("AudioPlayer.jl")
include("MorseGUI.jl")

using .MorseCodec
using .AudioPlayer
using .MorseGUI
using Gtk

"""
Main application entry point
"""
function main()
    println("Starting JMorse - Morse Code Translator...")
    
    # Create GUI with callback functions (Dependency Inversion)
    # The GUI doesn't know about the implementation details of encoding/decoding/playing
    win = create_and_show_gui(
        encode_to_morse,      # Encoding callback
        decode_from_morse,    # Decoding callback
        play_morse_code       # Playing callback
    )
    
    # Start GTK main loop
    if !isinteractive()
        Gtk.gtk_main()
    end
end

# Run main if executed directly
if abspath(PROGRAM_FILE) == @__FILE__
    main()
end
