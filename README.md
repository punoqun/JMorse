# JMorse - Morse Code Translator

A modern Morse code translator written in Julia with a beautiful dark-themed GUI.

## Features

- **Bidirectional Translation**: Convert text to Morse code and vice versa
- **Real-time Sync**: Changes in either field automatically update the other
- **Audio Playback**: Play Morse code as audio beeps
- **Modern Dark Theme**: Beautiful, eye-friendly interface

## Architecture

The project follows SOLID principles with a modular design:

- **MorseCodec.jl**: Handles encoding/decoding (Single Responsibility)
- **AudioPlayer.jl**: Handles audio playback (Single Responsibility)
- **MorseGUI.jl**: GUI implementation (Open/Closed, Dependency Inversion)
- **main.jl**: Application entry point (coordinates modules)

## Requirements

- Julia 1.6 or higher
- Gtk.jl package

## Installation

1. Clone the repository:
```bash
git clone https://github.com/punoqun/JMorse.git
cd JMorse
```

2. Install dependencies:
```julia
using Pkg
Pkg.add("Gtk")
```

## Usage

Run the application:
```bash
julia JMorse.jl
```

Or from Julia REPL:
```julia
include("src/main.jl")
main()
```

## Testing

Run the test suite:
```bash
julia test/test_morse_codec.jl
```

## How It Works

1. **Text Input**: Type any text in the top field
2. **Automatic Conversion**: Morse code appears instantly in the bottom field
3. **Bidirectional Editing**: Edit either field and the other updates automatically
4. **Play Audio**: Click the "Play Morse Code" button to hear the beeps

## Morse Code Format

- Characters are separated by spaces
- Words are separated by ` / `
- End marker: `.-.-`
- Unknown characters: `#`

## License

This project is licensed under the GNU General Public License v3.0 - see the LICENSE file for details.
