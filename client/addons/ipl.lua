RemoveImap(174727090)  -- Unknown, possibly causing CTDs
--
local isLoaded = false

Citizen.CreateThread(function()
    while not isLoaded do
        Citizen.Wait(1)
        local interior = GetInteriorAtCoords(-308.88, 777.37, 118.77)
        local isValid = IsValidInterior(interior)
        if isValid then
            if IsInteriorEntitySetActive(interior, "val_bank_front_windows") then
                --("Valentine Bank Interior Already Active")
            else
                ActivateInteriorEntitySet(interior, "val_bank_int_curtainsopen")
                ActivateInteriorEntitySet(interior, "val_bank_front_windows")
                --("Valentine Bank Interior Activated")
            end
        end

        local interior = GetInteriorAtCoords(-310.0119, 802.9316, 117.9846)
        local isValid = IsValidInterior(interior)
        if isValid then
            if IsInteriorEntitySetActive(interior, "front_windows") then
                --("Valentine Saloon Interior Already Active")
            else
                ActivateInteriorEntitySet(interior, "front_windows")
                ActivateInteriorEntitySet(interior, "val_saloon_br03_bed")
                ActivateInteriorEntitySet(interior, "6_chair_poker_set")
                --("Valentine Saloon Interior Activated")
            end
        end

        local interior = GetInteriorAtCoords(-273.4513, 811.3408, 118.38)
        local isValid = IsValidInterior(interior)
        if isValid then
            if IsInteriorEntitySetActive(interior, "val_jail_int_walla") then
                --("Valentine Jail Interior Already Active")
            else
                ActivateInteriorEntitySet(interior, "val_jail_int_walla")
                ActivateInteriorEntitySet(interior, "val_jail_int_wallb")
                --("Valentine Jail Interior Activated")
            end
        end

        local interior = GetInteriorAtCoords(323.0087, 801.0296, 116.8817)
        local isValid = IsValidInterior(interior)
        if isValid then
            if IsInteriorEntitySetActive(interior, "val_genstore_night_light") then
                --("Valentine General Store Nightlight Activated")
            else
                ActivateInteriorEntitySet(interior, "val_genstore_night_light")
                --("Valentine General Store Nightlight Activated")
            end
        end

        local interior = GetInteriorAtCoords(3287.9997558594,-1312.0001220703,44.0)
        local isValid = IsValidInterior(interior)
        if isValid then
            if IsInteriorEntitySetActive(interior, "korrigan_props_default") and IsInteriorEntitySetActive(interior, "korrigan_props_poker") then
                --("Riverboat Interior Already Active")
            else
                ActivateInteriorEntitySet(interior, "korrigan_props_default")
                --("Riverboat Interior Activated")
            end
        end

        local interior = GetInteriorAtCoords(-1643.893, -1358.232, 86.4541)
        local isValid = IsValidInterior(interior)
        if isValid then
            if IsInteriorEntitySetActive(interior, "bee_01_house_fireplace_on") then
                --("Beechers Interior Already Active")
            else
                ActivateInteriorEntitySet(interior, "bee_01_masterBR_bed01")
                ActivateInteriorEntitySet(interior, "Beechers_decorated_after_Abigail3")
                ActivateInteriorEntitySet(interior, "IntGrp_livingrm_furniture_basic")
                ActivateInteriorEntitySet(interior, "bee_01_house_fireplace_on")
                --("Beechers Interior Activated")
            end
        end

        local interior = GetInteriorAtCoords(2385.548, -1221.158, 46.1729)
        local isValid = IsValidInterior(interior)
        if isValid then
            if not IsInteriorEntitySetActive(interior, "bronte_shutters_open") then
                ActivateInteriorEntitySet(interior, "bronte_shutters_open")
                ActivateInteriorEntitySet(interior, "bronte_glass_unbreakable")
            end
        end
    
        local interior = GetInteriorAtCoords(1006.364, -1766.812, 46.5922)
        local isValid = IsValidInterior(interior)
        if isValid then
            if not IsInteriorEntitySetActive(interior, "bra_mansion_WindowsStatic") then
                ActivateInteriorEntitySet(interior, "bra_mansion_WindowsStatic")
                ActivateInteriorEntitySet(interior, "bra_int_bedroom_clean")
            end
        end

        local interior = GetInteriorAtCoords(2643.708984375,-1293.3395996094,51.24600982666)
        local isValid = IsValidInterior(interior)
        if isValid then
	        if IsInteriorEntitySetActive(interior, "new_com_bank_int_des") then
	            --("St Denis Bank Interior Already Active")
	        else
                ActivateInteriorEntitySet(interior, "new_com_bank_int_des") 
                --("St Denis Bank Interior Activated")
            end
        end

        local interior = GetInteriorAtCoords(1288.9132080078,-1303.3087158203,77.699859619141)
        local isValid = IsValidInterior(interior)
        if isValid then
	        if IsInteriorEntitySetActive(interior, "rhobank_int_walla") then
	            --("Rhodes Vault Interior Already Active")
	        else
                ActivateInteriorEntitySet(interior, "rhobank_int_walla") 
                --("Rhodes Bank Vault Interior Activated")
            end
        end

        local interior = GetInteriorAtCoords(1342.3599853516,-1374.6173095703,81.0)
        local isValid = IsValidInterior(interior)
        if isValid then
	        if IsInteriorEntitySetActive(interior, "rho_sal_tables01") then
	            --("Rhodes Saloon Interior Already Active")
	        else
                ActivateInteriorEntitySet(interior, "rho_sal_tables01")
                --("Rhodes Saloon Interior Activated")
            end
        end
		
		local interior = GetInteriorAtCoords(777.28698730469,846.7998046875,117.20547485352)
        local isValid = IsValidInterior(interior)
        if isValid then
	        if IsInteriorEntitySetActive(interior, "_car_house_int_before_ransack") and IsInteriorEntitySetActive(interior, "_car_house_int_day") then
	            --("Interior Already Active")
	        else
                ActivateInteriorEntitySet(interior, "_car_house_int_before_ransack")
                ActivateInteriorEntitySet(interior, "_car_house_int_day")
                --("Interior Activated")
            end
        end
		
		local interior = GetInteriorAtCoords(-2177.0424804688,718.88171386719,120.86156463623)
        local isValid = IsValidInterior(interior)
        if isValid then
	        if IsInteriorEntitySetActive(interior, "han_int_tables_upright") then
	            --("Interior Already Active")
	        else
                ActivateInteriorEntitySet(interior, "han_int_tables_upright")
                --("Interior Activated")
            end
        end
		
		local interior = GetInteriorAtCoords(1319.0007324219,-2281.0004882813,51.024421691895)
        local isValid = IsValidInterior(interior)
        if isValid then
	        if IsInteriorEntitySetActive(interior, "cat_house_propset") and IsInteriorEntitySetActive(interior, "cat_house_lights_ON") then
	            --("Interior Already Active")
	        else
                ActivateInteriorEntitySet(interior, "cat_house_propset")
                ActivateInteriorEntitySet(interior, "cat_house_lights_ON")
                --("Interior Activated")
            end
        end
		
		local interior = GetInteriorAtCoords(-817.17687988281,354.38427734375,96.366539001465)
        local isValid = IsValidInterior(interior)
        if isValid then
	        if IsInteriorEntitySetActive(interior, "IntGroup_Downes_before_move") then
	            --("Interior Already Active")
	        else
                ActivateInteriorEntitySet(interior, "IntGroup_Downes_before_move")
                --("Interior Activated")
            end
        end
		
		local interior = GetInteriorAtCoords(1786.8262939453,-85.348686218262,55.937133789063)
        local isValid = IsValidInterior(interior)
        if isValid then
	        if IsInteriorEntitySetActive(interior, "clean_abe") then
	            --("Interior Already Active")
	        else
                ActivateInteriorEntitySet(interior, "clean_abe")
                --("Interior Activated")
            end
        end
		
		local interior = GetInteriorAtCoords(-443.90466308594,497.06292724609,97.230682373047)
        local isValid = IsValidInterior(interior)
        if isValid then
	        if IsInteriorEntitySetActive(interior, "cas_housewares") then
	            --("Interior Already Active")
	        else
                ActivateInteriorEntitySet(interior, "cas_housewares")
                --("Interior Activated")
            end
        end
		
		local interior = GetInteriorAtCoords(1134.5697021484,-979.48291015625,69.552551269531)
        local isValid = IsValidInterior(interior)
        if isValid then
	        if IsInteriorEntitySetActive(interior, "LT_murder_before") then
	            --("Interior Already Active")
	        else
                ActivateInteriorEntitySet(interior, "LT_murder_before")
                --("Interior Activated")
            end
        end
		
		local interior = GetInteriorAtCoords(2698.0,-1200.0,57.0)
        local isValid = IsValidInterior(interior)
        if isValid then
	        if IsInteriorEntitySetActive(interior, "new_forMyArt_gallery") and IsInteriorEntitySetActive(interior, "new_forMyArt_paintings") then
	            --("Interior Already Active")
	        else
                ActivateInteriorEntitySet(interior, "new_forMyArt_gallery")
                ActivateInteriorEntitySet(interior, "new_forMyArt_paintings")
                --("Interior Activated")
            end
        end
		
		local interior = GetInteriorAtCoords(1897.0,-1863.0,44.000003814697)
        local isValid = IsValidInterior(interior)
        if isValid then
	        if IsInteriorEntitySetActive(interior, "shb_p_mansion_01") then
	            --("Interior Already Active")
	        else
                ActivateInteriorEntitySet(interior, "shb_p_mansion_01")
                --("Interior Activated")
            end
        end
		
        isLoaded = true
    end
end)

--------------------------------                                   ############# -- Valentine Investigate -- ###############                                       ----------------------
RequestImap(412645416)
RequestImap(46615614)
RequestImap(2037986663)

RequestImap(2103049614)
RequestImap(1171027246)
RequestImap(-1798979372)

RequestImap(-1656839837)
RequestImap(608826532)
RequestImap(734740942)

RequestImap(-661560211) -- Barrels Everywhere?
RequestImap(-1933617196) -- Structure in front of gunsmith?
RemoveImap(1202020135)  -- Blank Banners across mainstreet
RequestImap(-892659042) -- Leatherworker on west side of encampment
RequestImap(-1588793465) -- Structure in front of motel?
RequestImap(1186533019) -- Chair in front of Law Offices
RequestImap(-156313117) -- Structure in front of Law Offices
RequestImap(56708243) -- Green Building and General Store Boarded up?
RequestImap(1136898294) -- Saloon Boarded Up??
RemoveImap(30201771) -- Water Trough?
RequestImap(-1475403379) -- Fencing at farm
RequestImap(696143352) -- Prison Break?
RequestImap(897455211) -- something regarding the saloon and store?
RequestImap(1285430299) -- Crates outside saloon and gen store?
RequestImap(1573766063) -- General Store - Fruit in front?
RequestImap(-554932707) -- Something regarding the general store

RemoveImap(4133695711)

--------------------------------                                   ############# -- Valentine Multiplayer (Online) Components -- ###############                                       ----------------------
RemoveImap(731209239)  -- Fast Travel Marker Valentine Train Station
RemoveImap(824748066)  -- Event Marker Western side of town along path ( -229.93, 946.05, 138.33 )

--------------------------------                                   ############# -- Valentine Necessities -- ###############                                       ----------------------
RemoveImap(774477221) -- Valentine Sheriff's Office Crumbled Wall parts...
RequestImap(1097534152) -- Valentine Sheriffs Office Outer wall
RemoveImap(2095116685) -- supplies/boxes in mainstreet front of General Store, Saloon, Green building
RemoveImap(192173299) -- Valentine -- Support Beams and signs -- Mainstreet Saloon BEAT UP
RemoveImap(1081087978) -- Valentine -- Green Building and Restaurant mainstreet - Pre-paint, almost completed stage. (Help wanted sign) -- https://gyazo.com/b4d1f0b57d17c470e7db030f050db1c0     (Do Not Load Both(1/2))
RequestImap(903666582) -- Valentine -- Green Building and Restaurant mainstreet - Painted, completed stage.  Keane's Rooms for Rent -- https://gyazo.com/b8f9f77bb52aeb37aac6dd21463a2133         (Do Not Load Both(2/2))
RemoveImap(282485265) -- Valentine Green building boarded up
RequestImap(637874199) -- Valentine -- Green Building Lamp
RequestImap(-1521525254)  --Green House Valentine -- Exterior Trees and Flowers 1(Run 1 and 2 together)
RequestImap(-761186147)  --Green House Valentine -- Exterior Trees and Flowers 2(Run 1 and 2 together)
RemoveImap(2040843256) -- Valentine -- Construction supplies outside of Smithfields Saloon / Green Building -- https://gyazo.com/c5b67926f2c4304b74061ca62b345a1b
RemoveImap(999248445) -- Valentine -- Yellow Wagon with Blue Barrels outside Smithfields Saloon  -- https://gyazo.com/467e15f5cd1de68bad5e2d414fa330d4
RemoveImap(-713587740)  -- Valentine -- Construction Material in Roadway -- https://gyazo.com/665f85e9e2b00ec78c5fd6b2b0dd2332
RemoveImap(-1217078386) -- Valentine -- Wagons blocking road through Valentine -- https://gyazo.com/c6758dd8f86601eaeefef2b6ef69f38c -- https://gyazo.com/83e1fb7bb26402e6d6329777e7a766a9
RemoveImap(-1579403437) -- Valentine -- Wagon Parked in front of bank -- https://gyazo.com/5b08f55828e867f872552bb8881dc293
RemoveImap(517553365) -- Valentine -- 2 Wagons, 1 in front of and behind of blue house across from Keane's Saloon.  -- https://gyazo.com/4444709e3cc069fddd8d4003d5f0caa3
RemoveImap(805009584) -- Valentine -- Western Barricades -- https://gyazo.com/631b61e44cae28d4c7c4391d1d7830a7
RemoveImap(-560409108) -- Valentine -- Eastern Barricades -- https://gyazo.com/45304e29a207805e373bcd921af6a668
RemoveImap(-518785376) -- Valentine -- Southern Barricades -- https://gyazo.com/2fa60fa4d76205783907e2eec98253ec

