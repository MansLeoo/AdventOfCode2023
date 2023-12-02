fichier = File.open("day_2_rsc.txt",'r'); # Ouverture du document
totVal  = 0
content = fichier.read # Lecture du document
gameNb = 1
content.each_line do |line|
    # Pour chaque ligne/jeux
    lstPart = line.split(";")
    couleurs = [0,0,0]
    blue =[]
    red = []
    green = []
    lstPart.each do |part|
        # Pour chaque Manche
        #Recuperer les valeurs des couleurs
        lstCouleur=part.split(",")
        lstCouleur.each do |colour|
            if(colour.include?(":")) then colour = colour.split(":")[1] end
            if(colour.include?("blue"))
                val = colour.to_i
                blue += [val]
            end
            if(colour.include?("green"))
                val = colour.to_i
                green+= [val]
            end
            if(colour.include?("red"))
                val = colour.to_i
                red += [val]
            end
        end
    end
    #Calcul power
    totVal+= blue.max * red.max * green.max
    gameNb += 1
end

puts "La valeur total est de #{totVal} !"
