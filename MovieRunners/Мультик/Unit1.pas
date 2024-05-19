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

  _countCadrPerson1 = 11; // ���-�� ������ ������� ��������
  _countCadrPerson2 = 6; // ���-�� ������ ������� ��������

  // ����� ��������� � ����� personnelUnit.pas

var
  flagMedia: BOOLEAN; // On / Off ������

  numberPersonnel1: Integer; // ������ ����� �������� 1
  numberPersonnel2: Integer; // ������ ����� �������� 2

  Form1: TForm1;

  Person1: TPoint; // ������������� ���������� ������� ��������
  Person2: TPoint; // ������������� ���������� ������� ��������

  Tree1: TPoint; // ������������� ���������� ������� ������
  Tree2: TPoint; // ������������� ���������� ������� ������

  Let1: TPoint; // ������������� ���������� ������� �����������
  Let2: TPoint; // ������������� ���������� ������� �����������

  flagKPerson1: BOOLEAN;
  flagKPerson2: BOOLEAN;
  // ����� �� ������ ����������� (��� ������� �� ���� ���������� �� ������� � ��������� ������)

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
  k := trunc(sqrt(TreeXY.Y div 100)); // �����������
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
      // ��� ������� ����������� (��� ���������� ����� ������������ �� �������� ����� ��������)
      k := trunc(100 * sqrt(PeopleXY.Y div 90)); // ����������� �����
    end
    else
    begin
      // +70  ������ ��� ��� ������ ������ (�� ��� �� ������ �������� ��� ����������� ���� �� �� �� ������)
      k := trunc(100 * sqrt((PeopleXY.Y + 70) div 100));
      // ����������� �� �����   (������� � ��������� ������)
    end;

    startPoint := Canvas.PenPos;
    // �������� ���������� ������� �����, ����� ����� ������ �� �������� ���������� �� ������� (��� ��������)

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
    // ��� ������� ����������� (��� ���������� ����� ������������ �� �������� ����� ��������)
    k := trunc(100 * sqrt(PeopleXY.Y div 100)); // ����������� �����
  end
  else
  begin
    // +70  ������ ��� ��� ������ ������ (�� ��� �� ������ �������� ��� ����������� ���� �� �� �� ������)
    k := trunc(100 * sqrt((PeopleXY.Y + 70) div 100));
    // ����������� �� �����   (������� � ��������� ������)
    end;

    Canvas.Brush.Color := clBlack;

    Canvas.Pen.Color := clBlack; Canvas.Pen.Width := 3;

    Canvas.Ellipse(PeopleXY.X + k * People.Point_Head.X div 100 - k *
      SizeHead div 200, PeopleXY.Y + k * People.Point_Head.Y div 100 - k *
      SizeHead div 100, PeopleXY.X + k * People.Point_Head.X div 100 + k *
      SizeHead div 200, PeopleXY.Y + k * People.Point_Head.Y div 100);
    // ������ ������

    // ______________________________________________________________________

    DrawLine(People.Point_Head, Point(0, 0)); // ������ ����
    DrawLine(Point(0, 0), People.Point_Hips); // ������ ����

    // ______________________________________________________________________

    Canvas.Pen.Color := clgreen;
    // P.s Point(0,0) ������ ��� ������ �� ����� (����������� �����)

    DrawLine(Point(0, 0), People.Point_ForeArmRight);
    // ������ ������ ����������
    DrawLine(People.Point_ForeArmRight, People.Point_HandRight);
    // ������ ������ ������
    // ______________________________________________________________________

    Canvas.Pen.Color := clred;

    DrawLine(Point(0, 0), People.Point_ForeArmLeft);
    // ������ ����� ����������
    DrawLine(People.Point_ForeArmLeft, People.Point_HandLeft);
    // ������ ����� ������


    // ______________________________________________________________________

    Canvas.Pen.Color := clgreen;

    DrawLine(People.Point_Hips, People.Point_KneeRight);
    // ������ ������ �����
    DrawLine(People.Point_KneeRight, People.Point_FootRight);
    // ������ ������ ������

    // ______________________________________________________________________

    Canvas.Pen.Color := clred;

    DrawLine(People.Point_Hips, People.Point_KneeLeft);
    // ������ ����� �����

    DrawLine(People.Point_KneeLeft, People.Point_FootLeft);
    // ������ ����� ������

    // ______________________________________________________________________

    Canvas.Pen.Color := clYellow; Canvas.Pen.Width := 8;
    Canvas.Ellipse(PeopleXY.X - 2, PeopleXY.Y - 2, PeopleXY.X + 2,
      PeopleXY.Y + 2);
    // ����������� ����� (�����)
    end;

    procedure TForm1.FormPaint(Sender: TObject); begin

      PrintPeople(flagKPerson1, Person1, personnel1[numberPersonnel1]);
    // ������ �����-�� ����
    PrintPeople(flagKPerson2, Person2, personnel2[numberPersonnel2]);

    PrintTree(Tree1); // � ��� ����� ���. ��� ��������
    PrintTree(Tree2);

    PrintLet(Let1); // � ��� ����� ���. ��� ��������
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
    // showmessage(ExtractFilePath(Application.ExeName) + 'music1.mp3');   // ���� �� ������

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
    // ����������� ����������� � ������

    dec(Let2.X, 50); if Let2.X < 0 then Let2.X := ClientWidth;
    // ����������� ����������� � ������

    inc(Person2.X, 20); if Person2.X > ClientWidth then
    // ����������� �������� � �����
      Person2.X := 0;

    inc(Person1.X, 10); if Person1.X > ClientWidth then
    // ����������� �������� � �����
      Person1.X := 0;

    dec(Tree1.X, 50); if Tree1.X < 0 then Tree1.X := ClientWidth;
    // ����������� ������ � ������

    dec(Tree2.X, 50); if Tree2.X < 0 then Tree2.X := ClientWidth;
    // ����������� ������ � ������

    inc(numberPersonnel1); // ������������� ����� ������� 1
    inc(numberPersonnel2); // ������������� ����� ������� 2

    if (Let1.X > Person1.X - 50) and (Let1.X < Person1.X + 200)
    then begin Person1.Y := 180; flagKPerson1 := false; // ��������� �����������
    end else begin Person1.Y := 250; flagKPerson1 := True;
    // �������� �����������
    end; // ������ �������� 1

    if (Let2.X > Person2.X - 50) and (Let2.X < Person2.X + 200)
    then begin Person2.Y := 330; flagKPerson2 := false; // ��������� �����������
    end else begin Person2.Y := 400; flagKPerson2 := True;
    // �������� �����������
    end; // ������ �������� 2

    if numberPersonnel2 >= _countCadrPerson2 then numberPersonnel2 := 0;
    // ������������ ����� � ������  (������� ���� 1)

    if numberPersonnel1 >= _countCadrPerson1 then numberPersonnel1 := 0;
    // ������������ ����� � ������  (������� ���� 1)

    Invalidate; end;

    end.
