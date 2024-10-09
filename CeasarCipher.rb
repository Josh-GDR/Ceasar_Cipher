def charToInt(char)
  char.ord.to_i
end

def wasItGreater(initialChar, char)
  initialChar.between?(charToInt('A'), charToInt('Z')) && char.to_i > charToInt('Z')
end

def wasItLesser(initialChar, char)
  initialChar.between?(charToInt('a'), charToInt('z')) && char.to_i > charToInt('z')
end

def getRemnant(limitChar, actualChar)
  actualChar - limitChar
end

def letter?(char)
  char.between?(charToInt('a'), charToInt('z')) || char.between?(charToInt('A'), charToInt('Z'))
end

def getCesarCipherOf(text, morph)
  text.each_byte.map do |char|
    initialChar = char.to_i
    #Just checking if it's an actual char, something between ['a', 'z'] or ['A', 'Z']
    if (letter?(initialChar))
      char += morph

      if (wasItLesser(initialChar, char))
        char = (charToInt('a') - 1) + getRemnant(charToInt('z'), charToInt(char))
      elsif (wasItGreater(initialChar, char))
        char = (charToInt('A') - 1) + getRemnant(charToInt('Z'), charToInt(char))
      end
    
    end
    char.chr
  end
end

#include <iostream>

p getCesarCipherOf("What a string!", 5).join;
