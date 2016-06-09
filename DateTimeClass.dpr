program DateTimeClass;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils;

type
  CustomTimeClass = class
  const
    MillisecInYears: Int64 = 31104000000; // 60*60000*24*30*12;
    MillisecInMonth: Int64 = 2592000000; // 60*60000*24*30;
    MillisecInDay: Int64 = 86400000; // 60*60000*24;
    MillisecInHour: Int64 = 3600000; // 60*60000
    MillisecInMinutes: Int64 = 60000; // 60*1000
    MillisecInSecunds: Int64 = 1000;

  private
    fFullTimeInMillisec: Int64;
    function GetYear: Integer;
    function GetMonth: Integer;
    function GetDay: Integer;
    function GetHours: Integer;
    function GetMinutes: Integer;
    function GetSecunds: Integer;
    function GetMillisecunds: Integer;

  public

    procedure AddYears(Years: Integer);
    procedure AddMonth(Months: Integer);
    procedure AddDays(Days: Integer);
    procedure AddHours(Hours: Integer);
    procedure AddMinuts(Minuts: Integer);
    procedure AddSecunds(Secunds: Integer);
    procedure AddMillisecunds(Millisecundss: Integer);

    procedure SubtractYears(Years: Integer);
    procedure SubtractMonth(Months: Integer);
    procedure SubtractDays(Days: Integer);
    procedure SubtractHours(Hours: Integer);
    procedure SubtractMinuts(Minuts: Integer);
    procedure SubtractSecunds(Secunds: Integer);
    procedure SubtractMillisecunds(Millisecunds: Integer);

    function GetDateAndTime: string;

    property Year: Integer read GetYear;
    property Month: Integer read GetMonth;
    property Day: Integer read GetDay;
    property Hour: Integer read GetHours;
    property Minutes: Integer read GetMinutes;
    property Secunds: Integer read GetSecunds;
    property Millisecunds: Integer read GetMillisecunds;

    constructor Create(Year, Month, Day, Hour, Minutes, Secunds,
      Milisecunds: Integer); overload;
    constructor Create(Milisecunds: Integer); overload;
    constructor Create(Year, Month, Days: Integer); overload;
  end;

procedure CustomTimeClass.AddYears(Years: Integer);
begin
  self.fFullTimeInMillisec := self.fFullTimeInMillisec + Years *
    CustomTimeClass.MillisecInYears;
end;

procedure CustomTimeClass.AddMonth(Months: Integer);
begin
  self.fFullTimeInMillisec := self.fFullTimeInMillisec + Months *
    CustomTimeClass.MillisecInMonth;
end;

procedure CustomTimeClass.AddDays(Days: Integer);
begin
  self.fFullTimeInMillisec := self.fFullTimeInMillisec + Days *
    CustomTimeClass.MillisecInDay;
end;

procedure CustomTimeClass.AddHours(Hours: Integer);
begin
  self.fFullTimeInMillisec := self.fFullTimeInMillisec + Hours *
    CustomTimeClass.MillisecInHour;
end;

procedure CustomTimeClass.AddMinuts(Minuts: Integer);
begin
  self.fFullTimeInMillisec := self.fFullTimeInMillisec + Minuts *
    CustomTimeClass.MillisecInMinutes;
end;

procedure CustomTimeClass.AddSecunds(Secunds: Integer);
begin
  self.fFullTimeInMillisec := self.fFullTimeInMillisec + Secunds *
    CustomTimeClass.MillisecInSecunds;
end;

procedure CustomTimeClass.AddMillisecunds(Millisecundss: Integer);
begin
  self.fFullTimeInMillisec := self.fFullTimeInMillisec + Millisecundss;
end;

procedure CustomTimeClass.SubtractMillisecunds(Millisecunds: Integer);
var
  temp: Integer;
begin
  temp := self.fFullTimeInMillisec - Millisecunds;
  if temp > 0 then
    self.fFullTimeInMillisec := temp
  else
    self.fFullTimeInMillisec := 0
end;

procedure CustomTimeClass.SubtractYears(Years: Integer);
begin
  self.SubtractMillisecunds(Years * CustomTimeClass.MillisecInYears);
