function to_morse(input)
    words = split(input, ' ')
    morse = ""
    for word in words
        for i in word
            i = uppercase(i)
            if i == 'A'
                morse = morse * ".-"
            elseif i == 'B'
                morse = morse * "-..."
            elseif i == 'C'
                morse = morse * "-.-."
            elseif i == 'D'
                morse = morse * "-.."
            elseif i == 'E'
                morse = morse * "."
            elseif i == 'F'
                morse = morse * "..-."
            elseif i == 'G'
                morse = morse * "--."
            elseif i == 'H'
                morse = morse * "...."
            elseif i == 'I'
                morse = morse * ".."
            elseif i == 'J'
                morse = morse * ".---"
            elseif i == 'K'
                morse = morse * "-.-"
            elseif i == 'L'
                morse = morse * ".-.."
            elseif i == 'M'
                morse = morse * "--"
            elseif i == 'N'
                morse = morse * "-."
            elseif i == 'O'
                morse = morse * "---"
            elseif i == 'P'
                morse = morse * ".--."
            elseif i == 'Q'
                morse = morse * "--.-"
            elseif i == 'R'
                morse = morse * ".-."
            elseif i == 'S'
                morse = morse * "..."
            elseif i == 'T'
                morse = morse * "-"
            elseif i == 'U'
                morse = morse * "..-"
            elseif i == 'V'
                morse = morse * "...-"
            elseif i == 'W'
                morse = morse * ".--"
            elseif i == 'X'
                morse = morse * "-..-"
            elseif i == 'Y'
                morse = morse * "-.--"
            elseif i == 'Z'
                morse = morse * "--.."
            elseif i == '0'
                morse = morse * "-----"
            elseif i == '1'
                morse = morse * ".----"
            elseif i == '2'
                morse = morse * "..---"
            elseif i == '3'
                morse = morse * "...--"
            elseif i == '4'
                morse = morse * "....-"
            elseif i == '5'
                morse = morse * "....."
            elseif i == '6'
                morse = morse * "-...."
            elseif i == '7'
                morse = morse * "--..."
            elseif i == '8'
                morse = morse * "---.."
            elseif i == '9'
                morse = morse * "----."
            elseif i == '&'
                morse = morse * ".-..."
            elseif i == '\''
                morse = morse * ".----."
            elseif i == '@'
                morse = morse * ".--.-."
            elseif i == ')'
                morse = morse * "-.--.-"
            elseif i == '('
                morse = morse * "-.--."
            elseif i == ':'
                morse = morse * "---..."
            elseif i == ','
                morse = morse * "--..--"
            elseif i == '='
                morse = morse * "-...-"
            elseif i == '!'
                morse = morse * "-.-.--"
            elseif i == '.'
                morse = morse * ".-.-.-"
            elseif i == '-'
                morse = morse * "-....-"
            elseif i == '+'
                morse = morse * ".-.-."
            elseif i == '\"'
                morse = morse * ".-..-."
            elseif i == '?'
                morse = morse * "..--.."
            elseif i == '/'
                morse = morse * "-..-."
            else
            end
            morse = morse * " "
        end
        morse = morse * "/ "
    end
    println(morse)
end

while true
    println("Please enter the phrase you want to convert to morse code: ")
    sleep(10)
    str = chomp(readline())
    to_morse(str)
end
