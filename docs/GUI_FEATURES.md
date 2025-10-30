# JMorse GUI Features

## Overview

The JMorse GUI provides a modern, dark-themed interface for Morse code translation with bidirectional conversion and audio playback.

## GUI Components

### Window Layout

```
┌─────────────────────────────────────────────────────┐
│  JMorse - Morse Code Translator                     │
├─────────────────────────────────────────────────────┤
│                                                      │
│  JMorse - Morse Code Translator                     │
│                                                      │
│  Text:                                              │
│  ┌───────────────────────────────────────────────┐ │
│  │                                                │ │
│  │  [Editable text input area]                   │ │
│  │  Type text here...                            │ │
│  │                                                │ │
│  └───────────────────────────────────────────────┘ │
│                                                      │
│  ┌───────────────────────────────────────────────┐ │
│  │      ▶ Play Morse Code (Beep)                 │ │
│  └───────────────────────────────────────────────┘ │
│                                                      │
│  Morse Code:                                        │
│  ┌───────────────────────────────────────────────┐ │
│  │                                                │ │
│  │  [Editable morse output area]                 │ │
│  │  Morse code appears here...                   │ │
│  │                                                │ │
│  └───────────────────────────────────────────────┘ │
│                                                      │
│  Type text above or morse code below.               │
│  Changes update automatically.                      │
│                                                      │
└─────────────────────────────────────────────────────┘
```

## Features

### 1. Dark Theme Design

- **Background**: Dark gray (#2b2b2b) for reduced eye strain
- **Text**: Light gray (#e8e8e8) for readability
- **Input Fields**: Darker gray (#3c3f41) with monospace font
- **Buttons**: Blue gradient (#4a90d9) with hover effects
- **Borders**: Subtle borders for visual separation

### 2. Bidirectional Conversion

- **Text → Morse**: Type in the text field, morse code appears automatically
- **Morse → Text**: Type in the morse field, text appears automatically
- Both fields are fully editable
- Changes sync in real-time

### 3. Audio Playback

- **Play Button**: Click to hear the morse code as beeps
- **Visual Feedback**: Button changes to "⏸ Playing..." during playback
- **Asynchronous**: Doesn't block the GUI during playback

### 4. User Experience

- **Scrollable Fields**: Long text/morse code can be scrolled
- **Word Wrapping**: Automatic text wrapping for better readability
- **Monospace Font**: Clear distinction between dots and dashes
- **Responsive Layout**: Clean, organized interface

## Color Scheme (Dark Theme)

| Element | Color | Description |
|---------|-------|-------------|
| Window Background | #2b2b2b | Main dark background |
| Text | #e8e8e8 | Light text for readability |
| Input Background | #3c3f41 | Slightly lighter for inputs |
| Button | #4a90d9 | Blue accent color |
| Button Hover | #5b9fea | Lighter blue on hover |
| Borders | #555555 | Subtle gray borders |

## Interaction Flow

1. **Startup**: User launches JMorse.jl
2. **Enter Text**: User types "HELLO" in text field
3. **Auto Convert**: Morse code ".... . .-.. .-.. --- .-.-" appears instantly
4. **Play Audio**: User clicks play button to hear the beeps
5. **Edit Morse**: User can edit morse code directly
6. **Sync Back**: Text field updates to match morse changes

## Technical Implementation

- **Framework**: Gtk.jl for cross-platform GUI
- **Styling**: CSS for theming
- **Event Handling**: Signal connections for real-time updates
- **Thread Safety**: Ref flags prevent recursive updates
- **Async Audio**: Non-blocking audio playback

## Accessibility

- Clear visual hierarchy
- High contrast text
- Large interactive elements
- Keyboard navigation support (via Gtk)
