local cross = {
 font
}

local CustomFont = { } do
	local HttpService = game:GetService("HttpService")

	function CustomFont:New(Name, Weight, Style, Data)
		if isfile("transsense" .. "/" .. Name .. ".json") then
			delfile("transsense" .. "/" .. Name .. ".json")
		end
		
		if not isfile("transsense" .. "/" .. Name .. ".ttf") then
			delfile("transsense" .. "/" .. Name .. ".ttf")
		end
		
		writefile("transsense" .. "/" .. Name .. ".ttf", game:HttpGet(Data.Url))
		
		local FontData = {
			name = Name,
			faces = { {
				name = "Regular",
				weight = Weight,
				style = Style,
				assetId = getcustomasset("transsense" .. "/" .. Name .. ".ttf")
			} }
		}
		
		writefile("transsense" .. "/" .. Name .. ".json", HttpService:JSONEncode(FontData))
		return Font.new(getcustomasset("transsense" .. "/" .. Name .. ".json"))
	end
	
	function CustomFont:Get(Name)
		if isfile("transsense" .. "/" .. Name .. ".json") then
			return Font.new(getcustomasset("transsense" .. "/" .. Name .. ".json"))
		end
	end
	
	CustomFont:New("fs-tahoma-8px", 400, "Bold", {
		Url = "https://github.com/i77lhm/storage/raw/refs/heads/main/fonts/fs-tahoma-8px.ttf"
	})
	
	cross.font = CustomFont:Get("fs-tahoma-8px")
end

local LMG2L = {};

