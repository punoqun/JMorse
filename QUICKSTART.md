# JMorse Quick Start Guide

Get started with JMorse in under 2 minutes!

## Prerequisites

- Julia 1.6 or higher
- Gtk.jl package

## Installation

### Step 1: Install Julia
If you don't have Julia installed, download it from [julialang.org](https://julialang.org/downloads/)

### Step 2: Install Gtk Package
```julia
# Open Julia REPL and run:
using Pkg
Pkg.add("Gtk")
```

### Step 3: Clone the Repository
```bash
git clone https://github.com/punoqun/JMorse.git
cd JMorse
```

## Running JMorse

### Option 1: Run the GUI (Recommended)
```bash
julia JMorse.jl
```

This will open the GUI where you can:
- Type text in the top field to see Morse code
- Type Morse code in the bottom field to see text
- Click "Play Morse Code" to hear beeps

### Option 2: Use as a Library
```julia
# In Julia REPL or script
push!(LOAD_PATH, "src")
include("src/MorseCodec.jl")
using .MorseCodec

# Encode text to morse
morse = encode_to_morse("HELLO")
println(morse)  # Output: .... . .-.. .-.. --- .-.-

# Decode morse to text
text = decode_from_morse("... --- ...")
println(text)  # Output: SOS
```

## Quick Examples

### Example 1: Simple Translation
```julia
encode_to_morse("SOS")
# Result: "... --- ... .-.-"
```

### Example 2: Decode Morse
```julia
decode_from_morse(".... . .-.. .-.. ---")
# Result: "HELLO"
```

### Example 3: Round Trip
```julia
original = "JULIA"
morse = encode_to_morse(original)
back = decode_from_morse(morse)
# back == original ✓
```

## GUI Features

1. **Text Input Field** (Top)
   - Type any text here
   - Morse code appears below automatically

2. **Play Button** (Middle)
   - Plays the Morse code as beeps
   - Shows "Playing..." during playback

3. **Morse Output Field** (Bottom)
   - Shows the Morse code
   - Can also edit this to convert back to text

4. **Both Fields are Editable!**
   - Changes in either field update the other instantly

## Morse Code Format

- Characters separated by spaces: `.- -...`
- Words separated by ` / `: `.... . .-.. .-.. --- / ...`
- End marker: `.-.-`
- Unknown character: `#`

## Common Use Cases

### Translating a Message
1. Launch JMorse
2. Type your message in the text field
3. Read the Morse code from the bottom field

### Learning Morse Code
1. Type Morse patterns in the bottom field
2. See the translation in the top field
3. Click Play to hear how it sounds

### Decoding Morse
1. Paste Morse code in the bottom field
2. Read the decoded text in the top field

## Testing

Run the test suite to verify installation:
```bash
julia test/test_all.jl
```

Expected output:
```
Test Summary: Pass  Total  Time
All Tests      28     28   0.0s
✓ All Tests Passed!
```

## Troubleshooting

### "Gtk not found"
Install Gtk.jl: `julia -e 'using Pkg; Pkg.add("Gtk")'`

### "No display available"
Make sure you're running in a GUI environment (not headless/SSH without X forwarding)

### "Module not found"
Make sure you're in the JMorse directory when running the commands

## Next Steps

- Read [README.md](README.md) for detailed features
- Check [ARCHITECTURE.md](ARCHITECTURE.md) to understand the design
- Explore [examples/basic_usage.jl](examples/basic_usage.jl) for code examples
- View [docs/GUI_FEATURES.md](docs/GUI_FEATURES.md) for GUI details

## Need Help?

- Report issues on GitHub
- Check the documentation files
- Run the examples to see how it works

Enjoy using JMorse! 📡 dit-dah-dit
