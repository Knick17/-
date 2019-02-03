program bibl30;
uses ikarus;

var
  r: rec_type;
  vid1, vid2: byte;
  end_m, end_n: boolean;
  name: string;


begin
 // creute_file(r);
     name:= 'bibl';
     end_n := false;
          repeat
            writeln('Выберете вид работы: ');
            writeln(' 1-просмотр списка');
            writeln(' 2-изменение записи');
            writeln(' 3-дополнение файла');
            writeln(' 4-найти книги по названию');
            writeln(' 5-найти книги по автору');
            writeln(' 0-Закончить работу');
            write('Ваш выбор: '); readln(vid2);
            case vid2 of 
              1: output_file(r, name);
              2: update_rec(r, name);
              3: add_rec(r, name);
              4: poisc_name(r, name);
              5: poisc_s_name(r, name);
              0: end_n := true;
            end;
          until end_n;
end.


