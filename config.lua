Config = {}

Config.Locale = 'en'

Config.Props = 'prop_rock_5_e'  --<<<----- P r o p

Config.TimePickup = 7			--<<<----- ร ะ ย ะ เ ว ล า เ ก็ บ ห อ ย (ตั้งเป็น "วินาที" )

Config.TimeWasAndhPack = 3		--<<<----- ร ะ ย ะ เ ว ล า ล้ า ง & เ พ็ ค (ตั้งเป็น "วินาที" )

Config.DistanceMarker = 20		--<<<----- ร ะ ย ะ ก า ร ม อ ง ข อ ง สั ญ ลั ก ษ ณ์ 

Config.MarkerType   = 25 		--<<<----- สั ญ ลั ก ษ ณ์

Config.MarkerSize   = { 		--<<<----- ข น า ด ข อ ง  สั ญ ลั ก ษ ณ์
	x = 0.8, 
	y = 0.8, 
	z = 0.3,
}

Config.MarkerColor = {			--<<<----- สี ข อ ง สั ญ ลั ก ษ ณ์
	r = 41, 
	g = 11, 
	b = 41,
	a = 100, 					--<<<----- ค ว า ม ค ม ชั ด
}

Config.Zones = {
	CocklesField 		=	{coords = vector3(-283.25, 907.94, 200.08)},
	Washing1 			= 	{coords = vector3(-188.14, 786.35, 197.16)},
	Washing2 			=	{coords = vector3(-191.71, 788.78, 197.16)},
	Washing3 			= 	{coords = vector3(-195.43, 791.40, 197.16)},
	Washing4 			=	{coords = vector3(-198.72, 793.65, 197.16)},
	Packing1 			=	{coords = vector3(161.86, -1448.25, 28.29)},
	Packing2 			=	{coords = vector3(159.54, -1446.27, 28.29)},
}

Config.Blips = {				--<<<----- สั ญ ลั ก ษ ณ์ ใ น แ ม พ
	CocklesField = {coords = vector3(-283.25, 907.94, 200.08), name = 'Cockles Field', color = 64, sprite = 177},
	CocklesWashing = {coords = vector3(-191.71, 788.78, 197.16), name = 'Cockles Washing', color = 64, sprite = 177},
	CocklesPacking = {coords = vector3(161.86, -1448.25, 29.24), name = 'Cockles Packing', color = 64, sprite = 177},
}
