 #  Программа выводит на экран месяцы, в которых  30 дней.  Данные берутся их хэша, объявленного в 
 #  тектве программы. 

month = { january: 31,
          february: 28,
          march: 31,
          april: 30, 
          may: 31,
          june: 30,
          july: 31,
          august: 31,
          september: 30,
          oktober: 31,
          november: 30,
          december: 31, 
        }

puts "Месяцы, в которых 30 дней :" 

 month.each do |key, vol|
 puts "#{key}" if vol == 30 
 end      