LMG2L["ScreenGui_1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
LMG2L["ScreenGui_1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;


LMG2L["Frame_2"] = Instance.new("Frame", LMG2L["ScreenGui_1"]);
LMG2L["Frame_2"]["BorderSizePixel"] = 0;
LMG2L["Frame_2"]["BackgroundColor3"] = Color3.fromRGB(53, 53, 53);
LMG2L["Frame_2"]["Size"] = UDim2.new(0, 565, 0, 670);
LMG2L["Frame_2"]["Position"] = UDim2.new(0, 52, 0, 8);


LMG2L["UIStroke_3"] = Instance.new("UIStroke", LMG2L["Frame_2"]);



LMG2L["Frame_4"] = Instance.new("Frame", LMG2L["Frame_2"]);
LMG2L["Frame_4"]["BorderSizePixel"] = 0;
LMG2L["Frame_4"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27);
LMG2L["Frame_4"]["Size"] = UDim2.new(0, 563, 0, 668);
LMG2L["Frame_4"]["Position"] = UDim2.new(0, 1, 0, 1);


LMG2L["Frame2_5"] = Instance.new("Frame", LMG2L["Frame_4"]);
LMG2L["Frame2_5"]["BorderSizePixel"] = 0;
LMG2L["Frame2_5"]["BackgroundColor3"] = Color3.fromRGB(67, 67, 67);
LMG2L["Frame2_5"]["Size"] = UDim2.new(0, 542, 0, 32);
LMG2L["Frame2_5"]["Position"] = UDim2.new(0, 10, 0, 34);
LMG2L["Frame2_5"]["Name"] = [[Frame2]];


LMG2L["TextButton_6"] = Instance.new("TextButton", LMG2L["Frame2_5"]);
LMG2L["TextButton_6"]["BorderSizePixel"] = 0;
LMG2L["TextButton_6"]["TextSize"] = 12;
LMG2L["TextButton_6"]["AutoButtonColor"] = false;
LMG2L["TextButton_6"]["TextColor3"] = Color3.fromRGB(83, 127, 255);
LMG2L["TextButton_6"]["BackgroundColor3"] = Color3.fromRGB(59, 59, 59);
LMG2L["TextButton_6"]["FontFace"] = cross.font;
LMG2L["TextButton_6"]["Size"] = UDim2.new(0, 90, 0, 30);
LMG2L["TextButton_6"]["Text"] = [[Legitbot]];
LMG2L["TextButton_6"]["Position"] = UDim2.new(0, 1, 0, 1);


LMG2L["UIGradient_7"] = Instance.new("UIGradient", LMG2L["TextButton_6"]);
LMG2L["UIGradient_7"]["Rotation"] = 90;
LMG2L["UIGradient_7"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(108, 108, 108))};


LMG2L["UIStroke_8"] = Instance.new("UIStroke", LMG2L["TextButton_6"]);



LMG2L["UIStroke_9"] = Instance.new("UIStroke", LMG2L["UIStroke_8"]);



LMG2L["UIStroke_a"] = Instance.new("UIStroke", LMG2L["Frame2_5"]);



LMG2L["TextButton_b"] = Instance.new("TextButton", LMG2L["Frame2_5"]);
LMG2L["TextButton_b"]["BorderSizePixel"] = 0;
LMG2L["TextButton_b"]["TextSize"] = 12;
LMG2L["TextButton_b"]["AutoButtonColor"] = false;
LMG2L["TextButton_b"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
LMG2L["TextButton_b"]["BackgroundColor3"] = Color3.fromRGB(59, 59, 59);
LMG2L["TextButton_b"]["FontFace"] = cross.font;
LMG2L["TextButton_b"]["Size"] = UDim2.new(0, 90, 0, 30);
LMG2L["TextButton_b"]["Text"] = [[Ragebot]];
LMG2L["TextButton_b"]["Position"] = UDim2.new(0, 91, 0, 1);


LMG2L["UIGradient_c"] = Instance.new("UIGradient", LMG2L["TextButton_b"]);
LMG2L["UIGradient_c"]["Rotation"] = 90;
LMG2L["UIGradient_c"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(159, 159, 159))};


LMG2L["UIStroke_d"] = Instance.new("UIStroke", LMG2L["TextButton_b"]);



LMG2L["TextButton_e"] = Instance.new("TextButton", LMG2L["Frame2_5"]);
LMG2L["TextButton_e"]["BorderSizePixel"] = 0;
LMG2L["TextButton_e"]["TextSize"] = 12;
LMG2L["TextButton_e"]["AutoButtonColor"] = false;
LMG2L["TextButton_e"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
LMG2L["TextButton_e"]["BackgroundColor3"] = Color3.fromRGB(59, 59, 59);
LMG2L["TextButton_e"]["FontFace"] = cross.font;
LMG2L["TextButton_e"]["Size"] = UDim2.new(0, 90, 0, 30);
LMG2L["TextButton_e"]["Text"] = [[Visuals]];
LMG2L["TextButton_e"]["Position"] = UDim2.new(0, 181, 0, 1);


LMG2L["UIGradient_f"] = Instance.new("UIGradient", LMG2L["TextButton_e"]);
LMG2L["UIGradient_f"]["Rotation"] = 90;
LMG2L["UIGradient_f"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(159, 159, 159))};


LMG2L["UIStroke_10"] = Instance.new("UIStroke", LMG2L["TextButton_e"]);



LMG2L["TextButton_11"] = Instance.new("TextButton", LMG2L["Frame2_5"]);
LMG2L["TextButton_11"]["BorderSizePixel"] = 0;
LMG2L["TextButton_11"]["TextSize"] = 12;
LMG2L["TextButton_11"]["AutoButtonColor"] = false;
LMG2L["TextButton_11"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
LMG2L["TextButton_11"]["BackgroundColor3"] = Color3.fromRGB(59, 59, 59);
LMG2L["TextButton_11"]["FontFace"] = cross.font;
LMG2L["TextButton_11"]["Size"] = UDim2.new(0, 90, 0, 30);
LMG2L["TextButton_11"]["Text"] = [[Misc]];
LMG2L["TextButton_11"]["Position"] = UDim2.new(0, 271, 0, 1);


LMG2L["UIGradient_12"] = Instance.new("UIGradient", LMG2L["TextButton_11"]);
LMG2L["UIGradient_12"]["Rotation"] = 90;
LMG2L["UIGradient_12"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(159, 159, 159))};


LMG2L["UIStroke_13"] = Instance.new("UIStroke", LMG2L["TextButton_11"]);



LMG2L["TextButton_14"] = Instance.new("TextButton", LMG2L["Frame2_5"]);
LMG2L["TextButton_14"]["BorderSizePixel"] = 0;
LMG2L["TextButton_14"]["TextSize"] = 12;
LMG2L["TextButton_14"]["AutoButtonColor"] = false;
LMG2L["TextButton_14"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
LMG2L["TextButton_14"]["BackgroundColor3"] = Color3.fromRGB(59, 59, 59);
LMG2L["TextButton_14"]["FontFace"] = cross.font;
LMG2L["TextButton_14"]["Size"] = UDim2.new(0, 90, 0, 30);
LMG2L["TextButton_14"]["Text"] = [[Settings]];
LMG2L["TextButton_14"]["Position"] = UDim2.new(0, 361, 0, 1);


LMG2L["UIGradient_15"] = Instance.new("UIGradient", LMG2L["TextButton_14"]);
LMG2L["UIGradient_15"]["Rotation"] = 90;
LMG2L["UIGradient_15"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(159, 159, 159))};


LMG2L["UIStroke_16"] = Instance.new("UIStroke", LMG2L["TextButton_14"]);



LMG2L["TextButton_17"] = Instance.new("TextButton", LMG2L["Frame2_5"]);
LMG2L["TextButton_17"]["BorderSizePixel"] = 0;
LMG2L["TextButton_17"]["TextSize"] = 12;
LMG2L["TextButton_17"]["AutoButtonColor"] = false;
LMG2L["TextButton_17"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
LMG2L["TextButton_17"]["BackgroundColor3"] = Color3.fromRGB(59, 59, 59);
LMG2L["TextButton_17"]["FontFace"] = cross.font;
LMG2L["TextButton_17"]["Size"] = UDim2.new(0, 90, 0, 30);
LMG2L["TextButton_17"]["Text"] = [[Configs]];
LMG2L["TextButton_17"]["Position"] = UDim2.new(0, 451, 0, 1);


LMG2L["UIGradient_18"] = Instance.new("UIGradient", LMG2L["TextButton_17"]);
LMG2L["UIGradient_18"]["Rotation"] = 90;
LMG2L["UIGradient_18"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(159, 159, 159))};


LMG2L["UIStroke_19"] = Instance.new("UIStroke", LMG2L["TextButton_17"]);



LMG2L["Frame3_1a"] = Instance.new("Frame", LMG2L["Frame_4"]);
LMG2L["Frame3_1a"]["BorderSizePixel"] = 0;
LMG2L["Frame3_1a"]["BackgroundColor3"] = Color3.fromRGB(66, 66, 66);
LMG2L["Frame3_1a"]["Size"] = UDim2.new(0, 542, 0, 585);
LMG2L["Frame3_1a"]["Position"] = UDim2.new(0, 10, 0, 74);
LMG2L["Frame3_1a"]["Name"] = [[Frame3]];


LMG2L["UIStroke_1b"] = Instance.new("UIStroke", LMG2L["Frame3_1a"]);



LMG2L["Frame_1c"] = Instance.new("Frame", LMG2L["Frame3_1a"]);
LMG2L["Frame_1c"]["BorderSizePixel"] = 0;
LMG2L["Frame_1c"]["BackgroundColor3"] = Color3.fromRGB(26, 26, 26);
LMG2L["Frame_1c"]["Size"] = UDim2.new(0, 540, 0, 583);
LMG2L["Frame_1c"]["Position"] = UDim2.new(0, 1, 0, 1);


LMG2L["Frame_1d"] = Instance.new("Frame", LMG2L["Frame_1c"]);
LMG2L["Frame_1d"]["BorderSizePixel"] = 0;
LMG2L["Frame_1d"]["BackgroundColor3"] = Color3.fromRGB(76, 76, 76);
LMG2L["Frame_1d"]["Size"] = UDim2.new(0, 251, 0, 554);
LMG2L["Frame_1d"]["Position"] = UDim2.new(0, 14, 0, 16);


LMG2L["UIStroke_1e"] = Instance.new("UIStroke", LMG2L["Frame_1d"]);



LMG2L["Frame_1f"] = Instance.new("Frame", LMG2L["Frame_1d"]);
LMG2L["Frame_1f"]["BorderSizePixel"] = 0;
LMG2L["Frame_1f"]["BackgroundColor3"] = Color3.fromRGB(33, 33, 33);
LMG2L["Frame_1f"]["Size"] = UDim2.new(0, 249, 0, 552);
LMG2L["Frame_1f"]["Position"] = UDim2.new(0, 1, 0, 1);


LMG2L["Frame_20"] = Instance.new("Frame", LMG2L["Frame_1c"]);
LMG2L["Frame_20"]["BorderSizePixel"] = 0;
LMG2L["Frame_20"]["BackgroundColor3"] = Color3.fromRGB(76, 76, 76);
LMG2L["Frame_20"]["Size"] = UDim2.new(0, 251, 0, 330);
LMG2L["Frame_20"]["Position"] = UDim2.new(0, 276, 0, 16);


LMG2L["UIStroke_21"] = Instance.new("UIStroke", LMG2L["Frame_20"]);



LMG2L["Frame_22"] = Instance.new("Frame", LMG2L["Frame_20"]);
LMG2L["Frame_22"]["BorderSizePixel"] = 0;
LMG2L["Frame_22"]["BackgroundColor3"] = Color3.fromRGB(33, 33, 33);
LMG2L["Frame_22"]["Size"] = UDim2.new(0, 249, 0, 328);
LMG2L["Frame_22"]["Position"] = UDim2.new(0, 1, 0, 1);


LMG2L["Frame_23"] = Instance.new("Frame", LMG2L["Frame_1c"]);
LMG2L["Frame_23"]["BorderSizePixel"] = 0;
LMG2L["Frame_23"]["BackgroundColor3"] = Color3.fromRGB(76, 76, 76);
LMG2L["Frame_23"]["Size"] = UDim2.new(0, 252, 0, 214);
LMG2L["Frame_23"]["Position"] = UDim2.new(0, 276, 0, 356);


LMG2L["UIStroke_24"] = Instance.new("UIStroke", LMG2L["Frame_23"]);



LMG2L["Frame_25"] = Instance.new("Frame", LMG2L["Frame_23"]);
LMG2L["Frame_25"]["BorderSizePixel"] = 0;
LMG2L["Frame_25"]["BackgroundColor3"] = Color3.fromRGB(33, 33, 33);
LMG2L["Frame_25"]["Size"] = UDim2.new(0, 250, 0, 212);
LMG2L["Frame_25"]["Position"] = UDim2.new(0, 1, 0, 1);


LMG2L["TextLabel2_26"] = Instance.new("TextLabel", LMG2L["Frame_1c"]);
LMG2L["TextLabel2_26"]["BorderSizePixel"] = 0;
LMG2L["TextLabel2_26"]["TextSize"] = 12;
LMG2L["TextLabel2_26"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
LMG2L["TextLabel2_26"]["FontFace"] = cross.font;
LMG2L["TextLabel2_26"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
LMG2L["TextLabel2_26"]["BackgroundTransparency"] = 1;
LMG2L["TextLabel2_26"]["Size"] = UDim2.new(0.2, 0, 0.3, 0);
LMG2L["TextLabel2_26"]["Text"] = [[Aimbot]];
LMG2L["TextLabel2_26"]["Name"] = [[TextLabel2]];
LMG2L["TextLabel2_26"]["Position"] = UDim2.new(0, -13, 0, -71);


LMG2L["UIStroke_27"] = Instance.new("UIStroke", LMG2L["TextLabel2_26"]);



LMG2L["TextLabel2_28"] = Instance.new("TextLabel", LMG2L["Frame_1c"]);
LMG2L["TextLabel2_28"]["BorderSizePixel"] = 0;
LMG2L["TextLabel2_28"]["TextSize"] = 12;
LMG2L["TextLabel2_28"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
LMG2L["TextLabel2_28"]["FontFace"] = cross.font;
LMG2L["TextLabel2_28"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
LMG2L["TextLabel2_28"]["BackgroundTransparency"] = 1;
LMG2L["TextLabel2_28"]["Size"] = UDim2.new(0.2, 0, 0.3, 0);
LMG2L["TextLabel2_28"]["Text"] = [[Triggerbot]];
LMG2L["TextLabel2_28"]["Name"] = [[TextLabel2]];
LMG2L["TextLabel2_28"]["Position"] = UDim2.new(0, 257, 0, -71);


LMG2L["UIStroke_29"] = Instance.new("UIStroke", LMG2L["TextLabel2_28"]);



LMG2L["TextLabel2_2a"] = Instance.new("TextLabel", LMG2L["Frame_1c"]);
LMG2L["TextLabel2_2a"]["BorderSizePixel"] = 0;
LMG2L["TextLabel2_2a"]["TextSize"] = 12;
LMG2L["TextLabel2_2a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
LMG2L["TextLabel2_2a"]["FontFace"] = cross.font;
LMG2L["TextLabel2_2a"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
LMG2L["TextLabel2_2a"]["BackgroundTransparency"] = 1;
LMG2L["TextLabel2_2a"]["Size"] = UDim2.new(0.2, 0, 0.3, 0);
LMG2L["TextLabel2_2a"]["Text"] = [[Other]];
LMG2L["TextLabel2_2a"]["Name"] = [[TextLabel2]];
LMG2L["TextLabel2_2a"]["Position"] = UDim2.new(0, 247, 0, 269);


LMG2L["UIStroke_2b"] = Instance.new("UIStroke", LMG2L["TextLabel2_2a"]);



LMG2L["TextLabel2_2c"] = Instance.new("TextLabel", LMG2L["Frame_4"]);
LMG2L["TextLabel2_2c"]["BorderSizePixel"] = 0;
LMG2L["TextLabel2_2c"]["TextSize"] = 12;
LMG2L["TextLabel2_2c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
LMG2L["TextLabel2_2c"]["FontFace"] = cross.font;
LMG2L["TextLabel2_2c"]["TextColor3"] = Color3.fromRGB(83, 127, 255);
LMG2L["TextLabel2_2c"]["BackgroundTransparency"] = 1;
LMG2L["TextLabel2_2c"]["Size"] = UDim2.new(0.2, 0, 0.3, 0);
LMG2L["TextLabel2_2c"]["Text"] = [[.win]];
LMG2L["TextLabel2_2c"]["Name"] = [[TextLabel2]];
LMG2L["TextLabel2_2c"]["Position"] = UDim2.new(0, 19, 0, -86);


LMG2L["UIStroke_2d"] = Instance.new("UIStroke", LMG2L["TextLabel2_2c"]);



LMG2L["TextLabel_2e"] = Instance.new("TextLabel", LMG2L["Frame_4"]);
LMG2L["TextLabel_2e"]["BorderSizePixel"] = 0;
LMG2L["TextLabel_2e"]["TextSize"] = 12;
LMG2L["TextLabel_2e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
LMG2L["TextLabel_2e"]["FontFace"] = cross.font;
LMG2L["TextLabel_2e"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
LMG2L["TextLabel_2e"]["BackgroundTransparency"] = 1;
LMG2L["TextLabel_2e"]["Size"] = UDim2.new(0.2, 0, 0.3, 0);
LMG2L["TextLabel_2e"]["Text"] = [[transsense]];
LMG2L["TextLabel_2e"]["Position"] = UDim2.new(0, -17, 0, -86);


LMG2L["UIStroke_2f"] = Instance.new("UIStroke", LMG2L["TextLabel_2e"]);



LMG2L["TextLabel3_30"] = Instance.new("TextLabel", LMG2L["Frame_4"]);
LMG2L["TextLabel3_30"]["BorderSizePixel"] = 0;
LMG2L["TextLabel3_30"]["TextSize"] = 12;
LMG2L["TextLabel3_30"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
LMG2L["TextLabel3_30"]["FontFace"] = cross.font;
LMG2L["TextLabel3_30"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
LMG2L["TextLabel3_30"]["BackgroundTransparency"] = 1;
LMG2L["TextLabel3_30"]["Size"] = UDim2.new(0.2, 0, 0.3, 0);
LMG2L["TextLabel3_30"]["Text"] = [[| Apr 24 2026]];
LMG2L["TextLabel3_30"]["Name"] = [[TextLabel3]];
LMG2L["TextLabel3_30"]["Position"] = UDim2.new(0, 63, 0, -86);


LMG2L["UIStroke_31"] = Instance.new("UIStroke", LMG2L["TextLabel3_30"]);



LMG2L["Frame_32"] = Instance.new("Frame", LMG2L["Frame_4"]);
LMG2L["Frame_32"]["BorderSizePixel"] = 0;
LMG2L["Frame_32"]["BackgroundColor3"] = Color3.fromRGB(83, 127, 255);
LMG2L["Frame_32"]["Size"] = UDim2.new(0, 542, 0, 2);
LMG2L["Frame_32"]["Position"] = UDim2.new(0, 10, 0, 26);


LMG2L["UIStroke_33"] = Instance.new("UIStroke", LMG2L["Frame_32"]);




return LMG2L["ScreenGui_1"], require;