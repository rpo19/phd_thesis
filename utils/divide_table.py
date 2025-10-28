
while True:
    ms=input()
    splitted = ms.split('&')
    print(splitted[0] + ' & '+ '&'.join(splitted[9:]))