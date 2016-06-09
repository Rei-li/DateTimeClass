Класс CustomTimeClass предназначен для хранения,работы и удобного отображения значения значения единицы времени.
Значение временной единицы хранится в поле int64 fFullTimeInMillisec в миллисекундах. Поле инициализируется
одним из трех перегруженных конструкторов  Create(Year, Month, Day, Hour, Minutes, Secunds,Milisecunds: Integer),
constructor Create(Milisecunds: Integer) или constructor Create(Year, Month, Day: Integer),аргументы которых представляют собой полные значения временных единиц, которые необходимо сохранить(1990 13 26 -- в поле убдут суммированы значения 1990 лет в миллисекундах, 13 месяцев в миллисекундах и 26 полных дней в миллисекундах). Аргументы конструкторов переводятся в миллисекунды (посредством константных значений содержания миллисекунд в других единицах измерения времени)и хранятся в поле fFullTimeInMillisec.
Для облегчения доступа к значениям времени в классе определены свойства  Year,Month,Day,Hour, Minutes,Secunds,Millisecunds: Integer
предоставляющие информацию о требуемой составляющей хранимого значения (к примеру при хранении  введенного значения 1990 лет 13 месяцев и  26 дней, у свойства Day, будет значение  26,у Year-1991 а у Month-1 ). Свойства работают на чтение посредством Get методов.
Метод GetDateAndTime возвращает представление хранимой информации в виде строки.

В классе присутствуют методы для проведения арифметических операций(сложение, вычетание) с хранимым значением:

 методы  :
	procedure AddYears(Years: Integer);
	procedure AddMonth(Months: Integer);procedure AddDays(Days: Integer);
	procedure AddHours(Hours: Integer);
   	 procedure AddMinuts(Minuts: Integer);
   	 procedure AddSecunds(Secunds: Integer);
   	 procedure AddMillisecunds(Millisecundss: Integer),
   	 
позволяют добавить временное значение в соответствующих единицах к хранимому значений, 
а методы:

	 procedure SubtractYears(Years: Integer);
   	 procedure SubtractMonth(Months: Integer);
  	 procedure SubtractDays(Days: Integer);
	 procedure SubtractHours(Hours: Integer);
  	 procedure SubtractMinuts(Minuts: Integer);
  	 procedure SubtractSecunds(Secunds: Integer);
  	 procedure SubtractMillisecunds(Millisecunds: Integer),
уменьшить хранимое значение на указанную величину.
 

Во время выполнения программы действует цикл с постоянным предложением ввода данных.

Ввод данных не целочисленного типа,приводит к выходу из программы.Кроме того, из основного цикла можно выйти посредством ввода целочисленного значения не равного 1,2,3.

Ввод целочисленных данных указанных в консольных данных позволит переходить к выполнению различных операций с хранимым значением:

Выбор формата ввода данных для записи и перезаписи хранимого значения,непосредственно запись,операцию по увеличению и уменьшению величины хранимого значения, вывод хранимого значения либо необходимой части.
 
