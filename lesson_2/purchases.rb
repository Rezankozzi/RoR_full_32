 #  Программа учета покупок. 
 #  Пользователь вводит название покупки, ее цену за единицу  и количество купленных единиц товара. 
 #  Программа выводит на экран все данные о покупках, подсчитывает сумму за каждую
 #  и выдает итоговую сумму. 


      def cls                                
          system('cls') || system('clear')
          sleep 1
      end

      def  title
           puts "Программа   <<Сумма покупок>> (с) 2021 by R.O.A\n"
           sleep 1
      end      
      
      def input_user(text) 
          print text 
          choice = STDIN.gets.encode("UTF-8").chomp
          return choice
        
       end
cls
title
total_price = 0
product_hash = Hash.new  #   в этом хэше  будут храниться все данные о покупке

loop do
product = input_user("Введите название товара(6 символов) :").to_sym
     if   product == :stop
     	  then break
     end


unit_price = input_user("Введите цену единицы товара #{product}:").to_f.round(2)
quantity = input_user("Введите его количество товара :").to_f.round(2)
product_hash[product] = {quantity: quantity,
                         unit_price: unit_price}

puts " Если хотите окончить ввод введите название товара  <stop>"
puts "\nВведите следующую покупку."
end

cls
title
puts "\nитоговый список товаров :\n"

puts "| Название | Цена за | Количество | Сумма |"
puts "| товара   | за шт.  |    шт.     |       |"   
puts "-------------------------------------------"
product_hash.each do  |product_name, product_hash|
print "| #{product_name}"
print"   | #{product_hash[:unit_price]}"
print"    | #{product_hash[:quantity]}"
print"       | #{(product_hash[:quantity] * product_hash[:unit_price]).round(2)}\n" 
total_price += (product_hash[:quantity] * product_hash[:unit_price]).round(2)
end
puts "-------------------------------------------"
puts "Итого : #{total_price.round(2)}"