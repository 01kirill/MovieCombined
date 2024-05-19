unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  personnelUnit, Types, MMSystem, Vcl.MPlayer, Math;

type
  TForm1 = class(TForm)
    Timer1: TTimer;
    Button1: TButton;
    Label1: TLabel;
    ScrollBar1: TScrollBar;
    MediaPlayer1: TMediaPlayer;
    procedure PrintPeople(const falgK: BOOLEAN; const PeopleXY: TPoint;
      const People: TPerson);
    procedure PrintTree(const TreeXY: TPoint);
    procedure PrintLet(const LetXY: TPoint);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure ScrollBar1Scroll(Sender: TObject; ScrollCode: TScrollCode;
      var ScrollPos: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  SizeHead = 30;

  _countCadrPerson1 = 11; // кол-во кадров первого человека
  _countCadrPerson2 = 6; // кол-во кадров второго человека

  // КАДРЫ СОЗДАЮТСЯ В ЮНЕТЕ personnelUnit.pas

var
  flagMedia: BOOLEAN; // On / Off музыкы

  numberPersonnel1: Integer; // индекс кадра человека 1
  numberPersonnel2: Integer; // индекс кадра человека 2

  Form1: TForm1;

  Person1: TPoint; // относительная координата первого человеек
  Person2: TPoint; // относительная координата первого человеек

  Tree1: TPoint; // относительная координата первого дерева
  Tree2: TPoint; // относительная координата первого дерева

  Let1: TPoint; // относительная координата первого препятствия
  Let2: TPoint; // относительная координата первого препятствия

  flagKPerson1: BOOLEAN;
  flagKPerson2: BOOLEAN;
  // нужно ли делать перспективу (это зависит от того находиться ли человек в состоянии прыжка)

implementation

{$R *.dfm}

procedure TForm1.PrintLet(const LetXY: TPoint);
begin
  Canvas.Pen.Color := clGray;
  Canvas.Pen.Width := 15;

  Canvas.MoveTo(LetXY.X, LetXY.Y);

  Canvas.LineTo(LetXY.X - 50 div 4 * 3, LetXY.Y + 30 div 4 * 3);

  Canvas.LineTo(LetXY.X - 70 div 4 * 3, LetXY.Y + 120 div 4 * 3);

  Canvas.LineTo(LetXY.X + 90 div 4 * 3, LetXY.Y + 120 div 4 * 3);

  Canvas.LineTo(LetXY.X + 70 div 4 * 3, LetXY.Y + 30 div 4 * 3);

  Canvas.LineTo(LetXY.X + 30 div 4 * 3, LetXY.Y + 0 div 4 * 3);

  Canvas.LineTo(LetXY.X + 0, LetXY.Y + 0);
end;

procedure TForm1.PrintTree(const TreeXY: TPoint);
var
  k: Integer;
begin
  k := trunc(sqrt(TreeXY.Y div 100)); // перспектива
  Canvas.Pen.Color := clMaroon;
  Canvas.Pen.Width := 15 * k;

  Canvas.MoveTo(TreeXY.X, TreeXY.Y);

  Canvas.LineTo(TreeXY.X - k * 10, TreeXY.Y + k * 100);

  Canvas.LineTo(TreeXY.X - k * 70, TreeXY.Y + k * 120);

  Canvas.LineTo(TreeXY.X + k * 90, TreeXY.Y + k * 120);

  Canvas.LineTo(TreeXY.X + k * 40, TreeXY.Y + k * 100);

  Canvas.LineTo(TreeXY.X + k * 30, TreeXY.Y + k * 0);

  Canvas.Pen.Color := clgreen;
  Canvas.Pen.Width := 30;

  Canvas.Brush.Color := clgreen;
  Canvas.Brush.Style := bsSolid;

  Canvas.Ellipse(TreeXY.X - k * 30, TreeXY.Y - k * 70, TreeXY.X + k * 60,
    TreeXY.Y + k * 10);

  Canvas.Ellipse(TreeXY.X - k * 30, TreeXY.Y + k * 10, TreeXY.X - k * 20,
    TreeXY.Y + k * 20);

  Canvas.Ellipse(TreeXY.X + k * 20, TreeXY.Y - k * 20, TreeXY.X + k * 40,
    TreeXY.Y + k * 20);

  Canvas.Ellipse(TreeXY.X + k * 60, TreeXY.Y - k * 70, TreeXY.X + k * 50,
    TreeXY.Y - k * 60);

  Canvas.Ellipse(TreeXY.X - k * 30, TreeXY.Y - k * 70, TreeXY.X - k * 20,
    TreeXY.Y - k * 60);

  Canvas.Ellipse(TreeXY.X - k * 40, TreeXY.Y - k * 50, TreeXY.X - k * 30,
    TreeXY.Y - k * 40);

  Canvas.Ellipse(TreeXY.X + k * 60, TreeXY.Y - k * 10, TreeXY.X + k * 70,
    TreeXY.Y + k * 0);
end;

procedure TForm1.PrintPeople(const falgK: BOOLEAN; const PeopleXY: TPoint;
  const People: TPerson);
  procedure DrawLine(const Point1, Point2: TPoint);
  var
    startPoint: TPoint;
    k: Integer;
  begin
    if falgK then
    begin
      // ЭТО ФОРМУДА ПЕРСПЕКТИВЫ (она показалась самой реалистичной из найденых нащей бригадой)
      k := trunc(100 * sqrt(PeopleXY.Y div 90)); // перспектива нужна
    end
    else
    begin
      // +70  потому что это высота прыжка (мы как бы рисуем человека при перспективе если бы он не прыгал)
      k := trunc(100 * sqrt((PeopleXY.Y + 70) div 100));
      // перспектива не нужна   (человек в состоянии прыжок)
    end;

    startPoint := Canvas.PenPos;
    // копируем координаты входной точки, чтобы после выхода из процеуры координаты не сбились (для удобства)

    Canvas.MoveTo(PeopleXY.X + k * Point1.X div 100,
      PeopleXY.Y + k * Point1.Y div 100);
    Canvas.LineTo(PeopleXY.X + k * Point2.X div 100,
      PeopleXY.Y + k * Point2.Y div 100);

    Canvas.PenPos := startPoint;
  end;

var
  k: Integer;
begin
  if falgK then
  begin
    // ЭТО ФОРМУДА ПЕРСПЕКТИВЫ (она показалась самой реалистичной из найденых нащей бригадой)
    k := trunc(100 * sqrt(PeopleXY.Y div 100)); // перспектива нужна
  end
  else
  begin
    // +70  потому что это высота прыжка (мы как бы рисуем человека при перспективе если бы он не прыгал)
    k := trunc(100 * sqrt((PeopleXY.Y + 70) div 100));
    // перспектива не нужна   (человек в состоянии прыжок)
    end;

    Canvas.Brush.Color := clBlack;

    Canvas.Pen.Color := clBlack; Canvas.Pen.Width := 3;

    Canvas.Ellipse(PeopleXY.X + k * People.Point_Head.X div 100 - k *
      SizeHead div 200, PeopleXY.Y + k * People.Point_Head.Y div 100 - k *
      SizeHead div 100, PeopleXY.X + k * People.Point_Head.X div 100 + k *
      SizeHead div 200, PeopleXY.Y + k * People.Point_Head.Y div 100);
    // рисуем голову

    // ______________________________________________________________________

    DrawLine(People.Point_Head, Point(0, 0)); // рисуем тело
    DrawLine(Point(0, 0), People.Point_Hips); // рисуем тело

    // ______________________________________________________________________

    Canvas.Pen.Color := clgreen;
    // P.s Point(0,0) потому что рисуем от груди (центральной точки)

    DrawLine(Point(0, 0), People.Point_ForeArmRight);
    // рисуем правое предплечие
    DrawLine(People.Point_ForeArmRight, People.Point_HandRight);
    // рисуем правое ладонь
    // ______________________________________________________________________

    Canvas.Pen.Color := clred;

    DrawLine(Point(0, 0), People.Point_ForeArmLeft);
    // рисуем левое предплечие
    DrawLine(People.Point_ForeArmLeft, People.Point_HandLeft);
    // рисуем левое ладонь


    // ______________________________________________________________________

    Canvas.Pen.Color := clgreen;

    DrawLine(People.Point_Hips, People.Point_KneeRight);
    // рисуем правое бедро
    DrawLine(People.Point_KneeRight, People.Point_FootRight);
    // рисуем правое голень

    // ______________________________________________________________________

    Canvas.Pen.Color := clred;

    DrawLine(People.Point_Hips, People.Point_KneeLeft);
    // рисуем левое бедро

    DrawLine(People.Point_KneeLeft, People.Point_FootLeft);
    // рисуем левое голень

    // ______________________________________________________________________

    Canvas.Pen.Color := clYellow; Canvas.Pen.Width := 8;
    Canvas.Ellipse(PeopleXY.X - 2, PeopleXY.Y - 2, PeopleXY.X + 2,
      PeopleXY.Y + 2);
    // центральная точка (грудь)
    end;

    procedure TForm1.FormPaint(Sender: TObject); begin

      PrintPeople(flagKPerson1, Person1, personnel1[numberPersonnel1]);
    // рисуем какой-то кадр
    PrintPeople(flagKPerson2, Person2, personnel2[numberPersonnel2]);

    PrintTree(Tree1); // у них кадра нет. они статичны
    PrintTree(Tree2);

    PrintLet(Let1); // у них кадра нет. они статичны
    PrintLet(Let2); end;

    procedure TForm1.Button1Click(Sender: TObject);

    begin flagMedia := not flagMedia;
    if flagMedia then begin MediaPlayer1.Pause;
    end else begin MediaPlayer1.Play; end;

    // Timer1.Enabled := not Timer1.Enabled;
    end;

    procedure TForm1.FormCreate(Sender: TObject); begin

      MediaPlayer1.FileName := ExtractFilePath(Application.ExeName) +
      'music1.mp3';
    // showmessage(ExtractFilePath(Application.ExeName) + 'music1.mp3');   // ПУТЬ ДО МУЗЫКИ

    MediaPlayer1.Open; MediaPlayer1.Play;

    CreatePersonnel; CreatePersonnel2;

    numberPersonnel1 := 0; numberPersonnel2 := 0;

    Timer1.Enabled := True; Timer1.Interval := 20;
    ScrollBar1.Position := Timer1.Interval;

    Person1 := Point(200, 250); Person2 := Point(400, 400);

    Tree1 := Point(150, 150); Tree2 := Point(1000, 400);

    Let1 := Point(550, 300); Let2 := Point(650, 500);

    flagKPerson1 := True; flagKPerson2 := True; end;

    procedure TForm1.ScrollBar1Scroll(Sender: TObject;
    ScrollCode:
      TScrollCode;
    var
    ScrollPos:
      Integer); begin Timer1.Interval := ScrollPos; end;

    procedure TForm1.Timer1Timer(Sender: TObject); begin

      dec(Let1.X, 50); if Let1.X < 0 then Let1.X := ClientWidth;
    // перемещение препятствия в начало

    dec(Let2.X, 50); if Let2.X < 0 then Let2.X := ClientWidth;
    // перемещение препятствия в начало

    inc(Person2.X, 20); if Person2.X > ClientWidth then
    // перемещение человека в конец
      Person2.X := 0;

    inc(Person1.X, 10); if Person1.X > ClientWidth then
    // перемещение человека в конец
      Person1.X := 0;

    dec(Tree1.X, 50); if Tree1.X < 0 then Tree1.X := ClientWidth;
    // перемещение дерева в начало

    dec(Tree2.X, 50); if Tree2.X < 0 then Tree2.X := ClientWidth;
    // перемещение дерева в начало

    inc(numberPersonnel1); // перевключение кадра человка 1
    inc(numberPersonnel2); // перевключение кадра человка 2

    if (Let1.X > Person1.X - 50) and (Let1.X < Person1.X + 200)
    then begin Person1.Y := 180; flagKPerson1 := false; // выключаем перспективу
    end else begin Person1.Y := 250; flagKPerson1 := True;
    // включаем перспективу
    end; // прыжок человека 1

    if (Let2.X > Person2.X - 50) and (Let2.X < Person2.X + 200)
    then begin Person2.Y := 330; flagKPerson2 := false; // выключаем перспективу
    end else begin Person2.Y := 400; flagKPerson2 := True;
    // включаем перспективу
    end; // прыжок человека 2

    if numberPersonnel2 >= _countCadrPerson2 then numberPersonnel2 := 0;
    // переключение кадра в начало  (текущий кадр 1)

    if numberPersonnel1 >= _countCadrPerson1 then numberPersonnel1 := 0;
    // переключение кадра в начало  (текущий кадр 1)

    Invalidate; end;

    end.
