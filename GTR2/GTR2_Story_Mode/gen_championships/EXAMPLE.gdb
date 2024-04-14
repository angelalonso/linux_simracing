Game Name = CAREER 001 @ HSR
Game Filter = OR: alfa147
Selection Filter = 
AI Filter = 

IgnoreTrackFilter

Opponents = 19

AIStrength = 100
AIRealism = 0.75
MinPlacement = 1

Full Course Yellows = 1    // OFF = 0, ON = 1
Flag Rules = 3             // NONE = 0, BLACK_ONLY = 1, ALL = 3
Time Scaled Weather = 0    // OFF = 0, ON = 1
Time Scale Factor = 1
Safetycar Threshold = 2.0
Fuel Multiplier = 1
Tire Multiplier = 1

SpecialClasses
{
  alfa147 = Alfa Romeo 147 GT-R
}

Drafting
{
  BaseDropoff=0.195 // higher number -> more drafting effect
  LeadingExponent=2.0 // higher number -> lower effect on leader
  FollowingExponent=2.0 // higher number -> lower effect on followers
}

CategoryLists = 1

Category
{
  alfa147 = Alfa Romeo 147 GT-R
}

ComparativeCategory
{
}

DefaultScoring
{
  RacePitKPH = 80
  NormalPitKPH = 80
  FormationSpeedKPH = 80
  Practice1Day = Friday
  Practice1Start = 15:00
  Practice1Duration = 90
  Qualify1Day = Friday
  Qualify1Start = 12:00
  Qualify1Duration = 30
  Qualify1Laps = 30
  WarmupDay = Saturday
  WarmupStart = 14:30
  WarmupDuration = 15
  RaceDay = Saturday
  RaceStart = 15:00
  RaceLaps = 1
  RaceTime = 60
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

SceneOrder
{
 FHSRForward
 {
  AIStrength = 100
  Weather = 1 # 0 = Changing, 1 = Sunny, 2 = Light Rain(?), 3 = Rain
  StartMode = StandingStart
  Max Vehicles = 19
  RaceStart = 15:00
  RaceLaps = 1
 }
 FHSRForward
 {
  AIStrength = 110
  Weather = 1 # 0 = Changing, 1 = Sunny, 2 = Light Rain(?), 3 = Rain
  StartMode = StandingStart
  Max Vehicles = 19
  RaceStart = 15:00
  RaceLaps = 1
 }
 FHSRForward
 {
  AIStrength = 120
  Weather = 1 # 0 = Changing, 1 = Sunny, 2 = Light Rain(?), 3 = Rain
  StartMode = StandingStart
  Max Vehicles = 19
  RaceStart = 15:00
  RaceLaps = 1
 }
}

alfa147_WeightPenalty
{
  Maximum     = 0
  FirstPlace  = 0
  SecondPlace = 0
  ThirdPlace  = 0
  FourthPlace = 0
  FifthPlace  = 0
  Default     = 0
}
