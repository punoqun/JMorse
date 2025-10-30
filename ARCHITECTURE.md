# JMorse Architecture

This document describes the architecture of JMorse and how it follows SOLID principles.

## SOLID Principles Applied

### Single Responsibility Principle (SRP)

Each module has a single, well-defined responsibility:

- **MorseCodec.jl**: Only responsible for encoding text to Morse code and decoding Morse code to text
- **AudioPlayer.jl**: Only responsible for playing Morse code as audio beeps
- **MorseGUI.jl**: Only responsible for creating and managing the GUI
- **main.jl**: Only responsible for coordinating the modules

### Open/Closed Principle (OCP)

The system is open for extension but closed for modification:

- New encoding/decoding algorithms can be added without modifying existing code
- New audio playback methods can be added by extending the AudioPlayer module
- GUI themes can be changed through CSS without modifying the core logic

### Liskov Substitution Principle (LSP)

While Julia doesn't have traditional classes, we use duck typing and function contracts:

- All codec functions accept `AbstractString` types, making them substitutable
- Callbacks in the GUI use generic `Function` types, allowing any compatible function

### Interface Segregation Principle (ISP)

Each module exposes only the functions needed by its clients:

- **MorseCodec**: exports only `encode_to_morse` and `decode_from_morse`
- **AudioPlayer**: exports only `play_morse_code`
- **MorseGUI**: exports only `create_and_show_gui`

### Dependency Inversion Principle (DIP)

High-level modules don't depend on low-level modules; both depend on abstractions:

- The GUI doesn't know about MorseCodec or AudioPlayer implementations
- It receives callback functions as parameters (abstractions)
- This allows easy testing and module replacement

## Module Structure

```
JMorse/
├── src/
│   ├── MorseCodec.jl      # Encoding/Decoding logic
│   ├── AudioPlayer.jl      # Audio playback logic
│   ├── MorseGUI.jl         # GUI implementation
│   └── main.jl             # Application entry point
├── test/
│   └── test_morse_codec.jl # Unit tests
├── JMorse.jl               # Executable wrapper
└── README.md               # User documentation
```

## Data Flow

```
User Input → GUI → MorseCodec.encode_to_morse() → Morse Output
Morse Input → GUI → MorseCodec.decode_from_morse() → Text Output
Play Button → GUI → AudioPlayer.play_morse_code() → Audio Output
```

## Benefits of This Architecture

1. **Testability**: Each module can be tested independently
2. **Maintainability**: Changes to one module don't affect others
3. **Extensibility**: New features can be added without breaking existing code
4. **Readability**: Clear separation of concerns makes the code easy to understand
5. **Reusability**: Modules can be used in other projects

## Future Extensions

The architecture supports easy addition of:

- Different Morse code standards (International, American, etc.)
- Multiple audio output formats
- Network transmission of Morse code
- Different GUI themes
- Command-line interface
- Web interface
