fichier = File.open("day_2_rsc.txt",'r'); # Ouverture du document
totVal  = 0
content = fichier.read # Lecture du document
gameNb = 1
content.each_line do |line|
    # Pour chaque ligne/jeux
    lstPart = line.split(";")
    couleurs = [0,0,0]
    valide =true
    lstPart.each do |part|
        # Pour chaque Manche
        #Recuperer les valeurs des couleurs
        lstCouleur=part.split(",")
        lstCouleur.each do |colour|
            if(colour.include?(":")) then colour = colour.split(":")[1] end
            if(colour.include?("blue"))
                val = colour.to_i
                if (val > 14) then valide = false end
            end
            if(colour.include?("green"))
                val = colour.to_i
                if (val > 13) then valide = false end
            end
            if(colour.include?("red"))
                val = colour.to_i
                if (val > 12) then valide = false end
            end
        end
    end
    if (valide)
        totVal+= gameNb
    end
    gameNb += 1
end

puts "La valeur total est de #{totVal} !"
