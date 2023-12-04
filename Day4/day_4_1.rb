fichier = File.open("day_4_rsc.txt",'r'); # Ouverture du document
totVal  = 0
content = fichier.read # Lecture du document
nbLigne = 0 ;
content.each_line do |line|
    nbLigne+=1
    # Pour chaque ligne
    numeroTicket = line.split(":")[1]
    numGagnant = numeroTicket.split('|')[1]
    num= numeroTicket.split('|')[0]
    tabnum = num.split(" ")
    tabnumGagnant = numGagnant.split(" ")
    nbWin=0
    sum = 1
    #Pour chaque carte
    tabnum.each do |n|
        nombre_occurrences = tabnumGagnant.count(n)
        while(nombre_occurrences > 0) #gagnant ?
                nbWin+= 1
                nombre_occurrences-=1
        end
    end
    if(nbWin > 0) then  totVal += 2**(nbWin-1)  end # Si gagnant ajouter la valeur



end

puts "La valeur total est de #{totVal} !"
