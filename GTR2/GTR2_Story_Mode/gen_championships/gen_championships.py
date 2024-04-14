import glob
import sys
import yaml
import shutil

def loadObjectsStruct(objects_file):
    try:
        with open(objects_file) as file:
            objects = yaml.load(file, Loader=yaml.FullLoader)
    except FileNotFoundError:
        return None
    return objects

def create_txt(struct):
    for i in struct:
        for k, v in i.items():
            filename = k.replace(" @ ", "_").replace(" ", "_").replace(".", "") + ".txt"
            f = open(filename,"w") 
            f.writelines("<CHAMP_ICON>\n")
            f.writelines("<CHAMP_TROPHY>\n")
            f.writelines("<SET_FONT>\n")
            f.writelines("FT_LISTBOX_InPit\n")
            f.writelines(k + "\n")
            f.writelines("<SET_FONT>\n")
            f.writelines("FT_LISTBOX_HEADER\n\n")
            nr_races = len(v[0]['races'])
            f.writelines("Rounds: " + str(nr_races) + "\n\n")

            f.writelines("<DRIVER_NAME>\n")
            f.writelines("<CHAMP_STATUS>\n")
            f.writelines("<BEST_FINISH>\n")
            f.writelines("<DRIVER_POSITION>\n")
            f.writelines("<TEAM_POSITION>\n")
            f.writelines("<CATEGORY>\n")
            f.writelines("<CAT_DRIVER_POSITION>\n")
            f.writelines("<CAT_TEAM_POSITION>\n")
            f.writelines("NEXT_ROUND>\n\n")
            f.writelines("SET_FONT>\n")
            f.writelines("FT_Standard_TEXT_SMALL\n")
            descript = v[0]['description']
            f.writelines(descript)

            f.close()

def get_base_params():
    result = {
            'Selection Filter': '',
            'AI Filter': '',
            'AIStrength': '100',
            'AIRealism': '0.75',
            'MinPlacement': '1',
            'Full Course Yellows': '1',
            'Flag Rules': '3',
            'Time Scaled Weather': '0',
            'Time Scale Factor': '1',
            'Safetycar Threshold': '2.0',
            'Fuel Multiplier': '1',
            'Tire Multiplier': '1',
            }
    return result
    
def get_base_tags():
    result = [
            'IgnoreTrackFilter',
            ]
    return result
    
def get_drafting_params():
    result = {
            'BaseDropoff': '0.195',
            'LeadingExponent': '2.0',
            'FollowingExponent': '2.0',
            }
    return result
    
def get_defaultscoring_params():
    result = {
            'RacePitKPH': '80',
            'NormalPitKPH': '80',
            'FormationSpeedKPH': '80',
            'Practice1Day': 'Friday',
            'Practice1Start': '12:00',
            'Practice1Duration': '30',
            'Practice2Day': 'Friday',
            'Practice2Start': '15:00',
            'Practice2Duration': '30',
            'Qualify1Day': 'Saturday',
            'Qualify1Start': '12:00',
            'Qualify1Duration': '30',
            'Qualify1Laps': '30',
            'Qualify2Day': 'Saturday',
            'Qualify2Start': '12:00',
            'Qualify2Duration': '30',
            'Qualify2Laps': '30',
            'WarmupDay': 'Sunday',
            'WarmupStart': '14:30',
            'WarmupDuration': '15',
            'RaceDay': 'Sunday',
            'RaceStart': '15:00',
            'RaceTimeScaled': '60',
            }
    return result
    
