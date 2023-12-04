def trouveNum(line)
    numeroTicket = line.split(":")[1]
    numGagnant = numeroTicket.split('|')[1]
    num= numeroTicket.split('|')[0]
    tabnum = num.split(" ")
    tabnumGagnant = numGagnant.split(" ")
    nbWin=0
    sum = 1
    tabnum.each do |n|
        nombre_occurrences = tabnumGagnant.count(n)
        if(nombre_occurrences > 1) then puts nbLigne end
        while(nombre_occurrences > 0)
                nbWin+= 1
                nombre_occurrences-=1
        end
    end
    return nbWin
end
fichier = File.open("day_4_rsc.txt",'r'); # Ouverture du document
totVal  = 0
content = fichier.read # Lecture du document
nbLigne = 0 ;
carte_val = []
#Remplissage tableau
content.each_line do |line|
    carte_val.push([line,1])
    nbLigne+=1
end

i=0
carte_val.each do |carte_struct|
  # Pour chaque carte
  n = trouveNum(carte_struct[0])
  carte_struct[1].times do
    e= 1
    f = n
    #ajout val carte
    while(f != 0)
         if (i+e < carte_val.length) then carte_val[i+e][1] +=1 end
        e +=1
        f-=1
    end
  end
  i+=1
end
#calcul total
carte_val.each do |carte_struct|
    totVal += carte_struct[1]
end
puts "La valeur total est de #{totVal} !"
