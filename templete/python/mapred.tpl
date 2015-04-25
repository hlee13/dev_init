def mapper():
    for line in sys.stdin:
        line = line[:-1]

def reducer(day):
    for line in sys.stdin:
        line = line[:-1]

if __name__=="__main__":
    day = ""
    component = "mapper"

    for idx in range(1, len(sys.argv)) :
        if sys.argv[idx] == "-c":
            component = sys.argv[idx+1]

        if sys.argv[idx] == "-date":
            day = sys.argv[idx+1]

    if component == "mapper":
        mapper()

    if component == "reducer":
        reducer(day)
