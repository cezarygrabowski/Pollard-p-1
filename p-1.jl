function gcd(a::UInt128, b::UInt128)
    c = 0
    while b != 0
       c = a % b
       a = b
       b = c 
    end
    return a
end

function fastPower(base::UInt128, component::UInt128, modulo::UInt128)
    result = 1
    while component > 0
        if component % 2 == 1
            result = (result * base) % modulo
        end
        base = (base * base) % modulo
        component /= 2
    end
    return result
end

function getNextRelatevilyPrime(oldNumber::UInt128, modulo::UInt128)
   flag = true;
   while true
        oldNumber += 1
        if gcd(oldNumber, modulo) == 1
            return oldNumber
        end
    end
end

function getFactorial(n)
    factorial = convert(UInt128, 1)
    for i in range(1,n)
        factorial *= i
    end
    return factorial
end

function isPrime(n::UInt128)
    i=0
    isPrime = true

    for i in range(2, round(UInt128, n/2))
        if n % i == 0
            isPrime == false
            break;
        end
    end
    return isPrime
end

function getOneFactorOfN(a::UInt128, N::UInt128)
    i=0
    d=0
    for i in range(2,100)
        d = gcd(fastPower(a, convert(UInt128, getFactorial(i)), N) - 1, N)
        if d == N
            a = getNextRelatevilyPrime(a, N)
        elseif d != N && d > 1 && d % 2 == 1
            return d
        end
    end
    return 0
end

println("Wprowadz liczbe, na ktorej chcesz przeprowadzic faktoryzacje.")
N = parse(UInt128, readline(STDIN))

q = 0
p = 0
a = convert(UInt128, 2)
topValue = 30
while true
    p = getOneFactorOfN(a, N)
    if p != 0
        q = round(UInt128, N / p)
        if isPrime(p) && isPrime(q)
            println("Faktoryzacja udana. Twoje p i q wynosza kolejno: ", p," ", q)
            return 0
        end
    end
    a = getNextRelatevilyPrime(a, N)
    topValue -= 1
    if(topValue == 0)
        println("Faktoryzacja zakonczona niepowodzeniem.")
        return 0
    end
end