--------------------------------                                   ############# -- Valentine Mainstreet Sheriffs Office -- ###############                                       ----------------------
RemoveImap(-1301569116) -- Valentine -- Sheriffs Office boarded up
--------------------------------                                   ############# -- Valentine Mainstreet Law Offices     -- ###############                                       ----------------------
RemoveImap(-52140817)   -- Valentine -- Law Office Boarded Up
RequestImap(924412185) -- Law offices (REMOVE FOR structural damage)
--------------------------------                                   ############# -- Valentine Mainstreet Hotel           -- ###############                                       ----------------------
RemoveImap(-780819048)  -- Valentine -- Hotel Boarded Up
--------------------------------                                   ############# -- Valentine Mainstreet Bank            -- ###############                                       ----------------------
RemoveImap(-1989899190) -- Valentine -- Bank Boarded Up
--------------------------------                                   ############# -- Valentine Mainstreet Doctors Office  -- ###############                                       ----------------------
RemoveImap(-981203673)  -- Valentine -- Doctors Office boarded up
--------------------------------                                   ############# -- Valentine Mainstreet Saloon          -- ###############                                       ----------------------
RemoveImap(-776975047)  -- Valentine -- Main Street Saloon Front Doors locked
RemoveImap(1385025009)  -- Valentine -- Closed sign on main street Saloon
RemoveImap(199047531)   -- Valentine -- Mainstreet Saloon boarded windows
RequestImap(-1158072415) -- Valentine -- Main Street Saloon Sign in front -CLean Version
--------------------------------                                   ############# -- Valentine Mainstreet General Store   -- ###############                                       ----------------------
RemoveImap(406334892) -- Valentine -- General Store Closed Sign on door --
RemoveImap(1228600352) -- Valentine General Store boarded up
RequestImap(135886022) -- Valentine -- Sign in front of General Store
RequestImap(766024860) -- missing blue posts hotel
--------------------------------                                   ############# -- Valentine Cemetery                   -- ###############                                       ----------------------
RemoveImap(-391187090) -- Grass on grave Valentine cemetery
RemoveImap(-1902184438) -- dirt pile from grave dug Valentine cemetery
RemoveImap(1886602884)  -- pre-grave dug grass over
RemoveImap(740012805) -- dirt pile from grave dug Valentine cemetery
RemoveImap(1236921921) -- dirt pile from grave dug Valentine cemetery
RemoveImap(1963724330) -- pre-grave grass... if graves present, remove
RemoveImap(-1871745961) -- Coffin in left grave, Valentine
RemoveImap(2125514970) -- Coffin in center grave, Valentine
RemoveImap(267578156) -- Coffin in right grave, Valentine
--------------------------------                                   ############# -- Valentine ---                  -- ###############                                       ----------------------





------------------------------------- Railroad Stuff
RemoveImap(-794503195) -- Broken Bridge and Pieces Pieces  -- 520 1754 187
------------------------------------- Central Union Train Mission
RequestImap(2077623691) -- Track Bed - Full Legnth
RequestImap(-555736180) -- Crossing 1818
RequestImap(-693812694) --Section 1 1875
RequestImap(-1386614896) --Section 2 Track at 2070
RequestImap(2080640229) --Section 3 2156
RequestImap(-805522215) --Section 4 2177
RequestImap(499044444) --Section 5
RequestImap(-196117122) --Section 6 2184
RequestImap(-1022518533) --Section 7 2201
RequestImap(691955519) --Section 8 with bridge 2203
RequestImap(-142900294) --Section 9 2229.82

------------------------------------- #### END OF RAILWAY STUFF ####

------------------------------------- Heartland Oil Station
RemoveImap(-84516711)  --Run Down Closed Station
RemoveImap(-657241692)  --Oil Pipe
RemoveImap(-1112373128)  --Oil Tower
RemoveImap(1500116524)

------------------------------------- #### Heartland Oil Station ####

------------------------------------- Hole Near Rhodes - Woman's Rights Mission Start
RequestImap(1277540472)  -- 1433 -1591 69
------------------------------------- #### END OF WOMAN'S RIGHTS ####

------------------------------------- #### BEECHERS ####
RequestImap(1353861354) -- Beechers - Barn interior, lanterns and doors
RemoveImap(611701601) -- Beechers Barn - Work supplies
RemoveImap(901412334) -- Beechers Barn - Work supplies
RemoveImap(703356498) -- Beechers Barn - Work supplies
RemoveImap(-650822431) -- Beechers Barn - Work supplies
RequestImap(-956131204) -- Beechers Barn exterior and fencing
RemoveImap(2006257967)
RemoveImap(-2008632686)
RemoveImap(-1615103170)
RequestImap(578474998) -- Beechers border fencing
RequestImap(-1860722801) -- Gazebo
RemoveImap(-692583342)
RemoveImap(-669282002)
RemoveImap(-1355464862)
RemoveImap(-1141450523)
RemoveImap(-252820785)
RemoveImap(258899919)
RemoveImap(-767883927)
RemoveImap(-535715562) -- Scaffolding // remove when completed
RequestImap(931647489) -- Beechers interior
RequestImap(1467774743) -- Beechers Interior
RemoveImap(2030594491) -- Construction materials
RemoveImap(-790660125)
RemoveImap(33260939) -- Beechers construction supplies
RemoveImap(780653384) -- Beechers construction supplies
RemoveImap(180676027) -- Beechers construction supplies
RemoveImap(-270212770) -- Beechers construction supplies
RemoveImap(-211623797) -- Beechers construction supplies
RemoveImap(862349416) -- Beechers construction supplies
RemoveImap(699225334) -- Beechers construction supplies  -- Roof going on
RequestImap(411742897) -- Completed exterior
RequestImap(349494711) -- clothes line, wagon wheel,
RemoveImap(-706105482) -- crate on deck by window
RemoveImap(176369335) -- old windows from previous shack
RequestImap(2087181890)
RemoveImap(637627640)
RemoveImap(44077654) -- support beam - construction
RemoveImap(839872819) -- support beam - construction
RemoveImap(-1656895602) -- support beam - construction
RemoveImap(-583969090)
RemoveImap(-364121869)
RemoveImap(-1073832871)
RemoveImap(-1786558629)
RemoveImap(-1548753996)
RemoveImap(-1784133719)
RemoveImap(-1667461262)
RequestImap(1757739778)
RequestImap(-2029237844)
RequestImap(-2000794023)
RequestImap(-531137142)
RequestImap(5422464)
RemoveImap(203845253) -- Silo construction materials
RemoveImap(-1658679165) -- Silo construction base and materials
RemoveImap(258733332) -- Silo construction base and materials
RemoveImap(79028136) -- Silo construction base and materials
RequestImap(-218940381) -- Silo completed
RemoveImap(634752926) -- chairs and construction supplies
RemoveImap(984271748) -- chairs and construction supplies
RemoveImap(43335376)
RemoveImap(1444950942) -- green wagon side of house/clipping -- full of bricks
RemoveImap(910783469) -- green wagon side of house/clipping -- full of bricks
RemoveImap(727408145) -- green wagon front of house/clipping -- full of bricks
RemoveImap(429636242) -- pile of wood north side of house -- construction materials
RemoveImap(-19364596) -- pile of wood north side of house -- construction materials
RemoveImap(2131035495) -- green wagon side of house/clipping -- full of bricks
RequestImap(1236917971) -- Outhouse
RemoveImap(-316448350) -- construction materials
RemoveImap(-496874464) -- construction materials
RemoveImap(-794515291) -- construction materials
RemoveImap(275588949) -- construction materials
RemoveImap(-52330434) -- construction materials
RemoveImap(-2131457946)  -- construction materials
RemoveImap(1819926822) -- interior framing -- construction
RemoveImap(1529593482) -- interior framing -- construction
RemoveImap(-668911501) -- framing, remove when exterior is up.
RemoveImap(-1012618146) -- old structure
RemoveImap(2111816145) -- old structure rubble
RemoveImap(-722030448) -- old structure
RemoveImap(845427792)
RemoveImap(-974480336) -- canvas gazebos
RemoveImap(197447134) -- canvas gazebo north, wagon, and supplies
RequestImap(-918785150) -- firepit seating
RemoveImap(1256771838) -- wagon wreckage in cropfield
RemoveImap(1205945639) -- lumber pile main driveway in
RemoveImap(1532774697) -- lumber pile main driveway in
RemoveImap(-114633341) -- saw horse main driveway in
RemoveImap(-90646166) -- floating saddle, hat, and rope in corral
RemoveImap(1681117196) --pile of old lumber
RemoveImap(-803019223) -- fire behind house
RemoveImap(449426161) -- lantern
RemoveImap(-999913940) -- lantern
RemoveImap(-30541382) -- lantern
RemoveImap(-960328988)  -- lantern

-- GRASS and GROUND
RemoveImap(-1496619689) -- Green Ground 670 -1236 44
RequestImap(-61896664) -- Worn Brown Ground 670 -1236 44
RequestImap(-648893593) -- Version 1 of Grass and Ferns
RequestImap(1534006738) -- Version 2 of Grass and Ferns
RequestImap(-376056363) -- Version 3 of Grass and Ferns
RequestImap(519091847)  -- Version 4 of Grass and Ferns
RequestImap(-1225606266) -- Adds bush to 692 -1263 44
RequestImap(-1874720370) -- Lots of ferns, weeds and tall grass
RequestImap(-1936937394) -- Grass, Flowers and weeds]]


-- German Guys Wagon
RemoveImap(-1123811713) -- Wagon v1  657 -1231 44
RemoveImap(1679038623) -- Wagon v2  657 -1231 44
RemoveImap(-546137515) -- Wagon v3 657 -1231 44  3 Boxes in Back Canopy
RemoveImap(-462274808) -- Small Box in wgaon
RemoveImap(-1284301817) -- Antlers on German Wagon
RemoveImap(1169958167) -- Red Table Cloth German Wagon



--Arthurs Wagon
RemoveImap(2072112547) --  Wagon v1 with Canopy
RemoveImap(-2016771661) -- Wagon v2
RemoveImap(202127432) --  Wagon v3 with Shevles Tools
RemoveImap(1601820048) -- Hide Rug 
RemoveImap(2025485344) -- Table Top 
RemoveImap(901520480) -- Table 
RemoveImap(-1999465365) -- Right Skull  Wagon
RemoveImap(853723410) -- Left Alligator Skull  Wagon
RemoveImap(-1774140220) --  Chest v1
RemoveImap(-262271608) --  Chest v2 Striped Shirt
RemoveImap(102652153) --  Shaving Kit
RemoveImap(-1434077648) -- Small Containers 
RemoveImap(-1728638189) -- Bigger boxes v1 
RemoveImap(93121605) -- Bigger Boxes v2 
RemoveImap(-205043526) -- Bigger Boxes v3 
RemoveImap(1027586707) -- Bigger Boxes v4 
RemoveImap(-1570232590) -- Open Flipped Small Box 
RemoveImap(648514907) -- Open Box Flipped
RemoveImap(1351016737) -- Little Box inside Flipped Box
RemoveImap(721720861) --  Small Box on Ground
RemoveImap(1620317782) -- v1 Mixture of Boxes 
RemoveImap(1952267752) -- v2 Mixture of Boxes 
RemoveImap(-1739164071) -- Book on Small Table 
RemoveImap(-1331617405) --  Book
RemoveImap(-959814975) -- Box by Book v1
RemoveImap(-1676997321) -- Box by book v2
RemoveImap(1096093290) -- Quiver on Ground
RemoveImap(626928579) -- Picktures on Ground
RemoveImap(313722477) -- Tools no wagon
RemoveImap(976082270) -- Tools, painting, guns
RemoveImap(153759048) -- Chair
RemoveImap(-1147256587) -- Map
RemoveImap(1676971154) -- Photo

