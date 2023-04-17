def form_data() -> list:
    buff = []
    for x in range(10, 65, 5):
        buff.append(int(str(x), base=16))
    return buff
