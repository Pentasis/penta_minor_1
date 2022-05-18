local shader = {}
---------------------------------------------------------------------------------------------------
local function extendedParticleShaderSpace()
	return 130; -- size values above 130 are going to be consumed by extended shader
end

---------------------------------------------------------------------------------------------------
local function standardZeroOffset()
	return 5;
end

---------------------------------------------------------------------------------------------------
local function standardParticleSizeRange()
	return 20;
end

---------------------------------------------------------------------------------------------------
local function fireEffectShaderSpace()
	return { from = 0, zeroOffset = standardZeroOffset() };
end

---------------------------------------------------------------------------------------------------
local function oldDieselEffectShaderSpace()
	return { from = 20, zeroOffset = standardZeroOffset() };
end

---------------------------------------------------------------------------------------------------
local function newDieselEffectShaderSpace()
	return { from = 40, zeroOffset = standardZeroOffset() };
end

---------------------------------------------------------------------------------------------------
local function mainStackSteamShaderSpace()
	return { from = 60, zeroOffset = 0 }
end

---------------------------------------------------------------------------------------------------
local function clamp(_low, _value, _high)
	if _low > _high then
		_low, _high = _high, _low
	end

	if _value < _low then
		return _low
	end

	if _value > _high then
		return _high
	end

	return _value
end

---------------------------------------------------------------------------------------------------
function shader.fireEffectShaderParameters(_from, _to)

	local FireParticleSizeMin = -4.99
	local FireParticleSizeMax = 14.99

	_to = clamp(FireParticleSizeMin, _to, FireParticleSizeMax)
	_from = clamp(FireParticleSizeMin, _from, FireParticleSizeMax)

	local shaderSpace = fireEffectShaderSpace()

	return {
		extendedParticleShaderSpace() + shaderSpace.from + shaderSpace.zeroOffset + _from
		, extendedParticleShaderSpace() + shaderSpace.from + shaderSpace.zeroOffset + _to
	}
end

---------------------------------------------------------------------------------------------------
local function dieselParticleSizes()

	local DieselParticleSizeMin = -4.99;
	local DieselParticleSizeMax = 14.99;

	return { from = DieselParticleSizeMin, to = DieselParticleSizeMax }
end

---------------------------------------------------------------------------------------------------
function shader.oldDieselShaderParameters(_from, _to)

	local sizes = dieselParticleSizes()

	_from = clamp(sizes.from, _from, sizes.to)
	_to = clamp(sizes.from, _to, sizes.to)

	local shaderSpace = oldDieselEffectShaderSpace()

	return {
		extendedParticleShaderSpace() + shaderSpace.from + shaderSpace.zeroOffset + _from
		, extendedParticleShaderSpace() + shaderSpace.from + shaderSpace.zeroOffset + _to
	}
end

---------------------------------------------------------------------------------------------------
function shader.newDieselShaderParameters(_from, _to)

	local sizes = dieselParticleSizes()

	_from = clamp(sizes.from, _from, sizes.to)
	_to = clamp(sizes.from, _to, sizes.to)

	local shaderSpace = newDieselEffectShaderSpace()

	return {
		extendedParticleShaderSpace() + shaderSpace.from + shaderSpace.zeroOffset + _from
		, extendedParticleShaderSpace() + shaderSpace.from + shaderSpace.zeroOffset + _to
	}
end

---------------------------------------------------------------------------------------------------
function shader.mainStackSteamShaderParameters(_from, _to)

	local StackSteamParticleSizeMin = 0.01
	local StackSteamParticleSizeMax = 19.99

	_from = clamp(StackSteamParticleSizeMin, _from, StackSteamParticleSizeMax)
	_to = clamp(StackSteamParticleSizeMin, _to, StackSteamParticleSizeMax)

	local shaderSpace = mainStackSteamShaderSpace()

	return {
		extendedParticleShaderSpace() + shaderSpace.from + shaderSpace.zeroOffset + _from
		, extendedParticleShaderSpace() + shaderSpace.from + shaderSpace.zeroOffset + _to
	}
end

---------------------------------------------------------------------------------------------------
return shader