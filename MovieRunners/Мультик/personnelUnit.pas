unit personnelUnit;

interface

uses
  Types, Dialogs, Sysutils;

type
  TPerson = record
    Point_Head, Point_Body, Point_ForeArmRight, Point_ForeArmLeft,
      Point_HandRight, Point_HandLeft, Point_Hips, Point_KneeLeft,
      Point_KneeRight, Point_FootLeft, Point_FootRight: TPoint end;

  var
    personnel1: array [0 .. 49] of TPerson;
    personnel2: array [0 .. 49] of TPerson;
    jump: array [0 .. 49] of TPerson;
    procedure Createpersonnel;
    procedure Createpersonnel2;

implementation

procedure Createpersonnel;
var
  People: TPerson;

  count: integer;
begin

  // Peoplexy := Person1; // точка центра человека (грудь)

  //ВСЕ КООРДИНАТЫ ЗАДАНЫ ПО СМЕЩЕНИЮОТНОСИТЕЛЬНО ГЛАВНОЙ ТОЧКИ(ТОЧКА ГРУДИ)

  // People.Point_Head := Point(0, -20); относительные координаты  головы

  // People.Point_Hips := Point(0, 50); относительные координаты   таза

  // People.Point_ForeArmLeft  относительные координаты   левого предплечие
  // People.Point_ForeArmRight относительные координаты   правое предплечие

  // People.Point_HandLeft  относительные координаты   левого ладони
  // People.Point_HandRight  относительные координаты   правое ладони

  // People.Point_KneeLeft  относительные координаты  левое колено
  // People.Point_KneeRight  относительные координаты   правое колено

  // People.Point_FootLeft    относительные координаты  левое стопа
  // People.Point_FootRight   относительные координаты   правое стопа

  count := 0;
  People.Point_Head := Point(5, -20);

  People.Point_Hips := Point(-35, 35);

  People.Point_ForeArmLeft := Point(-25, -25);
  People.Point_ForeArmRight := Point(25, 25);

  People.Point_HandLeft := Point(-50, -10);
  People.Point_HandRight := Point(40, 0);

  People.Point_KneeLeft := Point(-80, 50);
  People.Point_KneeRight := Point(-05, 70);

  People.Point_FootLeft := Point(-115, 25);
  People.Point_FootRight := Point(10, 100);

  personnel1[count] := People;
  inc(count);

  People.Point_Head := Point(14, -14);

  People.Point_Hips := Point(-30, 35);

  People.Point_ForeArmLeft := Point(-25, -15);
  People.Point_ForeArmRight := Point(25, 15);

  People.Point_HandLeft := Point(-70, -10);
  People.Point_HandRight := Point(60, 0);

  People.Point_KneeLeft := Point(0, 80);
  People.Point_KneeRight := Point(-20, 70);

  People.Point_FootLeft := Point(-70, 65);
  People.Point_FootRight := Point(-40, 120);

  personnel1[count] := People;
  inc(count);

  People.Point_Head := Point(5, -15);

  People.Point_Hips := Point(-30, 35);

  People.Point_ForeArmRight := Point(-25, 5);
  People.Point_ForeArmLeft := Point(10, 30);

  People.Point_HandRight := Point(-50, 35);
  People.Point_HandLeft := Point(45, 30);

  People.Point_KneeLeft := Point(20, 70);
  People.Point_KneeRight := Point(-50, 70);

  People.Point_FootLeft := Point(-20, 105);
  People.Point_FootRight := Point(-80, 100);

  // ------------------------
  personnel1[count] := People;
  inc(count);

  People.Point_Head := Point(8, -12);

  People.Point_Hips := Point(-35, 32);

  People.Point_ForeArmRight := Point(-25, -10);
  People.Point_ForeArmLeft := Point(8, 27);

  People.Point_HandRight := Point(-50, 24);
  People.Point_HandLeft := Point(26, 45);

  People.Point_KneeLeft := Point(12, 54);
  People.Point_KneeRight := Point(-56, 62);

  People.Point_FootLeft := Point(-10, 94);
  People.Point_FootRight := Point(-95, 95);
  // ------------------------

  personnel1[count] := People;
  inc(count);

  People.Point_Head := Point(12, -8);

  People.Point_Hips := Point(-40, 30);

  People.Point_ForeArmRight := Point(-25, -15);
  People.Point_ForeArmLeft := Point(-6, 25);

  People.Point_HandRight := Point(-50, 20);
  People.Point_HandLeft := Point(18, 60); // ****

  People.Point_KneeLeft := Point(-5, 43);
  People.Point_KneeRight := Point(-65, 55);

  People.Point_FootLeft := Point(0, 85);
  People.Point_FootRight := Point(-110, 90);

  personnel1[count] := People;
  inc(count);

  People.Point_Head := Point(7, -8);

  People.Point_Hips := Point(-25, 30);

  People.Point_ForeArmRight := Point(-25, 0);
  People.Point_ForeArmLeft := Point(20, 10);

  People.Point_HandRight := Point(-60, 5);
  People.Point_HandLeft := Point(50, 10);

  People.Point_KneeLeft := Point(10, 43);
  People.Point_KneeRight := Point(-70, 40);

  People.Point_FootLeft := Point(30, 75);
  People.Point_FootRight := Point(-100, 10);
  /// *************

  personnel1[count] := People;
  inc(count);

  People.Point_Head := Point(10, -10);

  People.Point_Hips := Point(-20, 35);

  People.Point_ForeArmRight := Point(-20, -5);
  People.Point_ForeArmLeft := Point(25, 15);

  People.Point_HandRight := Point(-65, 10);
  People.Point_HandLeft := Point(55, 5);

  People.Point_KneeLeft := Point(0, 70);
  People.Point_KneeRight := Point(-70, 65);

  People.Point_FootLeft := Point(10, 100);
  People.Point_FootRight := Point(-100, 50);

  personnel1[count] := People;
  inc(count);

  // *****************************************************
  People.Point_Head := Point(5, -20);

  People.Point_Hips := Point(-35, 35);

  People.Point_ForeArmRight := Point(-25, -25);
  People.Point_ForeArmLeft := Point(25, 25);

  People.Point_HandRight := Point(-50, -10);
  People.Point_HandLeft := Point(40, 0);

  People.Point_KneeRight := Point(-80, 50);
  People.Point_KneeLeft := Point(-05, 70);

  People.Point_FootRight := Point(-115, 25);
  People.Point_FootLeft := Point(10, 100);

  personnel1[count] := People;
  inc(count);

  People.Point_Head := Point(14, -14);

  People.Point_Hips := Point(-30, 35);

  People.Point_ForeArmLeft := Point(-25, -15);
  People.Point_ForeArmRight := Point(25, 15);

  People.Point_HandLeft := Point(-70, -10);
  People.Point_HandRight := Point(60, 0);

  People.Point_KneeRight := Point(0, 80);
  People.Point_KneeLeft := Point(-20, 70);

  People.Point_FootRight := Point(-70, 65);
  People.Point_FootLeft := Point(-40, 120);

  personnel1[count] := People;
  inc(count);

  People.Point_Head := Point(5, -15);

  People.Point_Hips := Point(-30, 35);

  People.Point_ForeArmLeft := Point(-25, 5);
  People.Point_ForeArmRight := Point(10, 30);

  People.Point_HandLeft := Point(-50, 35);
  People.Point_HandRight := Point(45, 30);

  People.Point_KneeRight := Point(20, 70);
  People.Point_KneeLeft := Point(-50, 70);

  People.Point_FootRight := Point(-20, 105);
  People.Point_FootLeft := Point(-80, 100);

  // ------------------------
  personnel1[count] := People;
  inc(count);

  People.Point_Head := Point(8, -12);

  People.Point_Hips := Point(-35, 32);

  People.Point_ForeArmLeft := Point(-25, -10);
  People.Point_ForeArmRight := Point(8, 27);

  People.Point_HandLeft := Point(-50, 24);
  People.Point_HandRight := Point(26, 45);

  People.Point_KneeRight := Point(12, 54);
  People.Point_KneeLeft := Point(-56, 62);

  People.Point_FootRight := Point(-10, 94);
  People.Point_FootLeft := Point(-95, 95);
  // ------------------------

  personnel1[count] := People;
  inc(count);

  People.Point_Head := Point(12, -8);

  People.Point_Hips := Point(-40, 30);

  People.Point_ForeArmRight := Point(-6, 25);
  People.Point_ForeArmLeft := Point(-25, -15);

  People.Point_HandRight := Point(18, 60); // ****
  People.Point_HandLeft := Point(-50, 20);

  People.Point_KneeRight := Point(-5, 43);
  People.Point_KneeLeft := Point(-65, 55);

  People.Point_FootRight := Point(0, 85);
  People.Point_FootLeft := Point(-110, 90);

  personnel1[count] := People;
  inc(count);

  People.Point_Head := Point(7, -8);

  People.Point_Hips := Point(-25, 30);

  People.Point_ForeArmRight := Point(20, 10);
  People.Point_ForeArmLeft := Point(-25, 0);

  People.Point_HandRight := Point(50, 10);
  People.Point_HandLeft := Point(-60, 5);

  People.Point_KneeRight := Point(10, 43);
  People.Point_KneeLeft := Point(-70, 40);

  People.Point_FootRight := Point(30, 75);
  People.Point_FootLeft := Point(-100, 10);

  personnel1[count] := People;
  inc(count);

  People.Point_Head := Point(10, -10);

  People.Point_Hips := Point(-20, 35);

  People.Point_ForeArmRight := Point(25, 15);
  People.Point_ForeArmLeft := Point(-20, -5);

  People.Point_HandRight := Point(55, 5);
  People.Point_HandLeft := Point(-65, 10);

  People.Point_KneeRight := Point(0, 70);
  People.Point_KneeLeft := Point(-70, 65);

  People.Point_FootRight := Point(10, 100);
  People.Point_FootLeft := Point(-100, 50);

  personnel1[count] := People;

  inc(count);

