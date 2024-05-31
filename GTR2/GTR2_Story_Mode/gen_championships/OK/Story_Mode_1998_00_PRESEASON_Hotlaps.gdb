Game Name = Story Mode 1998 00 PRESEASON @ Hotlaps
Game Filter = OR: MiniCooper_1998
IgnoreTrackFilter
SkipPractice2
SkipQualifying2
SkipWarmup
Selection Filter = 
AI Filter = 
Opponents = 19
AIStrength = 100
AIRealism = 0.75
MinPlacement = 1
Full Course Yellows = 1
Flag Rules = 3
Time Scaled Weather = 0
Time Scale Factor = 1
Safetycar Threshold = 2.0
Fuel Multiplier = 1
Tire Multiplier = 1

Drafting
{
  BaseDropoff = 0.195
  LeadingExponent = 2.0
  FollowingExponent = 2.0
}

DefaultScoring
{
  RacePitKPH = 80
  NormalPitKPH = 80
  FormationSpeedKPH = 80
  Practice1Day = Friday
  Practice1Start = 12:00
  Practice1Duration = 30
  Practice2Day = Friday
  Practice2Start = 15:00
  Practice2Duration = 30
  Qualify1Day = Saturday
  Qualify1Start = 12:00
  Qualify1Duration = 30
  Qualify1Laps = 30
  Qualify2Day = Saturday
  Qualify2Start = 12:00
  Qualify2Duration = 30
  Qualify2Laps = 30
  WarmupDay = Sunday
  WarmupStart = 14:30
  WarmupDuration = 15
  RaceDay = Sunday
  RaceStart = 15:00
  RaceTimeScaled = 60
  SkipPractice2 = True
  SkipQualifying2 = True
  SkipWarmup = True
  RaceLaps = 1
  RaceTime = 2
}

SeasonScoringInfo
{
 FirstPlace = 25
 SecondPlace = 18
 ThirdPlace = 15
 FourthPlace = 12
 FifthPlace = 10
 SixthPlace = 8
 SeventhPlace = 6
 EighthPlace = 4
 NinthPlace = 2
 TenthPlace = 1
}

SpecialClasses
{
  MiniCooper_1998 = Mini Cup 1998
}

CategoryLists = 1
Category
{
  MiniCooper_1998 = Mini Cup 1998
}

ComparativeCategory
{
}

MiniCooper_1998_WeightPenalty
{
  Maximum     = 0
  FirstPlace  = 0
  SecondPlace = 0
  ThirdPlace  = 0
  FourthPlace = 0
  FifthPlace  = 0
  Default     = 0
}
SceneOrder
{
  FHSRForward
  {
    track = FHSRForward
    StartMode = FormationRollingStart
    Qualify1Duration = 45
    RaceLaps = 1
    AIStrength = 120
  }
  Goodwood
  {
    track = Goodwood
    StartMode = FormationRollingStart
    Qualify1Duration = 45
    RaceLaps = 1
    AIStrength = 100
  }
}
