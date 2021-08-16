 #  Программа заполняет массив числами fibonacchi 
 #  Первые два  элемента массива равны 0 и 1 (их изначальное наличие в массиве обязательно), третий и 
 # последующий элементы принимают значения суммы двух предыдущих. 
 # Значение последнего элемента массива не должно превышать 100.   

system('cls') || system('clear')
my_array = []

puts "У нас есть пустой исходный массив :  my_array = #{my_array}" 
sleep 1
puts "\nЗаполняем его числами  Фибоначчи (предел значения 100), и получаем :" 
sleep 1
my_array << 0
my_array << 1
loop do 
    break if (my_array[my_array.size - 2] + my_array[my_array.size - 1]) > 100
    my_array <<  (my_array[my_array.size - 2] + my_array[my_array.size - 1])
end

puts "\nmy_array = #{my_array.to_s}"
