using Gtk



win = GtkWindow("JMorse",600,400)
vbox = GtkBox(:v)  # :h makes a horizontal layout, :v a vertical layout
push!(win, vbox)
ent = GtkEntry()
set_gtk_property!(ent,:text,"Please enter the phrase you want to convert to morse code: ")
str = get_gtk_property(ent,:text,String)
translate = GtkButton("Translate!")
id = signal_connect(translate, "clicked") do widget
    str = get_gtk_property(ent,:text,String)
     to_morse(str)
end
result = GtkLabel("")
info = GtkLabel("Type your message to the top box, either normal letters, numbers and punctuation or Morse code using '.' for a dot, '-'
for a dash, separating letters by spaces and words by '/'. \n Also the unknown characters will be shown as #.")

GAccessor.selectable(result,true)
GAccessor.line_wrap(result,true)
push!(vbox, ent)
push!(vbox, translate)
push!(vbox, result)
push!(vbox, info)

showall(win)

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
                morse = morse * "#"
            end
            morse = morse * " "
        end
        morse = morse * "/ "
    end
    morse *= ".-.-"  #this is the new line (end)
    GAccessor.text(result,morse)
end
#while true
#    to_morse(str)
#end