-- Pearsons Wagon
RemoveImap(764763647) -- Provisions Wagon v1
RemoveImap(1742990618) --Provisions Wagon v2
RemoveImap(-751959361) -- Provisons Wagon v3
RemoveImap(-1279618207) -- Provisions Wagon v4 Empty
RemoveImap(-492479795) -- Skull Provisions Wagon
RemoveImap(-320577790) -- Barrel with Lantern
RemoveImap(1246210400) -- Provision Boxes Large
RemoveImap(-172246728)  --Table - Cutting Board - Barrel of Salt v1
RemoveImap(-850189983)  --Table - Cutting Board - Barrel of Salt v2
RemoveImap(126970802) -- Two Boxes Provisions
RemoveImap(715730031) -- Pans and Blue Table Cloth for Table v1
RemoveImap(349896400) -- Pans and Table Cloth for Table v2
RemoveImap(110400393) -- Provisions, keg, rope for Table v1 (will work with v2 as well but clips)
RemoveImap(482931525) -- Provisions, Fruits, Milk, red cloth
RemoveImap(-1291679096) -- Potato Bags for Wagon v3
RemoveImap(-387018143) -- Two Barrels
RemoveImap(5585502) -- Red Cloth v2 watermelons, pumpkins flour
RemoveImap(1309652195) -- Water and Dishes
RemoveImap(-112364237) --Ammo Tools
RemoveImap(-1983416665) -- Spilled Flour
RemoveImap(438624963) -- Supplies
RemoveImap(82769080) -- Plate and Spilled Flour
RemoveImap(1125807846) -- Bag of Flour
RemoveImap(-1894946791) -- Plate
RemoveImap(-1362716862) -- red cloth v3 provisions
RemoveImap(-624219879) -- Pans open can ammo for v1 table
RemoveImap(977061573) -- Pans open can ammo for v2 table
RemoveImap(1729014506) -- Provisions for table v1
RemoveImap(-916538063) -- Provisions for table v2
RemoveImap(1886481528) -- Spilled flour
RemoveImap(-1507376753) -- Bag of Flour
RemoveImap(-1370620659) -- Pans for table v1
RemoveImap(1074130180) -- Pans for table v2
RemoveImap(652735549) -- Provisions for table v1

-- Javiers Tent
RemoveImap(-347518940) -- Skull near Banjo
RemoveImap(-1887167048) -- Banjo
RemoveImap(530288130) -- Cushion Top near log
RemoveImap(1538837441) -- Fur seat for Log near Banjo
RemoveImap(-1999825729) -- Brown Cow Hide near Banjo

-- Hosea
RemoveImap(2728487) -- Tent v1 Supplies 660 -1256 43
RemoveImap(1674800958) -- Tent v2 Empty 660 -1256 43
RemoveImap(-782359587) -- Tent v3 Patches
RemoveImap(510052409) -- Tent v4 Opened at front only
RemoveImap(291770965) -- Tent v5 closed
RemoveImap(-2143243848) -- Tent v6 Open on front
RemoveImap(1209017192) -- Tent v7 open front
RemoveImap(-644575724) -- Tevt v8 closed
RemoveImap(1700661865) -- Tent v9 Closed
RemoveImap(-2001921071) -- Square Rug near round table top
RemoveImap(1210820782) -- Barrel with Latntern

-- Bills Sleeping Area
RemoveImap(-1292493167) -- Rope and Boxes near Dream Catcher
RemoveImap(-1451784475) -- v1 Canopy inbetween bucket and blue chairs
RemoveImap(1028224932) -- v2 Canopy inbetween bucket and blue chairs
RemoveImap(1128417383) -- v3 Canopy with Candle
RemoveImap(292845400) -- Skull and bucket Near Rope and Boxes
RemoveImap(1609975546) -- Crates and Gun Table
RemoveImap(-948006506) -- Blue Towel Dynamite
RemoveImap(1700045179) -- Dynamite
RemoveImap(-1045678888) -- Small Tables
RemoveImap(-1663177928) --Lure Kit

-- Back Wagons
RemoveImap(1084869405) -- Two Wagons v1 Supplies 674 -1267 43
RemoveImap(1636281938) -- Two Wagons v2 Empty 674 -1267 43
RemoveImap(-1642249622) -- Two wagons v3 empty Canopy

-- Dutchs tent
RemoveImap(-109425099) -- Tent v1 Empty Open Both ends
RemoveImap(539843907) -- Tent v2 Empty Right Side Opened
RemoveImap(180356041) -- Tent v3 Opened Both Ends
RemoveImap(-71508135) -- Tent v4 Flaps Closed
RemoveImap(40009123) -- Tent v5 Flaps Closed
RemoveImap(1070723367) -- Tent v6 Flaps Closed
RemoveImap(-146943962) -- Tent v7 Open both ends
RemoveImap(1261237250) -- Tent v8 open front
RemoveImap(-692521236) -- Tent v9 open on back
RemoveImap(1049842342) -- Inside Tent Bear Rug Stove Books Barrels and Canopy 
RemoveImap(1034009086) -- Inside  Tent Boxes, Stove Lanturn, Canopy
RemoveImap(-160392273) --  Tent Inside Music Box Canopy
RemoveImap(2119205605) -- Cash Box behind Dutchs Tent 1
RemoveImap(-619637948) -- Cash box behind Dutchs tent 2
RemoveImap(-1639921686) -- Tent Flap

-- Base
RemoveImap(1802272784) -- Camp Extras (MUST LOAD FOR NORMAL SETUP)
RemoveImap(2108368013) -- Tent frames for Dutch, Hosea and Arthurs Bed (Must Load for Normal Setup)
RemoveImap(1402472902) -- Setting Up Camp v1
RemoveImap(-1458944281) -- Setting Up Camp v2
RemoveImap(1691578074) -- Log Fire Pit Trash Broken Barrels
RemoveImap(810684093) -- Blue Trash Barrels on Beach
RemoveImap(321594819) -- Broken Table on Beach
RemoveImap(-385999832) -- Blue Trash Barrels on Beach
RemoveImap(-1656481590) -- Target Shooting on Beach (Missing what hanging targets are tied to)
RemoveImap(1706275010) -- Round Table
RemoveImap(-792944828) -- Round Table Top
RemoveImap(-1836870707) -- Round Table Seats no light
RemoveImap(1290371072) -- Seats and light for round table
RemoveImap(-1880340209) -- Camp Fire, 3 stools, 2 sleeping bags beside Arthurs site
RemoveImap(-2000080725) -- Chicken Coop
RemoveImap(719147410) -- Blue Chair and Stool for gaming table
RemoveImap(-989202374) -- Antlers on Big Center Tree
RemoveImap(-1010466481) -- Supplies in Lean Tos
RemoveImap(-1247551347) -- Broken Chest
RemoveImap(1717489303) -- Three Lean Tos
RemoveImap(1692451176) -- Lantern Game Table on a Post
RemoveImap(220566669) --Lantern Game Table
RemoveImap(-1045282549) -- White Animal Skin Rugs near sitting rock
RemoveImap(2123887232) -- Fire pit near white skins
RemoveImap(-809371454) -- Small barrel and table to Banjo
RemoveImap(-436009554) -- Piece of Paper near Banjo
RemoveImap(1997423854) -- Map near Paper
RemoveImap(157361403) -- Large Dream Catcher
RemoveImap(-814821283) -- Fishing Stuff
------------------------------------- #### END OF RHODES STORY CAMP ####

------------------------------------- Rhodes Camp
RemoveImap(-159557995) -- Two Tents, Wagon, Chairs
------------------------------------- #### END OF RHODES CAMP ####

------------------------------------- Boat and Supplies Near Rhodes Camp
RemoveImap(1733394134) -- Boat and Supplies 807 -1235 41
------------------------------------- #### END OF RHODES BOAT ####

------------------------------------- Rhodes Camp
RemoveImap(1313890873) -- Small Camp in the Woods Just North of Dutch's Rhodes Base
------------------------------------- #### END OF RHODES CAMP ####

