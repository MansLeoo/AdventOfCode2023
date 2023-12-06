fichier = File.open("day_6_rsc.txt",'r'); # Ouverture du document
temp = fichier.gets.scan(/\d+/).join.to_i
record = fichier.gets.scan(/\d+/).join.to_i
    lstPos=[]
    i=0
    while(i < temp)
        i+=1
        if((temp-i)*i  > record ) then lstPos.push(i) end
    end
puts "La valeur total est de #{lstPos.length} !"