end;

procedure Createpersonnel2;
var
  People: TPerson;

  count: integer;
begin
  count := 0;

  People.Point_Head := Point(10, -20);

  People.Point_Hips := Point(-25, 50);

  People.Point_ForeArmRight := Point(-30, 10);
  People.Point_ForeArmLeft := Point(10, 20);

  People.Point_HandRight := Point(-50, 30);
  People.Point_HandLeft := Point(30, 20);

  People.Point_KneeRight := Point(0, 80);
  People.Point_KneeLeft := Point(-52, 80);

  People.Point_FootRight := Point(25, 110);
  People.Point_FootLeft := Point(-85, 60);

  personnel2[count] := People;

  inc(count);

  People.Point_Head := Point(12, -20);

  People.Point_Hips := Point(-25, 50);

  People.Point_ForeArmRight := Point(18, 16);
  People.Point_ForeArmLeft := Point(-20, 12);

  People.Point_HandRight := Point(36, 4);
  People.Point_HandLeft := Point(-32, 30);

  People.Point_KneeRight := Point(3, 77);
  People.Point_KneeLeft := Point(-48, 75);

  People.Point_FootRight := Point(-10, 110);
  People.Point_FootLeft := Point(-74, 64);

  personnel2[count] := People;

  inc(count);
  /// *** 3
  People.Point_Head := Point(12, -20);

  People.Point_Hips := Point(-25, 50);

  People.Point_ForeArmRight := Point(-10, 20);
  People.Point_ForeArmLeft := Point(-20, 10);

  People.Point_HandRight := Point(10, 30);
  People.Point_HandLeft := Point(-28, 32);

  People.Point_KneeRight := Point(-15, 80);
  People.Point_KneeLeft := Point(-12, 70);

  People.Point_FootRight := Point(-27, 110);
  People.Point_FootLeft := Point(-33, 98);

  personnel2[count] := People;

  inc(count);

  People.Point_Head := Point(12, -20);

  People.Point_Hips := Point(-25, 50);

  People.Point_ForeArmRight := Point(-5, 20);
  People.Point_ForeArmLeft := Point(-20, 10);

  People.Point_HandRight := Point(10, 35);
  People.Point_HandLeft := Point(-21, 31);

  People.Point_KneeRight := Point(-1, 77);
  People.Point_KneeLeft := Point(-37, 80);

  People.Point_FootRight := Point(6, 110);
  People.Point_FootLeft := Point(-65, 96);

  personnel2[count] := People;

  inc(count);
  /// *** 5
  People.Point_Head := Point(12, -20);

  People.Point_Hips := Point(-25, 50);

  People.Point_ForeArmRight := Point(-1, 25);
  People.Point_ForeArmLeft := Point(-20, 10);

  People.Point_HandRight := Point(18, 30);
  People.Point_HandLeft := Point(-27, 30);

  People.Point_KneeRight := Point(-1, 61);
  People.Point_KneeLeft := Point(-37, 80);

  People.Point_FootRight := Point(20, 100);
  People.Point_FootLeft := Point(-49, 110);

  personnel2[count] := People;

  inc(count);

  People.Point_Head := Point(12, -20);

  People.Point_Hips := Point(-25, 50);

  People.Point_ForeArmRight := Point(2, 21);
  People.Point_ForeArmLeft := Point(-19, 13);

  People.Point_HandRight := Point(23, 19);
  People.Point_HandLeft := Point(-27, 30);

  People.Point_KneeRight := Point(0, 60);
  People.Point_KneeLeft := Point(-36, 76);

  People.Point_FootRight := Point(12, 91);
  People.Point_FootLeft := Point(-60, 87);

  personnel2[count] := People;

  inc(count);

end;

end.