def create_gdb(struct):
    base_struct = get_base_params()
    for i in struct:
        for k, v in i.items():
            filename = k.replace(" @ ", "_").replace(" ", "_").replace(".", "") + ".gdb"
            f = open(filename,"w") 
            f.writelines("Game Name = " + k + "\n")
            cardict = v[0]['cars']
            car_id = ""
            car_desc = ""
            for k2, v2 in cardict.items():
                car_id = k2
                car_desc = v2
            f.writelines("Game Filter = OR: " + car_id + "\n") # 
            #---- 
            for t in get_base_tags():
                f.writelines(t + "\n") 
            #---- 
            for t in ['SkipPractice1', 'SkipPractice2', 'SkipQualifying1', 'SkipQualifying2', 'SkipWarmup']:
                try:
                    if v[0][t] == True:
                        f.writelines(t + "\n") 
                except KeyError:
                    pass
            #----
            for pk, pv in get_base_params().items():
                try:
                    f.writelines("  " + pk + " = " + str(v[0][pk]) + "\n") 
                except KeyError:
                    f.writelines(pk + " = " + pv + "\n") 
            f.writelines("\n")
            #----
            f.writelines("Drafting\n{\n")
            for pk, pv in get_drafting_params().items():
                try:
                    f.writelines("  " + pk + " = " + str(v[0][pk]) + "\n") 
                except KeyError:
                    f.writelines("  " + pk + " = " + pv + "\n") 
            f.writelines("}\n\n")
            #----
            f.writelines("DefaultScoring\n{\n")
            defaultscoring_params = get_defaultscoring_params()
            scoring_params = defaultscoring_params | v[0]
            scoring_params_excpt = [
                    'track',
                    'description',
                    'cars',
                    'Weather',
                    'StartMode',
                    'Max Vehicles',
                    'races',
                    ]
            for pk, pv in scoring_params.items():
                if pk not in scoring_params_excpt:
                    f.writelines("  " + pk + " = " + str(pv) + "\n") 
            f.writelines("}\n\n")
            #---- The following I don't plan on making adjustable
            f.writelines("SeasonScoringInfo\n{\n")
            f.writelines(" FirstPlace = 25\n")
            f.writelines(" SecondPlace = 18\n")
            f.writelines(" ThirdPlace = 15\n")
            f.writelines(" FourthPlace = 12\n")
            f.writelines(" FifthPlace = 10\n")
            f.writelines(" SixthPlace = 8\n")
            f.writelines(" SeventhPlace = 6\n")
            f.writelines(" EighthPlace = 4\n")
            f.writelines(" NinthPlace = 2\n")
            f.writelines(" TenthPlace = 1\n}\n\n")
            f.writelines("SpecialClasses\n{\n")
            f.writelines("  " + car_id + " = " + car_desc + "\n}\n\n") #
            f.writelines("CategoryLists = 1\n")
            f.writelines("Category\n{\n")
            f.writelines("  " + car_id + " = " + car_desc + "\n}\n\n") #
            f.writelines("ComparativeCategory\n{\n}\n\n")
            f.writelines(car_id + "_WeightPenalty\n{\n")
            f.writelines("  Maximum     = 0\n")
            f.writelines("  FirstPlace  = 0\n")
            f.writelines("  SecondPlace = 0\n")
            f.writelines("  ThirdPlace  = 0\n")
            f.writelines("  FourthPlace = 0\n")
            f.writelines("  FifthPlace  = 0\n")
            f.writelines("  Default     = 0\n}\n")
            # Races # move some parameters out of here?
            f.writelines("SceneOrder\n{\n")
            for c in v[0]['races']: 
                # Track ID has no default possible, checked by hand
                try:
                    trck = c['track']
                except KeyError:
                    try:
                        trck = v[0]['track']
                    except KeyError:
                        print("No track provided for the race, and no default is possible")
                        sys.exit(2)
                f.writelines("  " + trck + "\n  {\n")
                for pk, pv in c.items():
                    if "race_" not in pk:
                        f.writelines("    " + str(pk) + " = " + str(pv) + "\n")
                f.writelines("  }\n")
            f.writelines("}\n\n")
            # Move up?


            f.close()

def build_gdb_entry(race, champ, entry, default, prefix, suffix):
    try:
        value = race[entry]
    except KeyError:
        try:
            value = champ[entry]
        except KeyError:
            if default != '':
                value = default # Default is Starting at 13:00
            else:
                value = ''
                print("No value provided for " + entry + ", and no default is possible")
                sys.exit(2)
    result = prefix + str(entry) + " = " + str(value) + suffix
    return result
    
def create_tga(struct):
    source = "EXAMPLE.tga"
    for i in struct:
        for k, v in i.items():
            filename = k.replace(" @ ", "_").replace(" ", "_").replace(".", "") + ".tga"
            shutil.copyfile(source, filename)

def create_files(struct):
    create_txt(struct)
    create_gdb(struct)
    create_tga(struct)

def check_objects(struct):
    '''
    We divide the yaml objects into:
    - One champonship with its own parameters
      - One entry for each race
    
    '''
    for i in struct:
        for k, v in i.items():
            for c in v[0]['races']: 
                # Track ID has no default possible, checked by hand
                for p in c:
                    print(p)
            print("-----------------------")

if __name__ == '__main__':
    #file_list = glob.glob("test.yaml")
    file_list = glob.glob("list*.yaml")
    for champ_file in file_list:
        objects_struct = loadObjectsStruct(champ_file)
        #check_objects(objects_struct)
        create_files(objects_struct)


