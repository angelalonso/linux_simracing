import glob
import yaml
from jinja2 import Environment, FileSystemLoader
import shutil

def check_objects(struct):
    for i in struct:
        for k, v in i.items():
            print(v)
            print("-----------------------")

def create_files(struct, environment):
    template = environment.get_template("talent.template")
    car_template = environment.get_template("austin_mini_car.template")
    for i in struct:
        for k, v in i.items():
            if v[0]['year'] == 1998:
                talent_filename = f"Talent/{v[0]['name'].lower()}{v[0]['surname'].lower()}.rcd"
                content = template.render(
                    name = v[0]['name'],
                    surname = v[0]['surname'],
                    short = v[0]['short'],
                    nat_code = v[0]['nat_code'],
                    nationality = v[0]['nationality']
                )
                with open(talent_filename, mode="w", encoding="utf-8") as message:
                    message.write(content)
                    print(f"... wrote {talent_filename}")
                print("-----------------------")
                car_filename = f"Teams/AustinMini/MiniCooper/{v[0]['car_id']}_Mini_Cooper.car"
                car_content = car_template.render(
                    name = v[0]['name'],
                    surname = v[0]['surname'],
                    car_id = v[0]['car_id'],
                    year = v[0]['year']
                )
                with open(car_filename, mode="w", encoding="utf-8") as message:
                    message.write(car_content)
                    print(f"... wrote {car_filename}")
                print("-----------------------")
                src = f"Teams/AustinMini/MiniCooper/livery/{v[0]['livery']}.dds"
                dst = f"Teams/AustinMini/MiniCooper/{v[0]['car_id']}_Mini_Cooper_body1.dds"
                shutil.copy(src, dst)


def loadObjectsStruct(objects_file):
    try:
        with open(objects_file) as file:
            objects = yaml.load(file, Loader=yaml.FullLoader)
    except FileNotFoundError:
        return None
    return objects

if __name__ == '__main__':
    environment = Environment(loader=FileSystemLoader("templates/"))
    talent_file = "talent.yaml"
    objects_struct = loadObjectsStruct(talent_file)
    #check_objects(objects_struct)
    create_files(objects_struct, environment)
    ### Now do Teams
