def chiffrePuis(tab)
  puissance = tab.length - 1
  nombre = 0
tab.each do |n|
  nombre += n * (10**puissance)
  puissance=puissance-1
end
nombre
end

def rechercheIntervalle(line)
  lstIntervalle = []
  inter = []
  lstNb = []
  nb = []
  debut = false
  for i in (0..line.length - 1)
    if(line[i] =~/[[:digit:]]/ )
      unless debut
         inter+=[i]
         debut = true
        end
      nb += [line[i].to_i]
    else
      if(debut ==true)
        inter +=[i-1]
        debut = false
        lstIntervalle.push(inter)
        lstNb.push(nb)
        nb = []
        inter = []
      end
    end
  end
  # Cas ou la ligne finis par un chiffre
  if(line.length - 1 =~/[[:digit:]]/)
    if(debut ==true)
      inter +=[i]
      debut = false
      lstIntervalle.push(inter)
      lstNb.push(nb)
      nb = []
      inter = []
    end
  end
  [lstNb,lstIntervalle]
end



fichier = File.open("day_3_rsc.txt",'r'); # Ouverture du document
totVal  = 0
content = fichier.read # Lecture du document
previousLine=""
txt = []
content.each_line do |line|
  txt.push(line)
end
nbLigne = 0
total = 0
inter = []
nb= []
symboles = ["/","*","#","$","=","%","@","&","+","-"] # def des symboles présent dans le fichier txt
txt.each do |line|
  indice =0

  # Pour chaque Ligne
  func = rechercheIntervalle(line)
  nb = func[0]
  inter = func[1]
  nb.each do |n|
    trouve = false
    #Convert chiffre
    nombre = chiffrePuis(n)
    #verif adjacence
    ligneEffect = nbLigne
    if(inter[indice][0] == 0) then inter[indice][0] = 1 end
    if(inter[indice][1] == line.length-1) then inter[indice][1] = line.length-2 end
    symboles.each do |sym|
      if(txt[nbLigne][(inter[indice][0] - 1)..(inter[indice][1]+1)].include?(sym)  && trouve == false)

          total+=nombre
          trouve = true
      end
      if(nbLigne != txt.length-1)
        if(txt[nbLigne + 1][(inter[indice][0] - 1)..(inter[indice][1]+1)].include?(sym)  && trouve == false)
          total+=nombre
          trouve = true
        end
      end
      if(nbLigne != 0)
        if(txt[nbLigne-1][(inter[indice][0] - 1)..(inter[indice][1]+1)].include?(sym)  && trouve == false)
          total+=nombre
          trouve = true
        end
      end
    end

    indice+=1
  end
  nbLigne +=1
end
puts "la valeur total est de #{total} !"
