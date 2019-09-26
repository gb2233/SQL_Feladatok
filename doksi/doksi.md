# CÍM

## Optimális indexek

## Indexek tárhely igénye
> 300MB tábla, 2 nonCL, 1 CL index
  eldobás hatása a méretre (%ban)
  
    [BookingID] int 4b
    [CustomerID] int 4b
    [CCountry] varchar(2) 4b (2+2)
    [DepartureStation] varchar(30) 32b (30+2)
    [Date] datetime 8b
    [Price] money 8b
    [Seats] int 4b 
    Row req: 70b (28 + [2+2*2+32] + 4 rowHeader)
    
    Clustered a BookingID-n automatikusan
    Row req 11b (4+1 rowHeader+6 childID)
    
    NC 2 szűk DepState & CID
    Row reqs 43b  <- 11b (4+1+6) & 32b (2+30)

    NEM számol vele: page veszteség, non-leaf page méret, tömörítés
    
    arányok: 70:54 -> 300M/124*70 -> 164M adat -> 45% csökkenés