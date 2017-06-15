println("Wprowadz liczbe, na ktorej chcesz przeprowadzic faktoryzacje.")
N = tryparse(BigInt, readline())
if isnull(N)
    println("Prosze wpisac poprawna liczbe")
    exit(0)
end
if N.value < 0
    println("Prosze wpisac wartosc dodatnia")
end
a = 2
topBound = 60
for i in range(2,topBound)
    fact = factorial(BigInt(i))
    a = powermod(a, fact, N.value)
    d = gcd(a-1, N.value)
    if d < N.value && d > 1 && isprime(d)
        q = BigInt(N.value/d)
        if isprime(q)
            println("Faktoryzacja udana. Twoje p i q wynosza kolejno: ", d," ", q)
            exit(0)
        end
    end
end
println("Faktoryzacja zakonczona niepowodzeniem")
exit(0)
