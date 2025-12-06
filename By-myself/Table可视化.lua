function TableVisualization(Table)
	if type(Table) ~= 'table' then return end
	warn('table可视化输出:')
	local function forTable(ForTable,arg)
		arg = arg or ''
		for i,v in pairs(ForTable) do
			if type(v) == 'table' then print(arg..'[\''..tostring(i)..'\']') forTable(v,arg..'∣')
			else print(arg..'[\''..tostring(i)..'\'] -> '..tostring(v)) end
		end
	end
	forTable(Table)
end