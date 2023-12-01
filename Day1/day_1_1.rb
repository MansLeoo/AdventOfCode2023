fichier = File.open("day_1_1_rcs.txt",'r'); # Ouverture du document
tot = 0 ;
content = fichier.read # Lecture du document
content.each_line do |line| # Parcours du document
    tab= []
    line.each_char do |carac|
        if (carac =~/[[:digit:]]/) 
            #Il s'agit d'un chiffre
            number = carac.to_i 
            tab+=[number] 
        end
    end
(tab.length >= 2) ? (tot+=(tab[0]*10 + tab[tab.length-1])) :( (tab.length == 1) ? (tot += tab[0]*11) : nil ) # Ajout des valeurs
end
puts "la valeur total est de #{tot} !" # Affichage du total