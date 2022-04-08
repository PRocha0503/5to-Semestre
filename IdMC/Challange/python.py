import math
def recursive(x):
    if x == 0:
        return 1
    else:
        return x * recursive(x-1)
print(recursive(5))

def op():
    return (math.cos(math.pi/3) * pow(6,5)/24
)
print(math.floor(op()))
