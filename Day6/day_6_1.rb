fichier = File.open("day_6_rsc.txt",'r'); # Ouverture du document
temps = fichier.gets.scan(/\d+/).map(&:to_i)
lstTaille=[]
record = fichier.gets.scan(/\d+/).map(&:to_i)
r=0
temps.each do |temp|
    lstPos=[]
    i=0
    while(i < temp)
        i+=1
        if((temp-i)*i  > record[r] ) then lstPos.push(i) end
    end
    lstTaille+=[lstPos.length]
r+=1
end
totVal = lstTaille.reduce(:*)
puts "La valeur total est de #{totVal} !"
