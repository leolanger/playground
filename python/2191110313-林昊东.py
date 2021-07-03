class StrExcept(Exception):
    pass


class AgeExcept(Exception):
    pass


class SalaryExcept(Exception):
    pass


while True:
    try:
        x = input("名字（2-20）字符：")
        if len(x) < 2 or len(x) > 20:
            raise StrExcept
        y = int(input("年龄（18-60):"))
        if y < 18 or y > 60:
            raise AgeExcept
        z = int(input("月收入（大于800):"))
        if z < 800:
            raise SalaryExcept
        print("姓名：", x)
        print("年龄：", y)
        print("年收入", z)

        break

    except StrExcept:
        print('输入名称异常')
    except AgeExcept:
        print('输入年龄异常')
    except SalaryExcept:
        print('输入工资异常')
    except Exception as e:
        print('输入', e)
