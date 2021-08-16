 
def cls                               
  system('cls') || system('clear')
  sleep 1
end

def  title
   puts "Программа  <<Определение порядкового номер даты в году>> (с) 2021 by R.O.A\n"
   sleep 1
end

day_number = 0
months_in_year = { 1 => 31,
                   2 => 28,
                   3=> 31,
                   4=> 30, 
                   5=> 31,
                   6=> 30,
                   7=> 31,
                   8=> 31,
                   9=> 30,
                  10=> 31,
                  11=> 30,
                  12=> 31, 
                 }

cls
title
print " Введите год :"
year = STDIN.gets.encode("UTF-8").chomp.to_i
print " Введите месяц(1-январь, 12-декабрь) :"
month = STDIN.gets.encode("UTF-8").chomp.to_i
print " Введите дату (1-31) :"
day = STDIN.gets.encode("UTF-8").chomp.to_i

if year % 4 == 0 || (year % 100 == 0 && year % 400 == 0)
      
    months_in_year.merge!(2 => 29)
  end
months_in_year.select!{|key, value|  key <= month}
months_in_year.store(month, day)
months_in_year.each_value {|v| day_number += v }

print "Порядковый номер дня в году для даты #{day}.#{month}.#{year} :"
print day_number
