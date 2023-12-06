def afficherHash(hash)
    hash.each do |cle, valeur|
        puts "#{cle}: #{valeur}"
      end
end

def trouverMin(categorie,val)
        find = false
        categorie.each do |map|
            #Chaque valeur
            if((map[1]..(map[1]+map[2])).include?(val))
                return (map[0]+val - map[1])
                find = true
            end
        end
    return val
end
fichier = File.open("day_5_rsc.txt",'r'); # Ouverture du document
totVal  = 0
content = fichier.read # Lecture du document
nbLigne = 0 ;
#Recuperation des categories
categories = {
  "seeds:" => [],
  "seed-to-soil map:" => [],
  "soil-to-fertilizer map:" => [],
  "fertilizer-to-water map:" => [],
  "water-to-light map:" => [],
  "light-to-temperature map:" => [],
  "temperature-to-humidity map:" => [],
  "humidity-to-location map:" => []
}
cate = [  "seeds:",
"seed-to-soil map:",
"soil-to-fertilizer map:",
"fertilizer-to-water map:",
"water-to-light map:",
"light-to-temperature map:",
"temperature-to-humidity map:",
"humidity-to-location map:"]

indiceCategorie= 0
content.each_line do |line|
    if (line.length < 2)
        indiceCategorie+=1
    end
    valeurs = line.scan(/\d+/).map { |element| element.to_i }
    if valeurs.length > 1
        categories[cate[indiceCategorie]]+=[valeurs]
    end
end



total = []
#recuperation
categories["seeds:"][0].each do |graine|
    val = graine
    val = trouverMin(categories["seed-to-soil map:"],val) # val sol
    val = trouverMin(categories["soil-to-fertilizer map:"],val) # val engrais
    val = trouverMin(categories["fertilizer-to-water map:"],val) # val eau
    val = trouverMin(categories["water-to-light map:"],val) # val lumiere
    val = trouverMin(categories["light-to-temperature map:"],val) # val temp
    val = trouverMin(categories["temperature-to-humidity map:"],val) # val humidite
    val = trouverMin(categories["humidity-to-location map:"],val) # val final
    total.push(val)
end

#graine > engrais
print total
totVal = total.min
puts "La valeur min est de #{totVal} !"
