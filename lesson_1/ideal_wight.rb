    
    #  Программа <<Твой идеальный вес >> запрашивает имя и рост пользователя, и рассчитывает  его идеальный вес 
    #  по формуле (<рост> - 110) * 1.15. 
    #  При выводе результата на экран программа обращается  к пользователю по имени. 
    #  Если идеальный вес получается отрицательным, то выводится сообщение "Ваш вес уже оптимальный". 
      

    

class Ideal_wight  #  в  классе описывается весь функционал  программы 

	    def initialize
          @name    #  здесь будет хранится  имя пользователя
          @hight   #   здесь будет хранится рост пользователя
          @ideal_wight  #  здесь будет хранится рассчитанный идеальный вес пользователя
      
      end

      def program_engine    #  основной  "движок"  программы  
          cls
          title  
          @name = input_user("Введите ваше имя: ").capitalize  #  имя пользователя сразу приводится к виду Name (например из nAME, nAmE и тд) 
          @hight =  input_user("Введите ваш рост: ").to_i
          @ideal_wight = (@hight - 110) * 1.15
          сheck_result
      end
   
      def cls                                #  метод, ответственный за очистку экрана                         
          system('cls') || system('clear')
          sleep 1
      end

      def  title                   #  метод выводит на экран данные о программе
           puts "Программа   <<Твой идеальный вес >> (с) by KRezOl 2021"
           sleep 1
      end

      def input_user(text)    #  метод, отвечающий за ввод данных пользователем. 
          print text                    
          sleep 1
          choice = STDIN.gets.encode("UTF-8").chomp
          return choice
      end
     
      def сheck_result          # метод выводит соответствующее сообщение в зависимости от  значения идеального веса пользователя
    	    print "#{@name}, "
    	    if @ideal_wight < 0 
    	  	   then  print "Ваш вес уже оптимальный!"
             else  print  "Ваш идеальный вес равен : #{@ideal_wight}"
          end      
      end 

end 


ideal_wight = Ideal_wight.new

ideal_wight.program_engine