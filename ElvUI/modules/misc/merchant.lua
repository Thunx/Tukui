local E, C, L, DB = unpack(select(2, ...)) -- Import Functions/Constants, Config, Locales


local f = CreateFrame("Frame")
f:SetScript("OnEvent", function()
	if C["others"].sellgrays then
		local c = 0
		for b=0,4 do
			for s=1,GetContainerNumSlots(b) do
				local l = GetContainerItemLink(b, s)
				if l then
					local p = select(11, GetItemInfo(l))*select(2, GetContainerItemInfo(b, s))
					if select(3, GetItemInfo(l))==0 and p>0 then
						UseContainerItem(b, s)
						PickupMerchantItem()
						c = c+p
					end
				end
			end
		end
		if c>0 then
			local g, s, c = math.floor(c/10000) or 0, math.floor((c%10000)/100) or 0, c%100
			DEFAULT_CHAT_FRAME:AddMessage(L.merchant_trashsell.." |cffffffff"..g..L.goldabbrev.." |cffffffff"..s..L.silverabbrev.." |cffffffff"..c..L.copperabbrev..".",255,255,0)
		end
	end
	if not IsShiftKeyDown() then
		if CanMerchantRepair() then
			local cost = GetRepairAllCost()
			if C["others"].guildbankrepair then	
				if (IsInGuild()) and (CanGuildBankRepair()) then
					if cost <= GetGuildBankWithdrawMoney() then
						guildRepairFlag = 1
					end
				end
				if cost>0 then
					if (possible or guildRepairFlag) then
						RepairAllItems(guildRepairFlag)
						local c = cost%100
						local s = math.floor((cost%10000)/100)
						local g = math.floor(cost/10000)
							if guildRepairFlag == 1 then
								DEFAULT_CHAT_FRAME:AddMessage(L.merchant_guildrepaircost.." |cffffffff"..g..L.goldabbrev.." |cffffffff"..s..L.silverabbrev.." |cffffffff"..c..L.copperabbrev..".",255,255,0)
							end
					elseif C["others"].autorepair then
						if cost>0 then
							if possible then
								RepairAllItems()
								local c = cost%100
								local s = math.floor((cost%10000)/100)
								local g = math.floor(cost/10000)
								DEFAULT_CHAT_FRAME:AddMessage(L.merchant_repaircost.." |cffffffff"..g..L.goldabbrev.." |cffffffff"..s..L.silverabbrev.." |cffffffff"..c..L.copperabbrev..".",255,255,0)
							else
								DEFAULT_CHAT_FRAME:AddMessage(L.merchant_repairnomoney,255,0,0)
							end
						end
					end
				end
			end
			if (not C["others"].guildbankrepair) and C["others"].autorepair then
				if cost>0 then
					if possible then
						RepairAllItems()
						local c = cost%100
						local s = math.floor((cost%10000)/100)
						local g = math.floor(cost/10000)
						DEFAULT_CHAT_FRAME:AddMessage(L.merchant_repaircost.." |cffffffff"..g..L.goldabbrev.." |cffffffff"..s..L.silverabbrev.." |cffffffff"..c..L.copperabbrev..".",255,255,0)
					else
						DEFAULT_CHAT_FRAME:AddMessage(L.merchant_repairnomoney,255,0,0)
					end
				end
			end
		end
	end
end)
f:RegisterEvent("MERCHANT_SHOW")

-- buy max number value with alt
local savedMerchantItemButton_OnModifiedClick = MerchantItemButton_OnModifiedClick
function MerchantItemButton_OnModifiedClick(self, ...)
	if ( IsAltKeyDown() ) then
		local itemLink = GetMerchantItemLink(self:GetID())
		if not itemLink then return end
		local maxStack = select(8, GetItemInfo(itemLink))
		if ( maxStack and maxStack > 1 ) then
			BuyMerchantItem(self:GetID(), GetMerchantItemMaxStack(self:GetID()))
		end
	end
	savedMerchantItemButton_OnModifiedClick(self, ...)
end