end;

procedure CustomTimeClass.SubtractMonth(Months: Integer);
begin
  self.SubtractMillisecunds(Months * CustomTimeClass.MillisecInMonth);
end;

procedure CustomTimeClass.SubtractDays(Days: Integer);
begin
  self.SubtractMillisecunds(Days * CustomTimeClass.MillisecInDay);
end;

procedure CustomTimeClass.SubtractHours(Hours: Integer);
begin
  self.SubtractMillisecunds(Hours * CustomTimeClass.MillisecInHour);
end;

procedure CustomTimeClass.SubtractMinuts(Minuts: Integer);
begin
  self.SubtractMillisecunds(Minuts * CustomTimeClass.MillisecInMinutes);
end;

procedure CustomTimeClass.SubtractSecunds(Secunds: Integer);
begin
  self.SubtractMillisecunds(Secunds * CustomTimeClass.MillisecInSecunds);
end;

function CustomTimeClass.GetYear;
begin
  if self.fFullTimeInMillisec > 0 then

    Result := self.fFullTimeInMillisec div CustomTimeClass.MillisecInYears
  else
    Result := 0;
end;

function CustomTimeClass.GetMonth;
begin
  if self.fFullTimeInMillisec > 0 then
    Result := (self.fFullTimeInMillisec mod CustomTimeClass.MillisecInYears)
      div CustomTimeClass.MillisecInMonth
  else
    Result := 0;
end;

function CustomTimeClass.GetDay;
begin
  if self.fFullTimeInMillisec > 0 then
    Result := (self.fFullTimeInMillisec mod CustomTimeClass.MillisecInMonth)
      div CustomTimeClass.MillisecInDay
  else
    Result := 0;
end;

function CustomTimeClass.GetHours;
begin
   if self.fFullTimeInMillisec > 0 then
    Result := (self.fFullTimeInMillisec mod CustomTimeClass.MillisecInDay)
      div CustomTimeClass.MillisecInHour
  else
    Result := 0;
end;

function CustomTimeClass.GetMinutes;
begin
  if self.fFullTimeInMillisec > 0 then
    Result := (self.fFullTimeInMillisec mod CustomTimeClass.MillisecInHour)
      div CustomTimeClass.MillisecInMinutes
  else
    Result := 0;
end;

function CustomTimeClass.GetSecunds;
begin
  if self.fFullTimeInMillisec > 0 then

    Result := (self.fFullTimeInMillisec mod CustomTimeClass.MillisecInMinutes)
      div CustomTimeClass.MillisecInSecunds
  else
    Result := 0;
end;

function CustomTimeClass.GetMillisecunds;
begin
  if self.fFullTimeInMillisec > 0 then
    Result := self.fFullTimeInMillisec mod CustomTimeClass.MillisecInSecunds
  else
    Result := 0;
end;

function CustomTimeClass.GetDateAndTime;
begin
  Result := 'Years ' + self.GetYear.ToString + ' | Month ' +
    self.GetMonth.ToString + ' | Day ' + self.GetDay.ToString + ' | Hour ' +
    GetHours.ToString + ' | Minutes ' + self.GetMinutes.ToString + ' | Secunds '
    + GetSecunds.ToString;
end;

constructor CustomTimeClass.Create(Year, Month, Day, Hour, Minutes, Secunds,
  Milisecunds: Integer);
begin
  self.fFullTimeInMillisec := Year * MillisecInYears + Month * MillisecInMonth +
    Day * MillisecInDay + Hour * MillisecInHour + Minutes * MillisecInMinutes +
    Secunds * MillisecInSecunds + Milisecunds;
end;

constructor CustomTimeClass.Create(Milisecunds: Integer);
begin
  self.fFullTimeInMillisec := Milisecunds;
end;

constructor CustomTimeClass.Create(Year, Month, Days: Integer);
begin

  self.fFullTimeInMillisec := (Year) * MillisecInYears + (Month) *
    MillisecInMonth + Days * MillisecInDay;
end;

var
  Date: CustomTimeClass;
  Input: Integer;
  Args: Array [1 .. 7] of Integer;

procedure ReadArguments(ArgNumber: Integer);
var
  ArgsCount: Integer;
  Inp: Int64;
