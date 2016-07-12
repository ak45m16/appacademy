#implementation of a caesar cipher in Ruby

def caesar_cipher(string, number)
  jelly=string.split("")
  cipher=[]
  jelly.each do |char| #change letters into ASCII number codes
    if char!=" " && char!="!" && char!="." && char!="?" && char!=","
      ord_char=char.ord
      end_char=ord_char+number #change letters into ASCII number codes
      if end_char>122
        cipher << (96+(end_char-122)) #loop back to a if past z
      elsif end_char>90 && end_char<97
        cipher << (64+(end_char-90)) #loop back to A if past Z
      else
        cipher<<end_char
      end
    else
      cipher<<char
    end
  end
  normal=[]
  cipher.each do |num|
    if num!=" " && num!="!" && num!="." && num!="?" && num!=","
      normal << num.chr #change ASCII number codes back to letters
    else
      normal << num
    end
  end
  belly=normal.join("")
  return belly
end

