Game Name = 2001 Story Mode 01 Formula BMW M3 E46 Tour
Game Filter = OR: e46sport OR: 2003


AIStrength = 110
AIRealism = 0.75
Full Course Yellows = 1
Flag Rules = 3
Time Scaled Weather = 0
Time Scale Factor = 1
Safetycar Threshold = 2.0
Fuel Multiplier = 1
Tire Multiplier = 1

SkipPractice1
SkipWarmUp


SpecialClasses
{
  e46sport = BMW E46
  GT_2003 = FIA GT 2003
  NG_2003 = FIA NGT 2003
}

Drafting
{
  BaseDropoff = 0.195
  LeadingExponent = 2.0
  FollowingExponent = 2.0
}

CategoryLists = 3

Category
{
  e46sport = BMW E46
  GT_2003 = GT
  NG_2003 = NGT
}

DefaultScoring
{
  RacePitKPH = 80
  NormalPitKPH = 80
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
  RaceStart = 12:00
  RaceLaps = 15
  RaceTime = 15
  RaceTimeScaled = 60
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

e46sport_WeightPenalty
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
  12Suzuka
  {
    track = 12Suzuka
    Weather = 1
    AIStrength = 110
    AIRealism = 1.5
    RaceLaps = 15
    RaceTime = 15
  }
}
