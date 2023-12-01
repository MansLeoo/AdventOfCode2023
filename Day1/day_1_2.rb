def recupNb(line,a,b)
    number = line[a..b]
    if number.include?("one")
        return 1
    end
    if number.include?("two")
        return 2
    end
    if number.include?("three")
        return 3
    end
    if number.include?("four")
        return 4
    end
    if number.include?("five")
        return 5
    end
    if number.include?("six")
        return 6
    end
    if number.include?("seven")
        return 7
    end
    if number.include?("eight")
        return 8
    end
    if number.include?("nine")
        return 9
    end
    return 0
    end


fichier = File.open("day_1_2_rcs.txt",'r'); # Ouverture du document
tot = 0 
content = fichier.read # Lecture du document

content.each_line do |line| # Parcours du document
    a = 0 
    b = 0
    nombres = []
    add=0
    while( b != line.length) 
        if (line[b] =~/[[:digit:]]/)
            #Il s'agit d'un chiffre
            number = line[b].to_i
            if(number != 0) then nombres+=[number] end
            b+=1
            a+=1
        else
            #Il s'agit d'une lettre
            nb = recupNb(line.chomp,a,b)
            if(nb !=0) 
                nombres+=[nb]
                a = b-1   
            end
            b+=1

            
        end
    end
#Calcul de la valeur de la ligne
(nombres.length >= 2) ? (add+=(nombres[0]*10 + nombres[-1])) :( (nombres.length == 1) ? (add += nombres[0]*11) : nil ) # Ajout des valeurs

tot+=add
end

puts "la valeur total est de #{tot} !"
