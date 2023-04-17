from utils import form_data


def run():
    buff = [0, 0, 0]
    coef = [1, 2, 3]
    data = form_data()
    print(data)
    for d in data:
        res = 0
        buff[0] = buff[1]
        buff[1] = buff[2]
        buff[2] = d
        for i in range(3):
            res += coef[i]*buff[i]
        print(res)


run()