begin
  ArgsCount := 1;
  While (ArgsCount <= ArgNumber) do
  begin
    Read(Inp);
    if (Inp > 0) then
      Args[ArgsCount] := Inp
    else
      Args[ArgsCount] := 0;
    ArgsCount := ArgsCount + 1;

  end;

end;

procedure WriteMenuTimeInterval();

begin
  Writeln('Выберите единицы измерения ');
  Writeln('1 -- millisec ');
  Writeln('2 -- sec ');
  Writeln('3 -- minutes');
  Writeln('4 -- hours ');
  Writeln('5 -- days ');
  Writeln('6 -- monthes');
  Writeln('7 -- years ');

end;

function ReadInputTimeInterval: Integer;
begin
  Writeln('Ввведите значение временного интервала');
  Read(Result);
end;

begin
  try
    while True do
    begin
      Writeln('Выберите формат ввода данных 1-- |Year, Month, Day, Hour, Minutes, Secunds,Milisecunds|');
      Writeln('2-- |Year, Month, Day|');
      Writeln('3--|Milisecunds|  (что бы выйти нажмите любую другую клавишу)');
      Read(Input);

      case Input of
        1:
          begin
            Writeln('Введите в следующей последовательности-- |Year, Month, Day, Hour, Minutes, Secunds,Milisecunds|');
            ReadArguments(7);
            Date := CustomTimeClass.Create(Args[1], Args[2], Args[3], Args[4],
              Args[5], Args[6], Args[7]);
          end;

        2:
          begin
            Writeln('Введите в следующей последовательности-- |Year, Month, Day|');
            ReadArguments(3);
            Date := CustomTimeClass.Create(Args[1], Args[2], Args[3]);
          end;
        3:
          begin
            Writeln('Введите--|Milisecunds| ');
            Read(Input);
            Date := CustomTimeClass.Create(Input);
          end;
      else
        break;
      end;
      while True do
      begin
        Writeln('Выберите желаемую операцию 1-- добавление временного отрезка');
        Writeln('2-- вычитание временного отрезка');
        Writeln('3--вывод данных');
        Writeln('остальные--перезапись данных данных');
        Read(Input);
        case Input of
          1:
            begin
              WriteMenuTimeInterval();
              Read(Input);

              case Input of
                1:
                  Date.AddMillisecunds(ReadInputTimeInterval);
                2:
                  Date.AddSecunds(ReadInputTimeInterval);
                3:
                  Date.AddMinuts(ReadInputTimeInterval);
                4:
                  Date.AddHours(ReadInputTimeInterval);
                5:
                  Date.AddDays(ReadInputTimeInterval);
                6:
                  Date.AddMonth(ReadInputTimeInterval);
                7:
                  Date.AddYears(ReadInputTimeInterval);
              else
                break;
              end;
            end;

          2:
            begin
              WriteMenuTimeInterval();
              Read(Input);
              case Input of
                1:
                  Date.SubtractMillisecunds(ReadInputTimeInterval);
                2:
                  Date.SubtractSecunds(ReadInputTimeInterval);
                3:
                  Date.SubtractMinuts(ReadInputTimeInterval);
                4:
                  Date.SubtractHours(ReadInputTimeInterval);
                5:
                  Date.SubtractDays(ReadInputTimeInterval);
                6:
                  Date.SubtractMonth(ReadInputTimeInterval);
                7:
                  Date.SubtractYears(ReadInputTimeInterval);
              else
                break;
              end;
            end;
          3:
            begin
              WriteMenuTimeInterval();
              Writeln('8 -- строковое представление даты ');
              Read(Input);
              case Input of
                1:
                  Writeln(Date.Millisecunds);
                2:
                  Writeln(Date.Secunds);
                3:
                  Writeln(Date.Minutes);
                4:
                  Writeln(Date.Hour);
                5:
                  Writeln(Date.Day);
                6:
                  Writeln(Date.Month);
                7:
                  Writeln(Date.Year);
                8:
                  Writeln(Date.GetDateAndTime);
              else
                break;
              end;
            end;
        else
          break;
        end;
      end;
    end;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

end.
