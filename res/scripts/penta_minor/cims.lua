local cims = {}

local charList = {
    era_a_driver_rail = { 0, 1935 },
    era_a_driver_road = { 0, 1921 },
    era_a_driver_water = { 0, 1935 },
    era_a_man_01 = { 0, 1948 },
    era_a_man_02 = { 0, 1949 },
    era_a_man_03 = { 0, 1936 },
    era_a_man_04 = { 0, 1950 },
    era_a_wom_01 = { 0, 1942 },
    era_a_wom_02 = { 0, 1937 },
    era_a_wom_03 = { 0, 1941 },
    era_a_wom_04 = { 0, 1950 },
    era_b_driver_air_indoor = { 0, 1992 },
    era_b_driver_air_outdoor = { 1979, 1987 },
    era_b_driver_rail = { 1919, 1981 },
    era_b_driver_road = { 1921, 1976 },
    era_b_driver_water = { 1920, 1990 },
    era_b_man_01 = { 1922, 1995 },
    era_b_man_02 = { 1928, 1987 },
    era_b_man_03 = { 1926, 2000 },
    era_b_man_04 = { 1926, 1995 },
    era_b_wom_01 = { 1925, 2000 },
    era_b_wom_02 = { 1927, 1980 },
    era_b_wom_03 = { 1928, 1995 },
    era_b_wom_04 = { 1929, 1983 },
    era_c_driver_air = { 1975, 0 },
    era_c_driver_rail = { 1979, 0 },
    era_c_driver_road = { 1976, 0 },
    era_c_driver_water = { 1979, 0 },
    era_c_man_01 = { 1974, 0 },
    era_c_man_02 = { 1980, 0 },
    era_c_man_03 = { 1986, 0 },
    era_c_man_04 = { 1993, 0 },
    era_c_wom_01 = { 1995, 0 },
    era_c_wom_02 = { 1984, 0 },
    era_c_wom_03 = { 1976, 0 },
    era_c_wom_04 = { 1980, 0 }
}

local carList = {
    avant = { 1934, 1977 },
    beetle_1948 = { 1945, 1989 },
    cadillac_s62_deville = { 1959, 1985 },
    chevrolet_master_deluxe = { 1939, 1965 },
    citroen_hp5_typ_c = { 1922, 1956 },
    coach_01 = { 1850, 1900 },
    coach_02 = {},
    coach_03 = {},
    coach_04 = {},
    coach_05 = {},
    coach_06 = {},
    corolla = { 1983, 0 },
    ford_fordor_1934 = { 1927, 1962 },
    ford_f_series = { 1948, 1982 },
    ford_model_t = { 1900, 1947 },
    gaz_22_wolga = { 1956, 1992 },
    haval_h6 = { 2011, 0 },
    kim_10_50 = { 1940, 1969 },
    lada_riva_2107 = { 1980, 2012 },
    lincoln_town_car = { 1990, 0 },
    nissan_datsun_240z = { 1969, 1998 },
    opel_kadett_e_carevan = { 1984, 0 },
    opel_limo = { 1998, 0 },
    pickup_1978 = { 1973, 2008 },
    renault_4_f4_fourgonnette = { 1961, 2004 },
    subaru_legacy_kombi = { 2003, 0 },
    tatra_600 = { 1948, 1972 },
    toyota_mirai = { 2014, 0 },
    trabant = { 1957, 1990 },
    vw_golf_1 = { 1974, 0 },
    vw_santana = { 1983, 0 },
    vw_touran = { 2010, 0 },
    vw_type_2_t1 = { 1950, 1990 }
}

local function GetFileName(url)
    return url:match("^.+/(.+)$")
end

local function changeWardrobe(filename, character)
    local charName = ""

    if string.find(filename, "/model/characters/") ~= nil then
        charName = GetFileName(filename)
        charName = string.sub(charName, 1, -5)
        print(charName)
        if charlist[charName] ~= nil then
            character.metadata.availability.yearFrom = charlist[charName][1]
            character.metadata.availability.yearTo = charlist[charName][2]
        end
    end

    return character
end

local function changeCars(filename, car)
    local carName = ""

    if string.find(filename, "/model/vehicle/car/") ~= nil then
        carName = GetFileName(filename)
        carName = string.sub(carName, 1, -5)
        print(carName)
        if carlist[carName] ~= nil then
            car.metadata.availability.yearFrom = carlist[carName][1]
            car.metadata.availability.yearTo = carlist[carName][2]
        end
    end

    return car
end

local function workAtIndustry(filename, industry)
    local updateFn = industry.updateFn
    if industry.type == "INDUSTRY" then
        industry.updateFn = function(params)
            local result = updateFn(params)
            if result.rule ~= nil and not result.personCapacity then
                result.personCapacity = {
                    type = "INDUSTRIAL",
                    capacity = math.ceil(result.rule.capacity / 4),
                }
            end

            return result
        end
    end

    return industry
end

function cims.changeBehaviour()
    addModifier("loadModel", changeWardrobe)
    addModifier("loadModel", changeCars)
    addModifier("loadConstruction", workAtIndustry)
end

return cims