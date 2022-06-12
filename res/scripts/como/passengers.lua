local passengers = {}

local function changePassengerCapacity(filename, vehicle)
  if (vehicle.metadata.seatProvider.seats) then
    local vehicle_seat_amount = #vehicle.metadata.seatProvider.seats

    for index = 1, vehicle_seat_amount do
      if vehicle.metadata.seatProvider.seats[index].crew then
        vehicle_seat_amount = vehicle_seat_amount - 1  -- crew does not count as passenger
      end
    end
  end

end

-- ================================================================== --

function passengers.tweakPassengerSeats()
  addModifier("loadModel", changePassengerCapacity)
end

return passengers
