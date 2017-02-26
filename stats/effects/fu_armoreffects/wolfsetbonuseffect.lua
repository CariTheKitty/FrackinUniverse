setName="fu_wolfset"

weaponEffect={
    {stat = "critBonus", baseMultiplier = 1.20}
  }
  
armorBonus={
    {stat = "iceResistance", amount = 0.50},
    {stat = "iceStatusImmunity", amount = 1},
    {stat = "snowslowImmunity", amount = 1}
}

require "/stats/effects/fu_armoreffects/setbonuses_common.lua"

function init()
	setSEBonusInit(setName)
	weaponHandle=effect.addStatModifierGroup({})
	daggerCheck()
	armorHandle=effect.addStatModifierGroup(armorBonus)
end

function update()
	if not checkSetWorn(self.setBonusCheck) then
		effect.expire()
	else
		daggerCheck()
	end	
end

function daggerCheck()
	if weaponCheck("both",{"dagger","knife"},false) then
		effect.setStatModifierGroup(weaponHandle,weaponEffect)
	else
		effect.setStatModifierGroup(weaponHandle,{})
	end
end