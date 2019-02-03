unit ikarus;

interface

type
  rec_type = record
    name: string[50];
    s_name: string[20];
    age: integer;
    klass: byte
  end;

procedure creute_file(rr: rec_type);
procedure output_file(rr: rec_type; name: string);
procedure update_rec(rr: rec_type; name: string);
procedure add_rec(rr: rec_type; name: string);
procedure poisc_age(rr: rec_type; name: string);
procedure poisc_name(rr: rec_type; name: string);
procedure poisc_s_name(rr: rec_type; name: string);
procedure poisc_klass(rr: rec_type; name: string);

implementation

procedure creute_file(rr: rec_type);
var
  f: file of rec_type;
  name: string;
  en: integer;
begin
  write('Введите имя файла: '); readln(name);
  assign(f, name);
  rewrite(f);
  repeat
    with rr do
    begin
      writeln('Введите данные: ');
      write(' Название книги: '); readln(name);
      write(' Фамилия и инициалы автора: '); readln(s_name);
      write(' Год издания: '); readln(age);
      write(' Признак, является ли книга учебником(1-да)(0-нет): '); readln(klass);
    end;
    write(f, rr);
    write('Еще (0-нет) : '); readln(en);
  until en = 0;
  close(f)
end;

procedure output_file(rr: rec_type; name: string);
var
  f: file of rec_type;
begin
  assign(f, name);
  reset(f);
  seek(f, 0);
  Writeln('Вот все имеющиеся книги :' );
  while (not eof(f)) do
  begin
    write(' N: ', filepos(f) + 1:3, ' ');
    read(f, rr);
    with rr do
    begin
      write(' Название книги: ':20, name :50);
      write(' Фамилия и инициалы автора: ':40, s_name:20);
      write(' Год издания: ':20, age:5);
      write(' Признак, является ли книга учебником(1-да)(0-нет): ':60, klass:2);
      writeln;
    end;
  end;
  close(f)
end;

procedure update_rec(rr: rec_type; name: string);
var
  f: file of rec_type;
  num: longint;
begin
  assign(f, name);
  reset(f);
  Writeln('Укажите номер изменения записи: '); readln(num);
  seek(f, num - 1);
  Writeln(' -Старое значение записи- '); read(f, rr);
  with rr do
  begin
     write(' Название книги: ':20, name :25);
      write(' Фамилия и инициалы автора: ':40, s_name:20);
      write(' Год издания: ':20, age:5);
      write(' Признак, является ли книга учебником(1-да)(0-нет): ':60, klass:2);
      writeln;
  end;
  seek(f, num - 1);
  Writeln(' Задаем новое значение ', num, ' записи '); 
  with rr do
  begin
    writeln(' Введите данные: ');
    write(' Название книги: '); readln(name);
    write(' Фамилия и инициалы автора: '); readln(s_name);
    write(' Год издания: '); readln(age);
    write(' Признак, является ли книга учебником(1-да)(0-нет): '); readln(klass);
  end;
  write(f, rr);
  close(f)
end;

procedure add_rec(rr: rec_type; name: string);
var
  f: file of rec_type;
  en: integer;
begin
  assign(f, name);
  reset(f);
  repeat
    seek(f, filesize(f));
    with rr do
    begin
      writeln('ВВедите данныеы: ');
      write(' Название книги: '); readln(name);
      write(' Фамилия и инициалы автора: '); readln(s_name);
      write(' Год издания: '); readln(age);
      write(' Признак, является ли книга учебником(1-да)(0-нет): '); readln(klass);
    end;
    write(f, rr);
    write('Еще (0-нет) : '); readln(en);
  until en = 0;
  close(f)
end;

procedure poisc_age(rr: rec_type; name: string);
var
  f: file of rec_type;
  age_poisc, i: integer;
begin
  i := 0;
  assign(f, name);
  reset(f);
  seek(f, 0);
  write('Введите год, нужный вам: '); readln(age_poisc);
  while (not eof(f)) do
  begin
    read(f, rr); 
    if age_poisc = rr.age
    then begin
      write(' Название книги: ':20, rr.name :25);
      write(' Фамилия и инициалы автора: ':40, rr.s_name:20);
      write(' Год издания: ':20, rr.age:5);
      write(' Признак, является ли книга учебником(1-да)(0-нет): ':60, rr.klass:2);
      writeln;
    end
    else i := i + 1;
  end;
  if i = filepos(f) then writeln('Нет книг такого года издания');
  close(f)
end;


procedure poisc_name(rr: rec_type; name: string);
var
  f: file of rec_type;
  name_poisc: string;
  i: integer;
begin
  i := 0;
  assign(f, name);
  reset(f);
  seek(f, 0);
  write('Введите название книги, нужной вам: '); readln(name_poisc);
  while (not eof(f)) do
  begin
    read(f, rr); 
    if name_poisc = rr.name
    then begin
      write(' Название книги: ':20, rr.name :25);
      write(' Фамилия и инициалы автора: ':40, rr.s_name:20);
      write(' Год издания: ':20, rr.age:5);
      write(' Признак, является ли книга учебником(1-да)(0-нет): ':60, rr.klass:2);
      writeln;
    end
    else i := i + 1;
  end;
  if i = filepos(f) then writeln('Нет книг с таким названием');
  close(f)
end;

procedure poisc_s_name(rr: rec_type; name: string);
var
  f: file of rec_type;
  s_name_poisc: string;
  i: integer;
begin
  i := 0;
  assign(f, name);
  reset(f);
  seek(f, 0);
  write('Введите Фамилию и иннициалы автора, нужного вам: '); readln(s_name_poisc);
  while (not eof(f)) do
  begin
    read(f, rr); 
    if s_name_poisc = rr.s_name
    then begin
      write(' Название книги: ':20, rr.name :25);
      write(' Фамилия и инициалы автора: ':40, rr.s_name:20);
      write(' Год издания: ':20, rr.age:5);
      write(' Признак, является ли книга учебником(1-да)(0-нет): ':60, rr.klass:2);
      writeln;
    end
    else i := i + 1;
  end;
  if i = filepos(f) then writeln('Нет книг этого автора');
  close(f)
end;

procedure poisc_klass(rr: rec_type; name: string);
var
  f: file of rec_type;
  klass_poisc: byte;
  i: integer;
begin
  i := 0;
  assign(f, name);
  reset(f);
  seek(f, 0);
  write('Введите "1" если хотите увидеть учебники, или "0", если хотете видить остальные книги '); readln(klass_poisc);
  while (not eof(f)) do
  begin
    read(f, rr); 
    if klass_poisc = rr.klass
    then begin
      write(' Название книги: ':20, rr.name :25);
      write(' Фамилия и инициалы автора: ':40, rr.s_name:20);
      write(' Год издания: ':20, rr.age:5);
      write(' Признак, является ли книга учебником(1-да)(0-нет): ':60, rr.klass:2);
      writeln;
    end
    else i := i + 1;
  end;
  if i = filepos(f) then writeln('Нет книг этого признака');
  close(f)
end;


end.