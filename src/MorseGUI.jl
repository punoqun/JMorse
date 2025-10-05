"""
MorseGUI module - GUI implementation with dark theme
Follows Open/Closed and Dependency Inversion Principles
"""
module MorseGUI

using Gtk
using Gtk.ShortNames

export create_and_show_gui

# Dark theme color constants
const BG_COLOR = "#2b2b2b"
const FG_COLOR = "#e8e8e8"
const INPUT_BG = "#3c3f41"
const BUTTON_BG = "#4a90d9"
const BUTTON_HOVER = "#5b9fea"

"""
    create_and_show_gui(encode_callback::Function, decode_callback::Function, play_callback::Function)

Create and display the main GUI window.
Takes callbacks for encoding, decoding, and playing morse code.
Follows Dependency Inversion Principle by depending on abstractions (functions).
"""
function create_and_show_gui(encode_callback::Function, decode_callback::Function, play_callback::Function)
    # Create main window
    win = GtkWindow("JMorse - Morse Code Translator", 700, 500)
    
    # Apply CSS for dark theme
    apply_dark_theme()
    
    # Create main vertical box
    main_vbox = GtkBox(:v, 10)
    set_gtk_property!(main_vbox, :margin, 20)
    push!(win, main_vbox)
    
    # Title label
    title = GtkLabel("")
    set_gtk_property!(title, :use_markup, true)
    markup_text = "<span font='16' weight='bold'>JMorse - Morse Code Translator</span>"
    GAccessor.markup(title, markup_text)
    push!(main_vbox, title)
    
    # Text input section
    text_label = GtkLabel("Text:")
    set_gtk_property!(text_label, :halign, Gtk.GtkAlign(1))  # LEFT align
    push!(main_vbox, text_label)
    
    # Create scrolled window for text input
    text_scroll = GtkScrolledWindow()
    set_gtk_property!(text_scroll, :min_content_height, 120)
    text_input = GtkTextView()
    set_gtk_property!(text_input, :wrap_mode, Gtk.GtkWrapMode(2))  # WORD wrap
    set_gtk_property!(text_input, :name, "text-view")
    text_buffer = GAccessor.buffer(text_input)
    push!(text_scroll, text_input)
    push!(main_vbox, text_scroll)
    
    # Play button
    play_button = GtkButton("▶ Play Morse Code (Beep)")
    set_gtk_property!(play_button, :name, "play-button")
    push!(main_vbox, play_button)
    
    # Morse code output section
    morse_label = GtkLabel("Morse Code:")
    set_gtk_property!(morse_label, :halign, Gtk.GtkAlign(1))  # LEFT align
    push!(main_vbox, morse_label)
    
    # Create scrolled window for morse output
    morse_scroll = GtkScrolledWindow()
    set_gtk_property!(morse_scroll, :min_content_height, 120)
    morse_output = GtkTextView()
    set_gtk_property!(morse_output, :wrap_mode, Gtk.GtkWrapMode(2))  # WORD wrap
    set_gtk_property!(morse_output, :name, "text-view")
    morse_buffer = GAccessor.buffer(morse_output)
    push!(morse_scroll, morse_output)
    push!(main_vbox, morse_scroll)
    
    # Info label
    info = GtkLabel("Type text above or morse code below. Changes update automatically.")
    set_gtk_property!(info, :halign, Gtk.GtkAlign(2))  # CENTER align
    push!(main_vbox, info)
    
    # Flag to prevent recursive updates
    updating = Ref(false)
    
    # Connect text input changes to morse output
    signal_connect(text_buffer, "changed") do widget
        if !updating[]
            updating[] = true
            try
                text = get_gtk_property(text_buffer, :text, String)
                morse = encode_callback(text)
                set_gtk_property!(morse_buffer, :text, morse)
            finally
                updating[] = false
            end
        end
    end
    
    # Connect morse output changes to text input
    signal_connect(morse_buffer, "changed") do widget
        if !updating[]
            updating[] = true
            try
                morse = get_gtk_property(morse_buffer, :text, String)
                text = decode_callback(morse)
                set_gtk_property!(text_buffer, :text, text)
            finally
                updating[] = false
            end
        end
    end
    
    # Connect play button
    signal_connect(play_button, "clicked") do widget
        morse = get_gtk_property(morse_buffer, :text, String)
        @async begin
            try
                set_gtk_property!(play_button, :sensitive, false)
                set_gtk_property!(play_button, :label, "⏸ Playing...")
                play_callback(morse)
                set_gtk_property!(play_button, :label, "▶ Play Morse Code (Beep)")
            catch e
                @warn "Error playing morse code: $e"
                set_gtk_property!(play_button, :label, "▶ Play Morse Code (Beep)")
            finally
                set_gtk_property!(play_button, :sensitive, true)
            end
        end
    end
    
    # Handle window close
    signal_connect(win, "destroy") do widget
        Gtk.exit()
    end
    
    # Show all widgets
    showall(win)
    
    return win
end

"""
    apply_dark_theme()

Apply CSS styling for dark theme to the application.
"""
function apply_dark_theme()
    css_provider = CssProviderLeaf(data="""
        window {
            background-color: $(BG_COLOR);
            color: $(FG_COLOR);
        }
        
        label {
            color: $(FG_COLOR);
            padding: 5px;
        }
        
        textview {
            background-color: $(INPUT_BG);
            color: $(FG_COLOR);
            border-radius: 5px;
            padding: 10px;
            font-family: monospace;
            font-size: 12pt;
        }
        
        textview text {
            background-color: $(INPUT_BG);
            color: $(FG_COLOR);
        }
        
        button {
            background-image: linear-gradient(to bottom, $(BUTTON_BG), #3a7abd);
            color: white;
            border-radius: 5px;
            padding: 10px;
            font-weight: bold;
            font-size: 11pt;
            border: 1px solid #2d6ca3;
        }
        
        button:hover {
            background-image: linear-gradient(to bottom, $(BUTTON_HOVER), $(BUTTON_BG));
        }
        
        button:active {
            background-image: linear-gradient(to bottom, #3a7abd, $(BUTTON_BG));
        }
        
        button:disabled {
            background-image: linear-gradient(to bottom, #555555, #444444);
            color: #999999;
        }
        
        scrolledwindow {
            border: 1px solid #555555;
            border-radius: 5px;
        }
    """)
    
    screen = Gtk.GAccessor.screen(GtkWindow())
    push!(Gtk.GAccessor.style_context(screen), css_provider, 600)
end

end # module