------------------------------------- Rhodes Cemetery
RequestImap(-1366431554) -- Covers Large hole with grass patch
RequestImap(-2144587490) -- Covers small plot hole with mound of dirt
RemoveImap(-158824350) -- Dirt in Small Plot (visually can't see it)
------------------------------------- #### END OF RHODES CEMETERY ####

------------------------------------- Braithwaite Mansion
--Mansion Interior
RemoveImap(1149195254)  --Brathwaite House Shell
RequestImap(-1643869063) -- House Burnt Down
RemoveImap(58066174)  -- Interior
RemoveImap(1601599776)  -- House on fire Smoke (Smoke and Burning Sounds Only)
RemoveImap(-437251660)  -- House of Fire Flames

-- Mansion Exterior 
RemoveImap(-1220264217)  -- Shurbs and Bushes
RequestImap(-1508467572) -- Ferns Bushes Weeds Overgrown (Use with Burned Down Version of House)
RemoveImap(-990258606) -- Small Trees
RemoveImap(1944013855) -- Add Open Shudders Upstairs Bed Room and Downstairs Library
RemoveImap(-21876618)
RemoveImap(-2137633069)  -- Shudders Close Upstairs Bedroom and Downstairs Library
RemoveImap(-880373663)  -- Front Balcony Lantern Added
RemoveImap(-70021332)  -- Adds Working tools and supplies to upper balcony
------------------------------------- #### END OF BRAITHWAITE MANSION ####

------------------------------------- Grey Estates
RequestImap(-677977650) -- Normal Barn Frame
RequestImap(702350293) -- Barn Interior
RemoveImap(419559004) -- Burnt Barn Frame 1
RequestImap(1426715569) -- Adds Field Props
RemoveImap(1284656212) -- Burning Structure
RemoveImap(-1162161651) -- Fields on fire
RemoveImap(557212279) -- Burnt Plants
RemoveImap(1786931635) -- Burnt out fields
RequestImap(26815048) -- Normal Fields
RequestImap(-1229109520) -- Green Plants
------------------------------------- #### END OF GREY ESTATES ####

------------------------------------- Blackwater Town Hall
RequestImap(-2082201137)  --Blackwater Ground Town Hall
RemoveImap(1343343014)  --Blackwater Town Hall Addons Construction
RemoveImap(739412171)  -- Two Boards in front of city hall (Goes with Town Hall Construction)
RemoveImap(-5339556)  --Bank Under Construction
RemoveImap(1173561253) -- Tents Beside City Hall Near Trech
RemoveImap(1470738186) -- Adds Pre-Construcion Ground (Ground does not mesh well with contrustion IPLs)
RequestImap(-1632348233) -- Adds Trees and Grass (DO NOT USE WITH CONSTRUCTION IPL, WILL MERGE VISUALS)
------------------------------------- #### END OF BLACKWATER TOWN HALL ####

------------------------------------- First Camp - Winter Area -1346 2407 311
RemoveImap(867231253)  -- Ground Spring Melt
RemoveImap(1248111234) -- Ground Early Spring Melt 
RemoveImap(474287981) -- Ground Standard Winter 
RequestImap(-1331012521) -- Ground After Snowfall Winter 
RemoveImap(-2119625926) -- Barrels and Crates
RemoveImap(1113693078) -- Snow on Two Crates
RemoveImap(660686456) -- Crates for use with Snow Cover Crates (FOR USE WITH Snow on Crates)
RemoveImap(-8749224) -- Torches Boxes and Crates (DO NOT USE SNOW ON CRATES WITH THIS)
RequestImap(-1991237877) -- Boxes
RemoveImap(-1670453688) -- Broken Wagons
RemoveImap(-898885956)
RequestImap(-743781837) -- Fire in Pit
RequestImap(2114706334) -- Fire Pit
RequestImap(-1306375743) -- Forge Fire
------------------------------------- #### END OF FIRST CAMP ####

------------------------------------- Farm House near Mining Town - -559 2686 319
RequestImap(-338553155) -- Exterior House
RequestImap(-1636879249) -- Normal Looking Interior
RemoveImap(-323126593) -- Burned Out Interior
RemoveImap(-889869458)  -- Debris
RemoveImap(1590561203)  -- Flames
RequestImap(-1106668087) -- Adds Wagon Wheel near Front Door
RequestImap(2028590076) -- Cash Box Interior
------------------------------------- #### END OF FARM HOUSE ####

------------------------------------- Strawberry
RemoveImap(-134556459) -- Doctors House Locked Door (No Interior) -1799 -428 158
RequestImap(131323483)  -- Doctors House Interior and Unlocked Front Door
RemoveImap(270920361) -- Crates on Doctors Porch 

RemoveImap(1892122519)-- Locked Door Micahs Gun House (No Interior) -1773 -431 154
RequestImap(-130638369) -- Micahs Gun House Interior with Unlocked Front Door (Upstairs does not work, other doors are locked)

RequestImap(2137790641) -- Jail Cell Window Fixed
RequestImap(1934919499) -- Jail Cell Window Fixed
RequestImap(-515396642) -- Jail Cell Window Fixed
RemoveImap(993595204) -- Window Debris
RemoveImap(1291083725) -- Window Debris
------------------------------------- #### END OF STRAWBERRY ####

----------------------- Saint Denis Doctor office
RemoveImap(-473077489) -- Doors (fixes hole) no interior
RequestImap(619024057) -- full interior with doors
------------------------------------- #### END OF SAINT DENIS DOCTOR OFFICE ####

----------------------- Casino boat
RequestImap(-614421509) -- boat shell
RequestImap(604920544)  -- upstairs interior
RequestImap(1382135686) -- main room interior
RequestImap(-1968130469) -- railings
RequestImap(-276259505) -- railings
------------------------------------- #### END OF CASINO ####

----------------------- ferry boat
RequestImap(-723094901)
------------------------------------- #### END OF FERRY BOAT ####


----------------------- Beechers field
RemoveImap(1929454697) -- beechers field side rows of some medium crop
RemoveImap(1649902358) -- beechers field side rows of some small crop
RemoveImap(1864768904) -- beechers field crops in middle
RemoveImap(938290967)  -- beechers field crops in middle
RemoveImap(1169279648) -- beechers field crops in middle
RemoveImap(-284612948) -- beechers field tilled field
RequestImap(-1765152778) -- beechers field logs laying in 
RequestImap(-2072231077) -- beechers field plants over area
RequestImap(-1253110600) -- beechers field hole in ground fix
------------------------------------- #### END OF BEECHERS FIELD ####

----------------------- hole at -1627.81, 224.5, 106.45
RequestImap(1861460906)
------------------------------------- #### END OF HOLE AT -1627.81, 224.5, 106.45 ####


RemoveImap(-847027479)
RemoveImap(-1916642580)
RemoveImap(-1058872649)
RemoveImap(-736226816)

-- Annesburg & Region
RemoveImap(582879672)  -- Fast Travel
RemoveImap(582879672)
RequestImap(-505092091)
RequestImap(-1011647266)  -- Sheriff office parts
RemoveImap(-687164887)   -- Model LOD do not remove
RequestImap(429527177)    -- log fencing parts and dec
RemoveImap(-1584316325)  -- Crates, Barrels and Wagons #01
RemoveImap(-537740003)   -- Crates, Barrels and Wagons #02
RemoveImap(-1984145124)  -- Rope on water
RemoveImap(1517736440)     -- Building Construction Part #01
RemoveImap(-693132475)     -- Building Construction Part #02
RequestImap(-1509154451)  -- Building Construction Completed (Walls) #01
RequestImap(-87516051)    -- Building Construction Completed (Roof) #02
RemoveImap(1912921446)   -- Unknown Imap at Building Construction #01
RemoveImap(555501256)    -- Unknown Imap at Building Construction #02
RemoveImap(934782463)    -- Unknown Imap at Building Construction #03
RemoveImap(-1315256079)  -- Unknown Imap at Docks #01

----------------------- farm with hole in ground next to W in West Elizabeth 
RemoveImap(-928367655)
RequestImap(890107948)
RequestImap(1153046408)
RequestImap(1634621556)
RemoveImap(-243627670)
RequestImap(38567760)
RequestImap(-1954278106)
RequestImap(-947200121)
RequestImap(629362551)
RequestImap(-786579336)
RequestImap(-1305545118)
RequestImap(-825836321) -- ground
RequestImap(446554495) -- ground
RequestImap(-262959893) -- ground
RequestImap(-735136865) -- ground
RequestImap(-868830916)
RequestImap(764025611)
RemoveImap(1802934313) --trees
RemoveImap(607468222) --shrubs
RemoveImap(2108112010) --trees
RemoveImap(1208537422) --trees
RemoveImap(361734047) -- trees
RemoveImap(-1552951782) --trees
RemoveImap(1391886974) -- plants
RemoveImap(-1142569437) -- plants
RemoveImap(474113610) -- plants
RemoveImap(1298607560)
RemoveImap(-297340751) -- small pines
RemoveImap(-1079295176)
RequestImap(1271713904)
RequestImap(1423681694)
RequestImap(1293624693)
RequestImap(-1305406402)
RequestImap(1983816160)
RequestImap(-602816690)
RequestImap(636278554)
RequestImap(-285245562)
RequestImap(1031662866)
RequestImap(-1041976064)
RequestImap(1221694281)
RequestImap(1036815507)
RequestImap(775893260)
RequestImap(-329355129)
RemoveImap(2117211184) --fence
RemoveImap(-1042390616) -- barn interior
RemoveImap(-118700196) --props outside
RemoveImap(991016631)
RemoveImap(57105576)
RequestImap(238757788)
-- RequestImap(927020127)
RemoveImap(1388161943)
RequestImap(-7594117)
RequestImap(-1680050035)
RequestImap(41398635)
RequestImap(462263849)
RequestImap(1422134667)
RequestImap(1263244828)
RemoveImap(-1813544782)
RequestImap(1008375999)
RequestImap(117485200)
RequestImap(-188216801)
RequestImap(-2047539266)
RemoveImap(1053919002)
------------------------------------- #### end farm with hole in ground next to W in West Elizabeth ####

----------------------- Fantana Theatre Saint Denis
RequestImap(-1667265438) -- signs on building 1
RemoveImap(175578406)  -- signs on building 2
RequestImap(1137646647) -- fantana doors (fills hole)
--RequestImap(-898081380) -- fantana theatre interior
RemoveImap(-468635897) -- sign option 1 out front (advertisement)
RemoveImap(-771786794) -- sign option 2 picture
RemoveImap(-626641013) -- sign option 3 scull
RemoveImap(1088045886) -- sign option 4 (advertisement)
RemoveImap(-1678761663) -- sign option 5 (advertisement)
RemoveImap(535384482) -- sign option 6 (advertisement)
RemoveImap(1724413302) -- sign option 7 (advertisement)
RequestImap(-1267247536) -- sign option 8 (advertisement)
------------------------------------- #### END Fantana Theatre Saint Denis ####

----------------------- Prison
RequestImap(350100475) --Cellar doors
------------------------------------- #### END Prison ####

----------------------- Hotel Chevalier
RemoveImap(481139295)  -- scaffolding and grand opening soon sing
RequestImap(-274080837) -- fixed hole in wall
------------------------------------- #### END Hotel Chevalier ####

----------------------- House interior 1119 481.74 96
RequestImap(-787042507)
RequestImap(-1543080891)
------------------------------------- #### END House interior ####

----------------------- Patch hole in building -1860, -1722, 109.25
RemoveImap(-1696865897)
------------------------------------- #### END Patch hole in building ####

----------------------- Missing cabin -2376.0, -1590.96, 156.0

RequestImap(-1387511711) -- shell
RequestImap(1901132483) -- interior
RemoveImap(-2082345587) -- onfire
RemoveImap(-715865581) -- fallen tree
------------------------------------- #### END Missing cabin ####

RemoveImap(1879779330)  -- sign outside tent version 1
RemoveImap(1104143966)  -- sign outside tent version 2
RemoveImap(1027093524)  -- sign outside tent version 3
RemoveImap(-1617847332) -- sign outside tent version 4
RemoveImap(-350513342)
RemoveImap(-355725899)
RemoveImap(-763477089)  -- partial door flap open
RemoveImap(317070801)   -- full closed flap
------------------------------------- #### END Traveling Magic Lantern Show -- Valentine --####

----------------------------------------- ### Armadillo Fires ### Southwest
RemoveImap(-1745210725) -- SW add debris
RemoveImap(-1096712211) -- SW add debris
RemoveImap(-1941005496) -- SW add debris
RemoveImap(1898267848)  -- SW add ember
RemoveImap(974280355)   -- SW add ember
RemoveImap(1756181464)  -- SW add ember
RemoveImap(-816857367)  -- SW add ember
RemoveImap(-72482077)   -- SW add flame
RemoveImap(-1122265410) -- SW add flame
RemoveImap(-935952905)  -- SW add flame
RemoveImap(1309948033)  -- SW add flame
RemoveImap(1941336822)  -- SW add flame
RemoveImap(712371053)   -- SW add flame
RemoveImap(1710282603)  -- SW add flame
RemoveImap(574303518)   -- SW add charred ground
RemoveImap(-752772715)  -- SW add smoke
RemoveImap(503623514)   -- SW add smoke
RemoveImap(-407026996)  -- SW add smoke
----------------------------------------- ### Armadillo Fires ### Northeast
RemoveImap(-1029093195) -- NE add debris
RemoveImap(-1325390493) -- NE add debris
RemoveImap(-1622834706) -- NE add debris?
RemoveImap(257582350)   -- NE add ember
RemoveImap(-39730787)   -- NE add ember
RemoveImap(-1438901569) -- NE add ember
RemoveImap(-772691681)  -- NE add flame
RemoveImap(-2110850686) -- NE add flame
RemoveImap(-1142062162) -- NE add Flame
RemoveImap(32078073)    -- NE add flame
RemoveImap(1011350990)  -- NE add flame
RemoveImap(1007204499)  -- NE add flame
RemoveImap(705321299)   -- NE add flame
RemoveImap(34346755)    -- NE smoke
RemoveImap(482102371)   -- NE smoke
RemoveImap(-502343927)  -- NE smoke
RemoveImap(112916013)   -- NE add charred ground
----------------------------------------- ### Armadillo Fires ### Southeast
RemoveImap(-1725439174) -- SE add ember
RemoveImap(-1443390498) -- SE add debris
RemoveImap(689576469)   -- SE add debris
RemoveImap(-1750010031) -- SE add debris
RemoveImap(1857654366)  -- SE add ember
RemoveImap(2095655613)  -- SE add ember
RemoveImap(1049317994)  -- SE add flame
RemoveImap(-820561187)  -- SE add flame
RemoveImap(-280121448)  -- SE add flame
RemoveImap(-1268841107) -- SE add flame
RemoveImap(-279038963)  -- SE add flame
RemoveImap(2087785010)  -- SE add flame
RemoveImap(161441935)   -- SE add flame
RemoveImap(-1603458673) -- SE add charred ground
RemoveImap(1065585604)  -- SE smoke
RemoveImap(-175048740)  -- SE smoke
RemoveImap(-482127039)  -- SE smoke
----------------------------------------- ### END ARMADILLO FIRES ###
RequestImap(666617953)
RequestImap(-1892595931) 
RequestImap(-784156210)
RequestImap(-2097346584)
RequestImap(-1000738568)
RequestImap(-991619789)
RequestImap(-799526632)
RequestImap(1003623269)
RemoveImap(1804593020)
RequestImap(1325716092)
RequestImap(-1049500949)
RequestImap(-1905652203)
RequestImap(2470511)
RequestImap(951314072)
RemoveImap(-1878882174)
RemoveImap(724436573)
RequestImap(-1744253204)
RequestImap(-2009766528)
RequestImap(-1781246069)
RequestImap(610256856)
RemoveImap(-2083943324)
RemoveImap(-159723514)
RequestImap(-1801047945)
RemoveImap(-590227673)
RequestImap(1936501508)
RequestImap(325677491)
RemoveImap(1823159188)
RequestImap(-407068688)
RequestImap(1552753100)
RemoveImap(1548242606)
RequestImap(-555917871)
RequestImap(1777348822)
RequestImap(-1824080033)
RequestImap(1460466036)
RequestImap(-1279036865)
RemoveImap(-1818498296)
RequestImap(116162819)
RequestImap(588746212)
RemoveImap(-1593160175)
RemoveImap(-2040493861)
RemoveImap(-1382265257)
RequestImap(-508205317)
RemoveImap(-232598845)
RequestImap(1497923922)
RemoveImap(-1069586228)
RequestImap(-1816233372)
RequestImap(-1773409329)
RemoveImap(-688744902)
RemoveImap(1987335384)
RemoveImap(-1149736196)
RemoveImap(-983957271)
RemoveImap(427220750)
RequestImap(-1926787493)
RemoveImap(1840600379)
RemoveImap(2136811572)
RequestImap(1332067900)
RequestImap(-1118337851)
RequestImap(1236490949)
RequestImap(-1701626270)
RequestImap(-557964826)
RemoveImap(603871447)
RequestImap(-1569624057)
RequestImap(-378395191)
RequestImap(273551835)
RequestImap(-961488528)
RequestImap(1936009597)
RequestImap(-425834853)
RequestImap(-1055748784)
RequestImap(-694809996)
RequestImap(-279703229)
RequestImap(-2053475031)
RequestImap(-623091266)
RequestImap(-217646849)
RequestImap(-313831898)
RequestImap(1694736240)
RequestImap(634920011)
RequestImap(2035758463)
RequestImap(425205960)
RequestImap(54402003)
RequestImap(-481093102)
RequestImap(-1923021027)
RequestImap(-1721168110)
RequestImap(937192284)
RequestImap(706203603)
RequestImap(579021239)
RequestImap(272490690)
RequestImap(263152228)
RequestImap(996571604)
RequestImap(301693437)
RequestImap(846337294)
RequestImap(-512601161)
RequestImap(765343099)
RequestImap(-909306169)
RequestImap(-879315604)
RequestImap(1503442953)
RemoveImap(31909846)
RemoveImap(746194903)
RemoveImap(-1227807056)
RequestImap(1234648758)
RequestImap(1616712776)
RequestImap(1049849921)
RequestImap(1252084553)
RequestImap(-995906750)
RequestImap(-2112989134)
RequestImap(722810050)
RemoveImap(-1710969071)
RequestImap(1499112197)
RequestImap(929504930)
RemoveImap(37622013)
RequestImap(808313916)
RequestImap(276427301)
RemoveImap(539464064)
RequestImap(-1501864740)
RequestImap(-1070814495)
RemoveImap(1713296185)
RemoveImap(506519174)
RemoveImap(1163739065)
RequestImap(1903066940)
RequestImap(-563006151)
RemoveImap(-792399058)
RemoveImap(1851402669)--
RemoveImap(2123794495)
RemoveImap(-248246131)
RemoveImap(-1435884039)
RequestImap(-108299713)
RemoveImap(-2009032789)
RequestImap(-822172378)
RequestImap(-340009312)
RemoveImap(1122045165)
RequestImap(1352837232)
RemoveImap(-1740687448)
RemoveImap(-1508256931)
RemoveImap(1739445890)
RequestImap(-817060178)
RequestImap(-737812908)
RequestImap(389213738)
RemoveImap(2126897368)
RemoveImap(1314976319)
RemoveImap(551513105)
RequestImap(-780302065)
RequestImap(-1226654727)
RequestImap(1849913721)
RequestImap(573576705)
RemoveImap(-173548630)
RequestImap(262039053)
RequestImap(-456215895)
RequestImap(-792369764)
RequestImap(-170108806)
RequestImap(-1967848432)
RequestImap(1647812004)
RequestImap(-856826868)
RemoveImap(-1928361302)
RemoveImap(-2054468361)

RequestImap(-315113250)
RequestImap(-1850873053)
RemoveImap(-1192753172)
RemoveImap(-697261290)
RemoveImap(-482255714)
RemoveImap(-236914211)
RemoveImap(2130187273)
RequestImap(-833696851)
RequestImap(882236853)
RemoveImap(-2060277385)
RequestImap(-223199122)
RemoveImap(1239191982)
RemoveImap(132414998)
RequestImap(-1626434823)
RequestImap(-1411225477)
RequestImap(263133813)
RequestImap(416864911)
RequestImap(1312163721)
RequestImap(1843301309)
RemoveImap(-1957607557)
RequestImap(1311508924)
RequestImap(1337703077)
RequestImap(-615961815)
RemoveImap(184476093)
RequestImap(413309170)
RemoveImap(1283988553)
RemoveImap(416759610)
RequestImap(1916362667)
RequestImap(-76573194)
RequestImap(391171508)
RemoveImap(827906606)
RequestImap(-169261100)
RequestImap(1912754336)
RequestImap(292362182)
RequestImap(807262958)
RemoveImap(1717286956)
RemoveImap(249811747)
RequestImap(-599973510)
RequestImap(306939642)
RequestImap(-1960392600)
RequestImap(-1255088882)
RequestImap(840395410)
RemoveImap(-433293752)
RemoveImap(-834411899)
RemoveImap(-770646513)
RequestImap(1831175752)
RequestImap(-1235304557)
RequestImap(508853087)
RemoveImap(-936204805)
RequestImap(2118488614)
RemoveImap(-1287270695)
RemoveImap(-1885599866)
RemoveImap(-118171082)
RemoveImap(1726559781)
RemoveImap(283731391)
RemoveImap(712823073)
RemoveImap(970334657)
RemoveImap(574916087)
RemoveImap(-377841051)
RemoveImap(1920416437)
RequestImap(1455068616)
RemoveImap(-1993836161)
RemoveImap(402954041)
RequestImap(616706228)
RequestImap(-1279832420)
RemoveImap(1280284302)
RequestImap(99679839)
RemoveImap(-195226224)
RequestImap(-1670262487)
RequestImap(-754458705)
RequestImap(-1725459238)
RequestImap(1128425273)
RequestImap(1405502979)
RequestImap(-1534019549)
RequestImap(-1218790373)
RemoveImap(48202231)
RequestImap(1532041436)
RequestImap(1993833091)
RemoveImap(-985843618)
RemoveImap(1542551103)
RemoveImap(298607063)
RemoveImap(-1298966347)
RemoveImap(1117165375)
RemoveImap(-1695492178)
RemoveImap(-1985868973)
RemoveImap(-1300575561)
RemoveImap(354638936)
RequestImap(933157597)
RequestImap(1416094782)
RemoveImap(-1139312905)
RemoveImap(1062381624)
RemoveImap(-1003150953)
RemoveImap(-1986775954)
RemoveImap(929785619)
RemoveImap(-899261623)
RemoveImap(-476849231)
RemoveImap(-557729610)
RemoveImap(-639956757)
RemoveImap(-1991979537)
RemoveImap(748846068)
RemoveImap(194929358)

RemoveImap(1193231534)
RequestImap(-663999418)
RequestImap(1807258239)
RemoveImap(-259044425)
RemoveImap(-1956708897)
RemoveImap(-2047539266)
RemoveImap(787640784)
--RemoveImap(-353498827)
RemoveImap(1199768352)
RemoveImap(-1414272575)
RequestImap(-1392793470)
RemoveImap(-1398290276)
RemoveImap(2006120810)
RequestImap(-1785392621)
RequestImap(194103255)
RequestImap(1344880374)
RemoveImap(-1872364931)
RemoveImap(-1923126393)
RemoveImap(-313259746)
RemoveImap(-367168072)
RemoveImap(1971923782)
RemoveImap(401043460)
RequestImap(104287396)
RequestImap(1014446371)
RemoveImap(715920781)
--RemoveImap(1510796294)
RemoveImap(1297834604)
RemoveImap(-900541220)
RequestImap(-1199296193)
RequestImap(-290546285)
RemoveImap(-553189820)
RemoveImap(546408124)
RemoveImap(1199685211)
RequestImap(129717520)
RemoveImap(-1232784731)
RequestImap(-482898935)
RemoveImap(301558156)
RemoveImap(1859330882)
RemoveImap(1683033662)
RemoveImap(-1419371417)
RemoveImap(-643041038)
RequestImap(1529455145)
RemoveImap(-911242864)
RequestImap(1620300964)
RequestImap(-476377037)
RequestImap(857765025)
RemoveImap(1590446437)
RemoveImap(1466088082)
RemoveImap(-1789074439)
RemoveImap(-1852056457)
RemoveImap(499096137)
RemoveImap(556704039)
RemoveImap(-368895393)
RequestImap(-105596478)
RemoveImap(190078209)
RemoveImap(-1001336405)
RemoveImap(1708614117)
RemoveImap(561187138)
RemoveImap(859352269)
RequestImap(1023328345)
RemoveImap(705065993) -- old cart 
RemoveImap(705065993)
RequestImap(-2090647942)
RemoveImap(-2051019414)
RequestImap(1174496881)
RemoveImap(-449454773)
RemoveImap(240772357)
RemoveImap(1308321372)
RequestImap(516308968)
RemoveImap(143994875)
RequestImap(1991621063)
RequestImap(-1798733774)
RequestImap(677191274)
RequestImap(-2011620387)
RequestImap(579127040)
RequestImap(-1314125880)
RequestImap(-953275122)
RequestImap(1998087725)
RequestImap(1145227353)
RequestImap(1915867459)
RequestImap(-3571233)
RequestImap(-2105071972)
RequestImap(1527084472)
RequestImap(1635537886)
RequestImap(-1121783372)
RequestImap(874022542)
RequestImap(552030279)
RequestImap(-1639384288)
RequestImap(274045919)
RequestImap(-1047394327)
RequestImap(-1141831946)
RequestImap(-591921971)
RequestImap(1157155867)
RequestImap(1397975248)
RequestImap(-820486040)
RequestImap(-1109901848)
RequestImap(-1010679388)
RequestImap(98482444)
RequestImap(-1754541271)
RequestImap(-1363999915)
RequestImap(-163883900)
RequestImap(26932594)
RequestImap(-1930879809)
RequestImap(46370274)
RequestImap(976641588)
RequestImap(1121956769)
RequestImap(-340622004)
RequestImap(510716616)
RequestImap(1464851585)
RequestImap(1763246099)
RequestImap(920427419)
RequestImap(-860750371)
RequestImap(1193359531)
RequestImap(1707200698)
RequestImap(1033367448)
RemoveImap(-718318645)
RequestImap(1717399635)
RequestImap(40845437)
RequestImap(-1664053323)
RequestImap(-1535282356)
RequestImap(-363626454)
RequestImap(-1375030991)
RequestImap(-697003681)
RequestImap(1193229750)
RequestImap(-2041779893)
RequestImap(658964321)
RequestImap(112266538)
RequestImap(-593457329)
RequestImap(781058494)
RequestImap(-1022426685)
RequestImap(1989203268)
RequestImap(1020450527)
RequestImap(-531198053)
RequestImap(1467466015)
RequestImap(-551038153)
RequestImap(-484929865)
RemoveImap(841781567)
RequestImap(-755250900)
RequestImap(1262164851)
RequestImap(-620856989)
RequestImap(-1453850836)
RemoveImap(2006850489)
RequestImap(983546059)
RequestImap(-739334986)
RequestImap(1289304923)
RequestImap(-1019727725)
RequestImap(-78852126)
RequestImap(992791293)
RequestImap(-584714922)
RequestImap(-1513941904)
RequestImap(1489268640)
RequestImap(-1344255754)
RemoveImap(739805687)
RequestImap(-395621323)
RequestImap(1638937672)
RemoveImap(661576070)
RequestImap(795060201)
RemoveImap(-198004806)
RequestImap(-924329535)
RequestImap(-1815023148)
RemoveImap(-537757838)
RequestImap(1575123584)
RemoveImap(-710506752)
RemoveImap(-2117963426)
RemoveImap(-419935200)
RemoveImap(-1849681615)
RemoveImap(1122583474)
RemoveImap(-828094297)
RemoveImap(-1496155572)
RemoveImap(44502487)
RemoveImap(1358443339)
RemoveImap(-459648718)
RemoveImap(1102643191)
RemoveImap(1694722333)
RemoveImap(297811726)
RemoveImap(-1778044697)
RemoveImap(1387226336)
RemoveImap(-1310355638)
RemoveImap(1069611813)
RemoveImap(531106429)
RemoveImap(-407402757)
RemoveImap(1491306978)
RemoveImap(1459136338)
RemoveImap(-1162254606)
RemoveImap(-1869016398)
RemoveImap(1561231200)
RemoveImap(-1541842872)
RemoveImap(1311984381)
RemoveImap(-771819139)
RemoveImap(-1437554707)
RemoveImap(-981684452)
RemoveImap(560821199)
RemoveImap(1547347496)
RemoveImap(806681228)
RemoveImap(-1966238128)
RemoveImap(-957510885)
RemoveImap(-149795084)
RemoveImap(955352710)
RemoveImap(-1016007592)
RemoveImap(-1361342903)
RemoveImap(-1802418799)
RemoveImap(1976770232)
RemoveImap(41956969)
RemoveImap(-317096325)
RemoveImap(1025787994)
RemoveImap(-1255331540)
RemoveImap(-1063926197)
RemoveImap(629519239)
RemoveImap(-483001024)
RemoveImap(-2048221620)
RemoveImap(255767990)
RemoveImap(1104800593)
RemoveImap(1418284080)
RemoveImap(-1063259251)
RemoveImap(-1616015098)
RemoveImap(528036139)
RemoveImap(108234184)
RemoveImap(-763678874)
RemoveImap(-408234235)
RemoveImap(1423158124)
RemoveImap(360408116)
RemoveImap(339295570)
RequestImap(668976634)
RemoveImap(968084866)
RemoveImap(-696422730)
RemoveImap(1537844205)
RequestImap(-1766409506)
RequestImap(-724913398)
RequestImap(-1950049852)
RequestImap(-1786365097)
RemoveImap(-1221875648)
RemoveImap(-833857740)
RequestImap(1929440211)
RemoveImap(1354870005)
RemoveImap(-1718055184)
RequestImap(-1499162505)
RequestImap(-1832103801)
RequestImap(-262759679)
RequestImap(-624201308)
RequestImap(-1848077772)
RequestImap(-3789307)
RequestImap(1368296489)
RequestImap(-436084091)
RequestImap(-1754970007)
RequestImap(1364276294)
RequestImap(-1194012756)
RequestImap(-1960338341)
RequestImap(519905064)
RequestImap(1986073536)
RequestImap(-835014781)
RequestImap(2144414063)
RequestImap(1108743226)
RequestImap(-2042475701)
RequestImap(-198101911)
RequestImap(1358414393)
RequestImap(672931117)
RemoveImap(1182205549) ---Dakota River Coach Box
RequestImap(205214733)
RequestImap(-78801135)
RequestImap(-846371468)
RequestImap(-270704741)
RequestImap(1696372169)
RequestImap(26544760)
RequestImap(2100012223)
RequestImap(1216075674)
RequestImap(222513322)
RequestImap(461989174)
RequestImap(-1316886711)
RequestImap(-37875204)
RequestImap(258104717)
RequestImap(-76700394)
RemoveImap(1614255891)
RequestImap(1492183352)
RequestImap(1260721433)
RequestImap(642301973)
RequestImap(-622475043)
RequestImap(1138093977)
RequestImap(339111695)
RequestImap(-518858513)
RequestImap(1274804496)--Oil Factory Exterior
RequestImap(1597665303)--Oil Factory Interior
RequestImap(918349577)
RemoveImap(1596089211)
RequestImap(-711890106)
RequestImap(-1031113966)
RequestImap(-2133417899)
RemoveImap(-891994084)
RequestImap(1733948592)
RequestImap(634831342)
-- RequestImap(-528294019)
RequestImap(-943891161)
RequestImap(-914406102)
RequestImap(1855900423)
RequestImap(-391567710)
RemoveImap(-1809571159)
RequestImap(-1052023588)
RemoveImap(944314155)
RemoveImap(1531008020)
RequestImap(-745087561)
RequestImap(1324480450)
RemoveImap(23211744)--- Fallen Trees at cumberland forest
RemoveImap(1672215059) --- Fallen Trees at cumberland forest
RequestImap(604668055)
RequestImap(-1177027698)
RequestImap(1708195603)
RemoveImap(2133280389)
RequestImap(-205505701)
RequestImap(-51262018)
RequestImap(-432370325)
RequestImap(1624069429)
RemoveImap(2075691867)
RequestImap(-2106432785)
RemoveImap(1903595390)
RemoveImap(-24665995)
RemoveImap(1651555923)
RequestImap(-1132206051)
RequestImap(-1465375517)
RequestImap(-1233192626)
RequestImap(453346329)
RemoveImap(1432023115)
RemoveImap(1817635528)
RemoveImap(1190000937)
RemoveImap(1274066881)
RemoveImap(-912050407)
RequestImap(430278266)
RequestImap(1519091923)
RequestImap(-2142987163)
RequestImap(-791673850)
RequestImap(1585258492)
RequestImap(104102416)
RequestImap(-1265903940)
RequestImap(-474761969)
RequestImap(782453481)
RequestImap(203916786)
RequestImap(1891601353)
RequestImap(320262265)
-- RequestImap(-615794465)
-- RequestImap(-724540003)
RequestImap(-307327135)
RemoveImap(1492058366)
-- RequestImap(920612809)
-- RequestImap(-437187151)
-- RequestImap(820079465)
-- RequestImap(1424964403)
-- RequestImap(423891836)
-- RequestImap(-163787010)
-- RequestImap(777001839)
-- RequestImap(-200959126)
-- RequestImap(-794503195)
RemoveImap(-543171902) -- Bacchus Bridge damaged LOD
RequestImap(1364392658)
RequestImap(890452998)
RequestImap(-882460089)
RemoveImap(-1835067413)
RemoveImap(-1392150519)
RequestImap(-389510791)
RemoveImap(-910880980)
RequestImap(382484708)
RemoveImap(-411006854)
RequestImap(1133453602)
RequestImap(350637317)
RequestImap(1968676233)
RequestImap(2112594812)
RequestImap(1750312025)
RequestImap(-1111286486)
RemoveImap(-1625703283)
RemoveImap(563581773) -- OCreagh's Run Huge Camp
RemoveImap(1628851253)
RemoveImap(746475990)
RemoveImap(-753844687)
RemoveImap(-1045062790)
RemoveImap(247969883)
RemoveImap(-1272426249)
RemoveImap(334535013)--Rubbish in front of Annesburg Mine
-- RequestImap(582879672)
RequestImap(1713454259)
RequestImap(-1417469821)
RequestImap(1798244378)
RequestImap(-1665620584)
-- RemoveImap(-537740003)--Carts and junk in Annesburg
-- RequestImap(-1584316325)
RequestImap(-1085363933)
-- RequestImap(1517736440)
-- RequestImap(-1509154451)
-- RequestImap(-693132475)
-- RequestImap(-1984145124)
-- RequestImap(-1315256079)
RequestImap(-1653831205)
RequestImap(-1307469679)
RequestImap(-2092712551)
RemoveImap(-1595003151) -- Invisible object causes issues
RequestImap(-1528647119)
RemoveImap(-1207658444)
RequestImap(-1758697759)
RequestImap(591001924)
RequestImap(-890900091)
RequestImap(-1055775145)
RequestImap(-276247702)
RequestImap(585407854)
RequestImap(1381573999)
RequestImap(2116125345)
RequestImap(-1369880946)
RequestImap(292369320)
RequestImap(539566709)
RemoveImap(883579956)
RequestImap(-574996782)
RequestImap(1169511062)
RequestImap(-2111718052)
RequestImap(-1266106154)
RequestImap(1192526031)
RequestImap(1091543855)
RequestImap(-952533419)
RequestImap(1584946069)
RequestImap(2123010634)
RequestImap(-1081335485)
RequestImap(-1176501741)
RequestImap(-2035177903)
RemoveImap(-1147247388)
RequestImap(-1436313374)
RequestImap(-445068262)
RemoveImap(1905310584)
RemoveImap(3571872395)
RequestImap(334010167)
RequestImap(-676881895)
RequestImap(1331438832)
RequestImap(376665102)
RemoveImap(-928815382)
RemoveImap(-299265919)
RequestImap(883152450)
RemoveImap(1736837788)
RemoveImap(1814624585)
RequestImap(480644817)
RequestImap(-584332967)
RemoveImap(-392430949)
RequestImap(-904669171)
RemoveImap(-2093605706)
RequestImap(531960211)
RequestImap(537424819)
RequestImap(-1613262779)
RequestImap(-1306905398)
RequestImap(339409162)
RequestImap(647011769)
RequestImap(-273633290)
RequestImap(-118635920)
RequestImap(2038589758)
RequestImap(751578549)
RequestImap(446073162)
RequestImap(-588668690)
RequestImap(-242247633)
RequestImap(-1439987356)
RequestImap(-1126224181)
RequestImap(-1956194332)
RequestImap(945532872)
RequestImap(-890895654)
RequestImap(1953646620)
RequestImap(1299817544)
RequestImap(1204787444)
RequestImap(66523468)
RequestImap(2040259178)
RequestImap(1190076410)
RequestImap(1598834669) -- Strawberry house
RequestImap(-1106517275)
RequestImap(-1986209836)
RequestImap(1525054056)
RequestImap(749968899)
RequestImap(-186143124)
RequestImap(-2043326480)
RemoveImap(1924458218)
RequestImap(966418260)
RequestImap(-432154242)
RequestImap(500829173)
RemoveImap(77337110)
RequestImap(2029194243)
RequestImap(-1125782227)
RemoveImap(-372970556)
RemoveImap(1749008611)
RequestImap(2111695903)
RemoveImap(-1947695052)
RemoveImap(-1559513478)
RequestImap(-1321905459)
RequestImap(-1560816708)
RemoveImap(823583740)
RemoveImap(-826466486)
RemoveImap(-593183975)
RemoveImap(-362883443)
RemoveImap(-630275010)
RemoveImap(-164693058)
RemoveImap(118201723)
RequestImap(458453080)
RequestImap(-1385360243)
RemoveImap(-1288790000)
RemoveImap(758066107)
RequestImap(-1995054197)
RemoveImap(-1623126047) ----Monto Rest Lumber House, causes glitching
RemoveImap(1943484686) --Monto Rest Lumber House, causes glitching
RemoveImap(2056603274)
RequestImap(898257133)
RemoveImap(-380287375)
RemoveImap(281153830)
RemoveImap(1739101350)
RemoveImap(-634291786)
RemoveImap(-1047158045) -- Small pile of logs
RemoveImap(42081460)
RequestImap(870580095)
RequestImap(504746979)
RequestImap(138913863)
RemoveImap(-233399915) -- BW Consturction Tent LOD
RemoveImap(-90108678)
RemoveImap(1258244391)
RemoveImap(-501793326) --Blackwater prebuilt buildings
RemoveImap(-1631536545) -- Grass related to above
RemoveImap(1490756544)
RequestImap(-753454183)
RequestImap(-1854368742)
RemoveImap(466168676) ---Tents in BlackWaster Near Candy Shop
RemoveImap(-1123141803)
RemoveImap(1858796535)
RemoveImap(411846009)
RemoveImap(-393583941)
RemoveImap(-2122914678)
RequestImap(-518004776)
RemoveImap(917434281)
RemoveImap(-1859373348)
RequestImap(-442857872)
RequestImap(1251358153)
RequestImap(872406077)
RemoveImap(1471226731)
RemoveImap(-1471527776) ---UNKNOWN WEIRD
RemoveImap(1867048850)
RemoveImap(-1490939730)
RemoveImap(765141292)
RequestImap(1305415261)
RemoveImap(271879652)
RemoveImap(-2045964586)
RequestImap(-1926989471)
RemoveImap(-948615309)
RemoveImap(66382979)
RemoveImap(-1393565861)
RemoveImap(-586415580)
RemoveImap(2096286828)
RemoveImap(-1960936248)
RemoveImap(1251859782)
RemoveImap(1520095560)
RemoveImap(994786977)
RemoveImap(409171062)
RemoveImap(998966461)
RemoveImap(-1381094502)
RemoveImap(-665831452)
RequestImap(1454866069)
RequestImap(-1877706739)
RequestImap(437660121)
RequestImap(-1325803862)
RequestImap(980904027)
RequestImap(1210622903)
RequestImap(905216692)
RequestImap(-1299414622)
RequestImap(-1035166057)
RequestImap(-821741560)
RequestImap(-574138996)
RequestImap(-754870430)
RequestImap(1361745480)
RequestImap(-84124751)
RequestImap(135073157)
RequestImap(-1588838395)
RequestImap(-601173298)
RequestImap(-1852293718)
RequestImap(1202333215)
RequestImap(-817579246)
RequestImap(1811369374)
RequestImap(-1959752936)
RequestImap(1620292759)
RequestImap(-971625396)
RequestImap(-1260156441)
RequestImap(1705957630)
RequestImap(2002353235)
RequestImap(1111495201)
RequestImap(-354071784)
RequestImap(558651865)
RequestImap(857341300)
RequestImap(-1075177706)
RequestImap(-826493765)
RemoveImap(-927211837)
RequestImap(-710911638)
RequestImap(-942555699)
RequestImap(-760097927)
RequestImap(607574432)
RequestImap(-1563072795)
RequestImap(825179479)
RequestImap(-293283707)
RequestImap(-539928451)
RemoveImap(1526869387)
RemoveImap(213881095)
RemoveImap(2122708114)
RequestImap(-1031045988)
RemoveImap(1108342912)
RequestImap(976283842)
RequestImap(736578607)
RequestImap(1707393029)
RequestImap(478657470)
RequestImap(-355608501)
RequestImap(957052101)
RemoveImap(123244896)
RequestImap(607173790)
RemoveImap(-520400509)
RequestImap(-1920340119)
RequestImap(-1576393943)
RequestImap(-413795019)
RequestImap(288413571)
RequestImap(1103365569)
RequestImap(-2037661155)
RequestImap(-1150137955)
RequestImap(-1559012672)
RemoveImap(-1954657946)
RemoveImap(207396248)
RequestImap(-110381721)
RequestImap(1366418802)
RemoveImap(-2125611324)
RemoveImap(1453569688)
RemoveImap(-80564929)
RequestImap(1157066259)
RequestImap(1720188956)
RequestImap(1475953931)
RequestImap(-1166561064)
RequestImap(-1365193577)
RequestImap(300868838)
RequestImap(-316909020)
RequestImap(172011504)
RequestImap(-1788578071)
RequestImap(-1962893335)
RequestImap(1351589798)
RequestImap(1457661960)
RequestImap(163126540)
RemoveImap(-1620486708)
RequestImap(-223906810)
RequestImap(2015311123)
RequestImap(1808508475)
RequestImap(-379409079)
RemoveImap(-102951407)
RemoveImap(1998041523)
RequestImap(-1114426126)
RemoveImap(-1971474291)
RequestImap(-1687561002)
RemoveImap(-1425946870)
RemoveImap(163458877)
RemoveImap(1957225320)
RemoveImap(-860696938)
RemoveImap(-1893724593)
RequestImap(394987827)
RequestImap(-937893311)
RequestImap(321670654)
RequestImap(-1916602073)
RequestImap(-1611076340)
RequestImap(1079303588)
RequestImap(970924250)
RequestImap(-441619793)
RequestImap(1381006186)
RequestImap(140744122)
RequestImap(-1177590512)
RemoveImap(1267297807)
RequestImap(-182995231)
RequestImap(-1426249148)
RequestImap(-1445186253)
RequestImap(2047954825)
RequestImap(-2085723453)
RequestImap(1434945142)
RequestImap(658099812)
RequestImap(360721137)
RequestImap(1268291329)
RequestImap(943845492)
RequestImap(-2037324418)
RequestImap(937052178)
RequestImap(698067861)
RequestImap(-741769242)
RequestImap(2019747962)
RequestImap(1785810071)
RequestImap(1423450469)
RequestImap(1189709192)
RequestImap(512556003)
RequestImap(1770786479)
RequestImap(2022451711)
RequestImap(-1933895237)
RequestImap(-1987982797)
RequestImap(-104137172)
RequestImap(1924209179)
RequestImap(-2084193212)
RequestImap(-838184752)
RequestImap(-1433138716)
RequestImap(-1103841944)
RequestImap(-621941030)
RequestImap(1782877577)
RequestImap(-584027313)
RequestImap(1219098211)
RequestImap(2097700639)
RequestImap(728120284)
RequestImap(1370097763)
RemoveImap(1948051928)
RequestImap(1548546221)
RemoveImap(106249677)
RequestImap(1546110128)
RemoveImap(-855912354)
RequestImap(324486076)
RequestImap(-2052582076)
RequestImap(-402976431)
RequestImap(1560807181)
RemoveImap(-723982773)
RemoveImap(-268335331)
RequestImap(-302735166)
RequestImap(-2104773585)
RemoveImap(2101101756)
RequestImap(-1472352094)
RequestImap(-2077690059)
RequestImap(1029525997)
RequestImap(-15722296)
RemoveImap(327932996)
RequestImap(-745860880)
RequestImap(1219276914)
RequestImap(711016796)
RequestImap(690962168)
RequestImap(384146021)
RequestImap(2082890965)
RemoveImap(-1192199739)
RequestImap(-65072454)
RemoveImap(-770240157)
RequestImap(71064384)
RequestImap(-1380983970)
RequestImap(135028740)
RequestImap(-515910704)
RequestImap(398639187)
RequestImap(532770666)
RequestImap(948877318)
RemoveImap(-365969388)
RemoveImap(780406120)
RequestImap(1372565859)
RequestImap(1111220101)
RequestImap(-688011628)
RemoveImap(114673428)
RequestImap(1822607116)
RequestImap(216214729)
RequestImap(-87826930)
RequestImap(286801141)
RequestImap(622597018)
RequestImap(2016081133)
RemoveImap(-21876618)
RequestImap(1048790253)
RequestImap(363257921)
RequestImap(1649275138)
RequestImap(-1872939092)
RequestImap(-1484530238)
RequestImap(-964156415)
RequestImap(188985281)
RequestImap(2097480406)
RequestImap(-1390612743)
RequestImap(1013712166)
RequestImap(107317036)
RequestImap(-554880142)
RequestImap(1403324282)
RequestImap(-1841279810)
RequestImap(-2066612507)
RequestImap(1662136507)
RequestImap(1386355334)
RequestImap(-1397680620)
RequestImap(1467687992)
RequestImap(2017271733)
RequestImap(-2111123884)
RequestImap(2047806036)
RequestImap(499090815)
RequestImap(1251925821)
RequestImap(-1821269135)
RequestImap(1769061820)
RequestImap(-1466334531)
RequestImap(1461000451)
RequestImap(-780636043)
RequestImap(-685270742)
RequestImap(-1341918262)
RequestImap(-1906732332)
RequestImap(-526829)
RequestImap(-1754422016)
RequestImap(688413808)
RequestImap(794749213)
RequestImap(17042536)
RequestImap(298954243)
RequestImap(1003223945)
RequestImap(220012076)
RequestImap(1465430690)
RequestImap(716331350)
RequestImap(1734859244)
RequestImap(-750963311)
RemoveImap(-886310806)
RequestImap(1926336063)
RemoveImap(-800534102)
RequestImap(1648013752)
RemoveImap(-753535900)
RequestImap(-693870347)
RequestImap(-877653131)
RequestImap(1335714585)
RequestImap(-1382351182)
RequestImap(-688890765)
RequestImap(-313992757)
RequestImap(643415268)
RequestImap(-383442850)
RequestImap(-963708270)
RequestImap(1789847914)
RequestImap(1724935027)
RequestImap(170282000)
RequestImap(-1323936218)
RequestImap(-1378006849)
RequestImap(1527202601)
RequestImap(562620119)
RequestImap(-1622723192)
RequestImap(-872587325)
RequestImap(2076873943)
RequestImap(-1176057358)
RequestImap(1253360932)
RequestImap(-1656346086)
RequestImap(-597695075)
RequestImap(-1159690567)
RequestImap(719400048)
RequestImap(1737389826)
RequestImap(-1033632314)
RequestImap(59954835)
RequestImap(-98843293)
RequestImap(1928252407)
RequestImap(-1562347907)
RequestImap(1529136698)
RequestImap(-1842411116)
RequestImap(906570755)
RequestImap(1718863943)
RemoveImap(-605128543)
RemoveImap(-1395712024)
RemoveImap(-1232260252)
RequestImap(1811658510)
RemoveImap(-1311188166)
RequestImap(-337712376)
RemoveImap(2084338579)
RemoveImap(-691276094)
RequestImap(1404611977)
RequestImap(1401474740)
RequestImap(516817794)
RemoveImap(-1466175146)
RequestImap(-2093572127)
RequestImap(-498256840)
RemoveImap(-1190435787)
RemoveImap(291880860)
RequestImap(1996801454)
RequestImap(-1023331176)
RequestImap(-276524767)
RequestImap(1578454569)
RequestImap(2101399188)
RequestImap(-1218507547)
RequestImap(483731764)
RequestImap(289521398)
RemoveImap(1883534212)
RequestImap(209919309)
RemoveImap(-166639526)
RequestImap(1915768280)
RemoveImap(-105525329)
RequestImap(612040624)
RequestImap(-1176903838)
RequestImap(-1389718656)
RemoveImap(-958046355) -- Cotton piles
RemoveImap(2107657444) -- Cotton piles
RemoveImap(-2023595928)
-- RequestImap(-759698431)
RemoveImap(-759698431)
RemoveImap(-406964748)
RequestImap(481636996)
RequestImap(-1671953459)
RemoveImap(910941329)
RequestImap(828093818)
RequestImap(518127510)
RemoveImap(758684739)
RemoveImap(-661825463)
RequestImap(1343484786)
RemoveImap(1033721560)
RemoveImap(1989074279)
RequestImap(349486662)
RequestImap(1603294144)
RemoveImap(-1754425204)
RequestImap(-1036501021)
RequestImap(1871051363)
-- RequestImap(945502524)
RemoveImap(945502524)
RemoveImap(-1436188587)
RemoveImap(-468702164)
RequestImap(-687151759)
RemoveImap(1882605165)
RequestImap(869642051)
RequestImap(-184821200)
RequestImap(-490818122)
RequestImap(1907352897)
RequestImap(1700234797)
RequestImap(-708550718)
RemoveImap(-1377139506)
RequestImap(767293177)
RemoveImap(-1739900853)
RemoveImap(-646014955)
RemoveImap(159921796)
RemoveImap(-2014929982)
RemoveImap(-1070054959)
RemoveImap(-558920293)
RemoveImap(-872749010)
RemoveImap(-1924933663)
RemoveImap(-54044677)
RemoveImap(2116967107)
RemoveImap(1721842998)
RemoveImap(92080743)
RemoveImap(-1619008260)
RemoveImap(964593693)
RequestImap(-882188392)
RemoveImap(773757120)
RemoveImap(-1618574684)
RemoveImap(827269092)
RemoveImap(1706509616)
RemoveImap(-90228526)
RequestImap(-520163372)
RemoveImap(1265596420)
RemoveImap(-1388202749)
RemoveImap(54661488)
RemoveImap(1079213989) -- shady belle clutter
RemoveImap(-621187540)
RemoveImap(-638481378)
RemoveImap(1833824812)
RemoveImap(1865439665)
RemoveImap(2036492390)
RemoveImap(-1062918766)
RemoveImap(-555683060)
RemoveImap(-415514741)
RemoveImap(809554858)
RemoveImap(1810083187)
RemoveImap(-412827149)
RemoveImap(414622870)
RemoveImap(923572416)
RemoveImap(67198036)
RemoveImap(-1130111983)
RemoveImap(557551306)
RemoveImap(1674493966)
RemoveImap(-1115840558)
RemoveImap(-1910456812)
RemoveImap(-960337247)
RemoveImap(1155877447)
RemoveImap(928165666)
RemoveImap(2048341166)
RemoveImap(-1015572514)
RemoveImap(-785304751)
RemoveImap(1448230281)
RemoveImap(1687083522)
RemoveImap(-2053999329)
RemoveImap(2017155697)
RemoveImap(1802911979)
RemoveImap(1567139024)
RemoveImap(-1037436240)
RemoveImap(-1747868160)
RemoveImap(1588507579)
RemoveImap(1396808929)
RemoveImap(-1392451243)
RequestImap(2061467757)
RemoveImap(-1828030290)
RemoveImap(-2147051362)
RemoveImap(-997495998)
RequestImap(266022415)
RemoveImap(-414377604)
RemoveImap(-109593135)
RemoveImap(990134505)
RemoveImap(1279910772)
RemoveImap(1677041346)
RemoveImap(1936473519)
RemoveImap(1956790299)
RemoveImap(-2029001482)
RemoveImap(-538645000)
RemoveImap(-789852154)
RemoveImap(-1003800955)
RemoveImap(-1250617063)
RemoveImap(495480888)
RemoveImap(884576413)
RemoveImap(778703691)
RemoveImap(514406510)
RemoveImap(-421730990)
RemoveImap(-134624703)
RemoveImap(2004706822)
RemoveImap(-910918420)
RemoveImap(-327708229)
RemoveImap(1048845581)
RemoveImap(-1535722316)
RemoveImap(1547994518)
RemoveImap(-1276109918)
RemoveImap(-1386423483)
RemoveImap(-1331593143)
RequestImap(-1405375965)
RequestImap(1881774051)
RequestImap(912202325)
RequestImap(1175400068)
RequestImap(854689865)
RemoveImap(1772877245)
RequestImap(-891504611)
RequestImap(-810270260)
RequestImap(83602522)
RequestImap(-2054476413)
RequestImap(1988923494)
RequestImap(-1676256391)
RequestImap(901975752)
RequestImap(2119466214)
RequestImap(1812453453)
RequestImap(1393010249)
RequestImap(-1799943886)
RemoveImap(45121961)  --Dakota River Lockbox Crash
RemoveImap(1949854427)
RemoveImap(-447844606)

RemoveImap(580700069)
RemoveImap(-1883922051)
RemoveImap(1347068672)
RemoveImap(-385790791)
RemoveImap(943998860)
RemoveImap(1056170594)
RequestImap(-873881483)
RemoveImap(881979872)
RemoveImap(1157695860)
RemoveImap(1859948183)
RemoveImap(3421085813)
RequestImap(-1688366042)
RemoveImap(-929277449)
RemoveImap(-801609437)
RemoveImap(-1009052202)
RemoveImap(-278745837)
RemoveImap(-41173958)
RemoveImap(1160690623)
RemoveImap(-660075384)
RemoveImap(1547403545)
RemoveImap(-775951892)
RemoveImap(808576710)
RemoveImap(149553684)
RemoveImap(137316925)
RequestImap(1431947993)
RequestImap(1017355491)
RemoveImap(-920505696)
RemoveImap(-596723840)
RemoveImap(-1762770596)
RemoveImap(-1026473536)
RemoveImap(-516683274)
RequestImap(-1004522372)
RemoveImap(281772765)
RemoveImap(-2084311522)
RemoveImap(489834626)
RemoveImap(-1360840312)
RequestImap(1628286919)
RequestImap(-704461521)
RemoveImap(1082980257)
RemoveImap(-1725465949)
RemoveImap(1821956151)
RemoveImap(-1993960878)
RemoveImap(204868257)
RemoveImap(432272547)
RequestImap(1895127686)
RequestImap(1461266126)
RemoveImap(-1473336090)
RequestImap(-1490034522)
RemoveImap(-205116461)
RequestImap(-1013403664)
RemoveImap(-670748311)
RemoveImap(-2124415277)
RemoveImap(-473077489)
RequestImap(619024057)
RemoveImap(-836433697)
RemoveImap(-494733971)
RemoveImap(490883533)
RemoveImap(752665876)
RemoveImap(1136457806)
RemoveImap(-342806042)
RemoveImap(1255880931)
RequestImap(1676972066)
RemoveImap(-643411908)
RemoveImap(-1901860833)
RemoveImap(-1225383143)
RemoveImap(206289712)
RemoveImap(1405627586)
RemoveImap(-1889108254)
RemoveImap(-1583923165)
RemoveImap(1726243396)
RemoveImap(96746001)
RequestImap(1871261290)
RequestImap(1767170589)
RequestImap(396094389)
RequestImap(68538405)
RequestImap(-540286923)
RequestImap(695709062)
RequestImap(1395510290)
RequestImap(-1366130296)
RequestImap(1205820933)
RequestImap(195206081)
RemoveImap(1355914142)
RemoveImap(165972019)
RemoveImap(-1036688493)
RequestImap(-30157790)
RequestImap(1509141447)
RequestImap(-469909433)
RequestImap(-1461530058)
RequestImap(1826022799)
RequestImap(-1859413313)
RequestImap(942470447)
RequestImap(-1170563128)
RequestImap(1394163483)
RequestImap(-483649675)
RequestImap(-782601262)
RequestImap(212587871)
RemoveImap(-436566493)
RequestImap(-677790400)
RemoveImap(143811737)
RemoveImap(3617176896)
RemoveImap(3216389370)
RemoveImap(2484301515)
RequestImap(1679182807)
RequestImap(-1512794226)
RemoveImap(146172383)
RemoveImap(291732199)
RemoveImap(876228895)
RemoveImap(1417687142)
RequestImap(-2035101386)
RemoveImap(1520435387)
RemoveImap(1078633574)
RemoveImap(1305074360)
RemoveImap(1048677741)
RemoveImap(1284188544)
RequestImap(-1986089134)
RequestImap(913995529)
RequestImap(-730093764)
RemoveImap(-359734366)
RequestImap(175173994)
RemoveImap(-686953321)
RemoveImap(54029413)
RequestImap(-739754595)
RequestImap(-931280709)
RemoveImap(-1737485501)
RemoveImap(-1070234238)
RemoveImap(191078900)
RequestImap(-2096572276)
RequestImap(2015532863)
RequestImap(-800942395)
RequestImap(-741366935)
RequestImap(-1593790123)
RequestImap(-595698218)
RemoveImap(-1269989522)
RemoveImap(-1995815064)
RequestImap(-1716205818)
RequestImap(728046625)
RequestImap(2033090463)
RemoveImap(826576088)
RequestImap(1713084298)
RequestImap(928528900)
RequestImap(391022529)
RequestImap(1870870569)
RequestImap(-2118853492)
RequestImap(-597126658)
RequestImap(158063004)
RequestImap(1290812287)
RequestImap(-1537525865)
RequestImap(2079207010)
RequestImap(1736386364)
RemoveImap(-2071756699)
RequestImap(-1781758360)
RequestImap(1184975829)
RequestImap(1173232190)
RequestImap(105236016)
RequestImap(-1081428331)
RequestImap(-527717905)
RemoveImap(1969270586)
RemoveImap(-1862782800)
RequestImap(-1113878850)
RemoveImap(1186551862)
RequestImap(-1112692383)
RemoveImap(526763180)
RequestImap(1802967124)
RequestImap(-598586662)
RequestImap(-1838419604)
RequestImap(-626724117)
RequestImap(-1912028958)
RequestImap(563944718)
RequestImap(-1532653291)
RequestImap(739567292)
RequestImap(729601893)
RequestImap(1128276345)
RequestImap(1873580721)
RequestImap(1706906210)
RequestImap(2094371528)
RequestImap(1688216398)
RequestImap(-1802096589)
RequestImap(669655585)
RequestImap(-58196573)
RequestImap(-895099271)
RequestImap(-2060408070)
RemoveImap(364962188)
RequestImap(556610581)
RequestImap(-1394479903)
RequestImap(-786679704)
RequestImap(-596115807)
RequestImap(1557698400)
RequestImap(-1484676996)
RequestImap(472339111)
RequestImap(-262371610)
RequestImap(1123990218)
RequestImap(-1461922204)
RequestImap(-1519499946)
RequestImap(-535498894)
RequestImap(2116024182)
RequestImap(25328693)
RequestImap(1934461192)
RequestImap(-1434912930)
RequestImap(491871729)
RequestImap(-1078418763)
RequestImap(-415281478)
RequestImap(-722949619)
RequestImap(202086482)
RequestImap(-87394864)
RequestImap(1473078398)
RequestImap(-421457898)
RemoveImap(1044079550)
RemoveImap(894787561)
RequestImap(-689352221)
RequestImap(1722569012)
RequestImap(-451832572)
RequestImap(-1349539327)
RequestImap(-1640200357)
RequestImap(-2127665186)
RequestImap(1854980771)
RequestImap(1513363974)
RequestImap(-1280884206)
RequestImap(-758463889)
RequestImap(-1116430120)
RequestImap(1601053042)
RequestImap(1623114783)
-- RequestImap(-703127827) -- Ocreagh's run huge camp
RequestImap(-1933338814)
RequestImap(952753807)
RequestImap(-64729392)
RequestImap(753181111)
RequestImap(1475089455)
RequestImap(637861796)
RequestImap(913170302)
RequestImap(702867922)
RequestImap(187740801)
RequestImap(-523896426)
RemoveImap(483041556)
RequestImap(-797033116)
RemoveImap(-455342387)
RemoveImap(-1407773372)
RemoveImap(2020752077)
RequestImap(593772301)
RequestImap(207032563)
RequestImap(-1984361543)
RemoveImap(-869788001)
RemoveImap(-691393565)
RemoveImap(-1448947307)
RemoveImap(-1171033418)
RequestImap(-487373767)
RequestImap(341106871)
RemoveImap(-835267464)
RemoveImap(992700940)
RemoveImap(-1324099905)
RemoveImap(1589293578)
RemoveImap(1435082664)
RemoveImap(-2091615427)
RequestImap(227706189)
RemoveImap(1587857798)
RemoveImap(-454287921)
RemoveImap(1735860959)
RequestImap(-109606367)
RemoveImap(-1997605640)
RemoveImap(2066602358)
RemoveImap(-1374896333)
RemoveImap(441668603)
-- RequestImap(-165202905)
RemoveImap(-165202905) -- green over hole (no trail)
RequestImap(-1377975054)
RemoveImap(897624424)
RemoveImap(-1327148782)
RemoveImap(-1965378386)
RequestImap(-960397707)
RequestImap(1424082059)
RequestImap(-1939038021)
RequestImap(-1613805696)
RemoveImap(801042892)
RemoveImap(25498969)
RemoveImap(1419819915)
RemoveImap(621272158)
RemoveImap(1192526031)
RemoveImap(422167750)
RequestImap(-1403908542)
RequestImap(-2116659774)
RequestImap(-893624314)
RequestImap(985448695)
RequestImap(-1325016116)
RequestImap(1532009326)
RequestImap(1970695826)
RequestImap(-706937940)
RemoveImap(-71885140)
RemoveImap(-1792872817)
RequestImap(-1402083909)
RequestImap(255093300)
RequestImap(1344772301)
RequestImap(-382865315)
RequestImap(181690478)
RequestImap(774601424)
RemoveImap(431365499)
RemoveImap(-2090209059)
RemoveImap(1965249616)
RemoveImap(276582710)
RemoveImap(1977031606)
RemoveImap(-2021605623)
RequestImap(1191890045)
RequestImap(19217583)
RequestImap(-284612948)
RequestImap(-846230557)
RemoveImap(-1614141377)---Dakota River Coach Crash
RemoveImap(-926795318)
RequestImap(2095421392)
RemoveImap(82084523)
RemoveImap(1815262278)
RemoveImap(1511919645)
RemoveImap(767505137)
RemoveImap(588062093) -- More stumps
RemoveImap(471934509)
RemoveImap(995675696) -- Some stumps
RemoveImap(706423733) -- More stumps

RemoveImap(-1340001373) -- Trees with branches
RemoveImap(-125588314) -- Trees 1
RequestImap(-922917541) -- Trees 2
RequestImap(1524580507) -- Trees 3
RequestImap(204481342) -- Trees 4
RequestImap(-2116397290) -- Trees 5
RemoveImap(-1466172032)
RemoveImap(-981873755)
RequestImap(2013143748)
--RequestImap(1831662563)
RequestImap(1289178060)
RequestImap(-642132908)
RequestImap(-848315456)
RequestImap(105426297)
RequestImap(1202346365)
RequestImap(-2139410267)
RequestImap(1433203214)
RequestImap(-1795618779)
RequestImap(-1873685184)
RequestImap(-697307430)
RemoveImap(633503129)
RemoveImap(633503139)
RequestImap(-1536198599)
RequestImap(1759143160)
RemoveImap(-677362237)
RemoveImap(1641449717)
RemoveImap(-562289114)
RequestImap(-947895270)
RequestImap(386231914)
RequestImap(-329705198)
RequestImap(18956962)
RequestImap(1587477916)
RequestImap(-1018713880)
RequestImap(980234126)
RequestImap(1891284833)
RequestImap(1576931820)
RequestImap(-1296418825)
RequestImap(2035942164)
RequestImap(1764814553)
RequestImap(748826019)
RequestImap(-1892843345)
RequestImap(146746575)
RequestImap(-960136064)
RequestImap(1812999696)
RemoveImap(-502582154)
RemoveImap(-1440675331)
RequestImap(1270535492)
RequestImap(1412515639)
RequestImap(366542865)
RequestImap(241205019)
RequestImap(-1108618313)
RequestImap(-1184151355)
RequestImap(-946313953)
RequestImap(-889100155)
RequestImap(2056145270)
RequestImap(-1603329230)
RequestImap(-787678727)
RequestImap(-665583358)
RequestImap(-282972514)
RequestImap(-64632667)
RequestImap(314111435)
RequestImap(24859476)
RequestImap(340621560)
RequestImap(1266707689)
RequestImap(434145706)
RequestImap(654746614)
RequestImap(1965736001)
RequestImap(1650694835)
RequestImap(1133172356)
RemoveImap(-559257162)
RemoveImap(418666411)
RemoveImap(651621232)
RemoveImap(979670262)
RequestImap(-1452136643)
RequestImap(-744260705)
RequestImap(1424293412)
RequestImap(1060557512)
RequestImap(-362403544)
RequestImap(-592147003)
RequestImap(352816221)
RequestImap(1128622296)
RequestImap(979982112)
RequestImap(1756640181)
RequestImap(1557076971)
RequestImap(1913538153)
RequestImap(2113454609)
RequestImap(-1865650458)
RemoveImap(-1015786727)
RequestImap(-1560636071)
RequestImap(-904833761)
RequestImap(103750283)
RequestImap(-1017701936)
RequestImap(-717025835)
RequestImap(2039534767)
RemoveImap(-1451954802)
RequestImap(-1554566073)
RequestImap(510089692)
RequestImap(-1208336782)
RequestImap(1415119588)
RequestImap(1171197889)
RequestImap(-1377880324)
RequestImap(-701897747)
RequestImap(-1781252352)
RequestImap(-1356658830)
RequestImap(1169154818)
RequestImap(-102239629)
RequestImap(1507566204)
RequestImap(-2122297972)
RequestImap(-1360647871)
RequestImap(88716961)
RequestImap(-2051158745)
RequestImap(488068970)
RequestImap(409306948)
RequestImap(-1996105597)
RequestImap(1017072544)
RequestImap(-1588780614)
RequestImap(1857501669)
RequestImap(2053819138)
RequestImap(-763069375)
RequestImap(-522714993)
RequestImap(-1352620713)
RequestImap(-492341871)
-- RequestImap(-15009406)
-- RequestImap(1191283411)
-- RequestImap(507232138)
RemoveImap(-604091710)
RequestImap(495423143)
RequestImap(-2131576785)
RequestImap(-2137016051)
RequestImap(1193151399)
RequestImap(-1353871107)
RequestImap(2026630914)
RequestImap(-225844616)
RequestImap(2107567819)
RequestImap(1108015391)
RequestImap(-1202265833)
RequestImap(-1852256117)
RemoveImap(728379187)
RequestImap(375693548)
RequestImap(1502951187)
RemoveImap(-636161219)
RemoveImap(1636184722)
RequestImap(154479184)
RequestImap(371690004)
RequestImap(1480174383)
RequestImap(-276524767)
RequestImap(728046625)
RequestImap(-1986209836)
RequestImap(-929277449)
RemoveImap(-801609437)
RemoveImap(-414301703)
RemoveImap(1423912753)
RequestImap(-1809365172)
RequestImap(1092530042)
RequestImap(-2051059045)
RemoveImap(-612173099)
RequestImap(-1408478050)
RequestImap(-1974746920)
RemoveImap(1171226610)
RemoveImap(406701199)
RemoveImap(-1151968796)
RequestImap(1975720265)
RequestImap(508578717)
RequestImap(-848533860)
RequestImap(830856441)
RemoveImap(-522767301)
RemoveImap(-2103414139)
RemoveImap(771896020)
RequestImap(895825612)
RequestImap(1256749990)
RemoveImap(-1934886317)
--RequestImap(-1934886317)
RequestImap(993438435)
RequestImap(1495728629)
RemoveImap(967935536)
RemoveImap(764325310)
RequestImap(-773956478)
RemoveImap(-875828222) -- Rhodes trees and gardens
RemoveImap(-1615749463)
RemoveImap(-429506139)
RemoveImap(-200270658)
RemoveImap(-901084182) 
RemoveImap(-1195873822)
RemoveImap(190848106)
RemoveImap(-1207218596)
RemoveImap(1627459254)
RequestImap(-361709910)
RemoveImap(-1323334072)
RequestImap(-1521897637)
RequestImap(-716370751)
RemoveImap(-2053832767)
RequestImap(372806894)
RequestImap(-1534577778)
RequestImap(-2024941402)
RemoveImap(-50297425)
RemoveImap(536714458)
RequestImap(2068117822)
RequestImap(-576687258)
RemoveImap(226557169)
RemoveImap(476687617)
RequestImap(1856368424)
RemoveImap(568096966)
RequestImap(1104817207)
RequestImap(478888800)
RemoveImap(1955414013)
RemoveImap(1924740339)
RequestImap(-1207218596)
RequestImap(-116967529)
RemoveImap(-605808708)
RequestImap(-100150000)
RequestImap(-320403109)
RequestImap(18369533)
RemoveImap(-331965904)
RemoveImap(127191252)
RequestImap(-2074957003)
RequestImap(-1226747327)
RequestImap(-141795616)
RequestImap(-1973910443)
RequestImap(1883767827)
RequestImap(-1562607865)

-- BOUNTY BOARDS --
RemoveImap(1570947227) -- Annesburg
RemoveImap(227456234) --Annesburg
RemoveImap(59120723) -- Armadillo
RemoveImap(-1975145165) -- Benedict
RemoveImap(-1293161516) -- Blackwater
RemoveImap(-214604861) -- Emerald Station
RemoveImap(-1913584952)--Emerald Station
RemoveImap(1817836578) -- Rhodes
RemoveImap(1418611013) -- Riggs
RemoveImap(-226455701) -- StDenis
RemoveImap(-1019371157) -- Strawberry
RemoveImap(1296658155) -- Tumbleweed
RemoveImap(886997475) -- Valentine
RemoveImap(952801839)-- Valentine
RemoveImap(-428652579) -- Vanhorn
RemoveImap(-1487154162) --Vanhorn
RemoveImap(-605257184) -- Wallace
--END BOUNTY BOARDS --

RemoveImap(845427792)
RemoveImap(-1775985984)
RemoveImap(-1040386459)
RemoveImap(-1297130328)
RemoveImap(-693659956)
RemoveImap(-749007702)
RemoveImap(1715626179)
RemoveImap(2088585697)

RemoveImap(-2051059045)
RemoveImap(-223199122)

RemoveImap(4133695711)

RequestImap(1359061265)
RequestImap(1173561253)

RemoveImap(2662619063)