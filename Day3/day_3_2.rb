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
    #Permet de retrouver les chiffres et leurs indices dans la ligne.
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
total  = 0
content = fichier.read # Lecture du document
txt = []
content.each_line do |line|
  txt.push(line)
end
nbLigne = 0
txt.each do |line|
  indice =0
  # Pour chaque Ligne
  if (nbLigne != 0 && nbLigne != txt.length-1)
    for i in (0..line.length - 1)
      if(line[i] == "*" )
        # Recuperation de l'intervalle de l'étoile
        if(i == 0) then intervalleEtoile = [i,i,i+1] end
        if(i == line.length-1)
          intervalleEtoile = [i-1,i,i]
        else
          intervalleEtoile = [i-1,i,i+1]
        end
        mult = []
        # Récupération de l'intervalle des nombres potentiellement adjacent a l'étoile.
        intervaleLigneMoins = rechercheIntervalle(txt[nbLigne -1])
        intervaleLignePlus = rechercheIntervalle(txt[nbLigne +1])
        intervale = rechercheIntervalle(txt[nbLigne])
        #Vérification adjacence Ligne inférieure
        indiceEtoile = 0
        intervaleLigneMoins[1].each do |ens|
          ens.each do |ine|
            if(intervalleEtoile.member?(ine))
              mult += [chiffrePuis(intervaleLigneMoins[0][indiceEtoile])]
              break
            end

          end
          indiceEtoile+=1

        end
        #Vérification adjacence Ligne de l'étoile
        indiceEtoile = 0
        intervale[1].each do |ens|
          ens.each do |ine|
            if(intervalleEtoile.member?(ine))
              mult += [chiffrePuis(intervale[0][indiceEtoile])]
              break
            end

          end
          indiceEtoile+=1
        end
        #Vérification adjacence Ligne supérieure
          indiceEtoile = 0
          intervaleLignePlus[1].each do |ens|
            ens.each do |ine|
              if(intervalleEtoile.member?(ine))
                mult += [chiffrePuis(intervaleLignePlus[0][indiceEtoile])]

                break
              end
            end
            indiceEtoile+=1

          end
          #Calcul total
          if(mult.length > 1)
            sum = 1
            mult.each do |num|
              sum = sum * num.to_i
            end
            total += sum
            mult = []
          end
      end

    end
  end
  nbLigne+=1
end
puts "la valeur total est de #{total} !"
