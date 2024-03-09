wait(0.2)

Player = game:GetService("Players").LocalPlayer
PlayerGui = Player.PlayerGui
Cam = workspace.CurrentCamera
Backpack = Player.Backpack
Character = Player.Character
Humanoid = Character.Humanoid
Mouse = Player:GetMouse()
RootPart = Character["HumanoidRootPart"]
Torso = Character["Torso"]
Head = Character["Head"]
RightArm = Character["Right Arm"]
LeftArm = Character["Left Arm"]
RightLeg = Character["Right Leg"]
LeftLeg = Character["Left Leg"]
RootJoint = RootPart["RootJoint"]
Neck = Torso["Neck"]
RightShoulder = Torso["Right Shoulder"]
LeftShoulder = Torso["Left Shoulder"]
RightHip = Torso["Right Hip"]
LeftHip = Torso["Left Hip"]
local sick = Instance.new("Sound",Torso)
sick.SoundId = "rbxassetid://1383202399"
sick.Looped = true
sick.Pitch = 1
sick.Volume = 1
sick:Play()

IT = Instance.new
CF = CFrame.new
VT = Vector3.new
RAD = math.rad
C3 = Color3.new
UD2 = UDim2.new
BRICKC = BrickColor.new
ANGLES = CFrame.Angles
EULER = CFrame.fromEulerAnglesXYZ
COS = math.cos
ACOS = math.acos
SIN = math.sin
ASIN = math.asin
ABS = math.abs
MRANDOM = math.random
FLOOR = math.floor

--//=================================\\
--|| 	      USEFUL VALUES
--\\=================================//

Animation_Speed = 3
Frame_Speed = 1 / 60 -- (1 / 30) OR (1 / 60)
local Speed = 12
local ROOTC0 = CF(0, 0, 0) * ANGLES(RAD(-90), RAD(0), RAD(180))
local NECKC0 = CF(0, 1, 0) * ANGLES(RAD(-90), RAD(0), RAD(180))
local RIGHTSHOULDERC0 = CF(-0.5, 0, 0) * ANGLES(RAD(0), RAD(90), RAD(0))
local LEFTSHOULDERC0 = CF(0.5, 0, 0) * ANGLES(RAD(0), RAD(-90), RAD(0))
local DAMAGEMULTIPLIER = 1
local ANIM = "Idle"
local ATTACK = false
local EQUIPPED = false
local HOLD = false
local COMBO = 1
local Rooted = false
local SINE = 0
local KEYHOLD = false
local CHANGE = 2 / Animation_Speed
local WALKINGANIM = false
local VALUE1 = false
local VALUE2 = false
local ROBLOXIDLEANIMATION = IT("Animation")
ROBLOXIDLEANIMATION.Name = "Roblox Idle Animation"
ROBLOXIDLEANIMATION.AnimationId = "http://www.roblox.com/asset/?id=180435571"
--ROBLOXIDLEANIMATION.Parent = Humanoid
local WEAPONGUI = IT("ScreenGui", PlayerGui)
WEAPONGUI.Name = "Weapon GUI"
local Effects = IT("Folder", Character)
Effects.Name = "Effects"
local ANIMATOR = Humanoid.Animator
local ANIMATE = Character.Animate
local UNANCHOR = true
local WHITELIST = {}
local TAUNT = false
local OFFSET = 0
local FULL = false

--//=================================\\
--\\=================================//


--//=================================\\
--|| SAZERENOS' ARTIFICIAL HEARTBEAT
--\\=================================//

ArtificialHB = Instance.new("BindableEvent", script)
ArtificialHB.Name = "ArtificialHB"

script:WaitForChild("ArtificialHB")

frame = Frame_Speed
tf = 0
allowframeloss = false
tossremainder = false
lastframe = tick()
script.ArtificialHB:Fire()

game:GetService("RunService").Heartbeat:connect(function(s, p)
	tf = tf + s
	if tf >= frame then
		if allowframeloss then
			script.ArtificialHB:Fire()
			lastframe = tick()
		else
			for i = 1, math.floor(tf / frame) do
				script.ArtificialHB:Fire()
			end
		lastframe = tick()
		end
		if tossremainder then
			tf = 0
		else
			tf = tf - frame * math.floor(tf / frame)
		end
	end
end)

--//=================================\\
--\\=================================//

--//=================================\\
--|| 	      SOME FUNCTIONS
--\\=================================//

function Raycast(POSITION, DIRECTION, RANGE, IGNOREDECENDANTS)
	return workspace:FindPartOnRay(Ray.new(POSITION, DIRECTION.unit * RANGE), IGNOREDECENDANTS)
end

function PositiveAngle(NUMBER)
	if NUMBER >= 0 then
		NUMBER = 0
	end
	return NUMBER
end

function NegativeAngle(NUMBER)
	if NUMBER <= 0 then
		NUMBER = 0
	end
	return NUMBER
end

function Swait(NUMBER)
	if NUMBER == 0 or NUMBER == nil then
		ArtificialHB.Event:wait()
	else
		for i = 1, NUMBER do
			ArtificialHB.Event:wait()
		end
	end
end

function CreateMesh(MESH, PARENT, MESHTYPE, MESHID, TEXTUREID, SCALE, OFFSET)
	local NEWMESH = IT(MESH)
	if MESH == "SpecialMesh" then
		NEWMESH.MeshType = MESHTYPE
		if MESHID ~= "nil" and MESHID ~= "" then
			NEWMESH.MeshId = "http://www.roblox.com/asset/?id="..MESHID
		end
		if TEXTUREID ~= "nil" and TEXTUREID ~= "" then
			NEWMESH.TextureId = "http://www.roblox.com/asset/?id="..TEXTUREID
		end
	end
	NEWMESH.Offset = OFFSET or VT(0, 0, 0)
	NEWMESH.Scale = SCALE
	NEWMESH.Parent = PARENT
	return NEWMESH
end

function CreatePart(FORMFACTOR, PARENT, MATERIAL, REFLECTANCE, TRANSPARENCY, BRICKCOLOR, NAME, SIZE, ANCHOR)
	local NEWPART = IT("Part")
	NEWPART.formFactor = FORMFACTOR
	NEWPART.Reflectance = REFLECTANCE
	NEWPART.Transparency = TRANSPARENCY
	NEWPART.CanCollide = false
	NEWPART.Locked = true
	NEWPART.Anchored = true
	if ANCHOR == false then
		NEWPART.Anchored = false
	end
	NEWPART.BrickColor = BRICKC(tostring(BRICKCOLOR))
	NEWPART.Name = NAME
	NEWPART.Size = SIZE
	NEWPART.Position = Torso.Position
	NEWPART.Material = MATERIAL
	NEWPART:BreakJoints()
	NEWPART.Parent = PARENT
	return NEWPART
end

	local function weldBetween(a, b)
	    local weldd = Instance.new("ManualWeld")
	    weldd.Part0 = a
	    weldd.Part1 = b
	    weldd.C0 = CFrame.new()
	    weldd.C1 = b.CFrame:inverse() * a.CFrame
	    weldd.Parent = a
	    return weldd
	end


function QuaternionFromCFrame(cf)
	local mx, my, mz, m00, m01, m02, m10, m11, m12, m20, m21, m22 = cf:components()
	local trace = m00 + m11 + m22
	if trace > 0 then 
		local s = math.sqrt(1 + trace)
		local recip = 0.5 / s
		return (m21 - m12) * recip, (m02 - m20) * recip, (m10 - m01) * recip, s * 0.5
	else
		local i = 0
		if m11 > m00 then
			i = 1
		end
		if m22 > (i == 0 and m00 or m11) then
			i = 2
		end
		if i == 0 then
			local s = math.sqrt(m00 - m11 - m22 + 1)
			local recip = 0.5 / s
			return 0.5 * s, (m10 + m01) * recip, (m20 + m02) * recip, (m21 - m12) * recip
		elseif i == 1 then
			local s = math.sqrt(m11 - m22 - m00 + 1)
			local recip = 0.5 / s
			return (m01 + m10) * recip, 0.5 * s, (m21 + m12) * recip, (m02 - m20) * recip
		elseif i == 2 then
			local s = math.sqrt(m22 - m00 - m11 + 1)
			local recip = 0.5 / s return (m02 + m20) * recip, (m12 + m21) * recip, 0.5 * s, (m10 - m01) * recip
		end
	end
end
 
function QuaternionToCFrame(px, py, pz, x, y, z, w)
	local xs, ys, zs = x + x, y + y, z + z
	local wx, wy, wz = w * xs, w * ys, w * zs
	local xx = x * xs
	local xy = x * ys
	local xz = x * zs
	local yy = y * ys
	local yz = y * zs
	local zz = z * zs
	return CFrame.new(px, py, pz, 1 - (yy + zz), xy - wz, xz + wy, xy + wz, 1 - (xx + zz), yz - wx, xz - wy, yz + wx, 1 - (xx + yy))
end
 
function QuaternionSlerp(a, b, t)
	local cosTheta = a[1] * b[1] + a[2] * b[2] + a[3] * b[3] + a[4] * b[4]
	local startInterp, finishInterp;
	if cosTheta >= 0.0001 then
		if (1 - cosTheta) > 0.0001 then
			local theta = ACOS(cosTheta)
			local invSinTheta = 1 / SIN(theta)
			startInterp = SIN((1 - t) * theta) * invSinTheta
			finishInterp = SIN(t * theta) * invSinTheta
		else
			startInterp = 1 - t
			finishInterp = t
		end
	else
		if (1 + cosTheta) > 0.0001 then
			local theta = ACOS(-cosTheta)
			local invSinTheta = 1 / SIN(theta)
			startInterp = SIN((t - 1) * theta) * invSinTheta
			finishInterp = SIN(t * theta) * invSinTheta
		else
			startInterp = t - 1
			finishInterp = t
		end
	end
	return a[1] * startInterp + b[1] * finishInterp, a[2] * startInterp + b[2] * finishInterp, a[3] * startInterp + b[3] * finishInterp, a[4] * startInterp + b[4] * finishInterp
end

function Clerp(a, b, t)
	local qa = {QuaternionFromCFrame(a)}
	local qb = {QuaternionFromCFrame(b)}
	local ax, ay, az = a.x, a.y, a.z
	local bx, by, bz = b.x, b.y, b.z
	local _t = 1 - t
	return QuaternionToCFrame(_t * ax + t * bx, _t * ay + t * by, _t * az + t * bz, QuaternionSlerp(qa, qb, t))
end

function CreateFrame(PARENT, TRANSPARENCY, BORDERSIZEPIXEL, POSITION, SIZE, COLOR, BORDERCOLOR, NAME)
	local frame = IT("Frame")
	frame.BackgroundTransparency = TRANSPARENCY
	frame.BorderSizePixel = BORDERSIZEPIXEL
	frame.Position = POSITION
	frame.Size = SIZE
	frame.BackgroundColor3 = COLOR
	frame.BorderColor3 = BORDERCOLOR
	frame.Name = NAME
	frame.Parent = PARENT
	return frame
end

function CreateLabel(PARENT, TEXT, TEXTCOLOR, TEXTFONTSIZE, TEXTFONT, TRANSPARENCY, BORDERSIZEPIXEL, STROKETRANSPARENCY, NAME)
	local label = IT("TextLabel")
	label.BackgroundTransparency = 1
	label.Size = UD2(1, 0, 1, 0)
	label.Position = UD2(0, 0, 0, 0)
	label.TextColor3 = TEXTCOLOR
	label.TextStrokeTransparency = STROKETRANSPARENCY
	label.TextTransparency = TRANSPARENCY
	label.FontSize = TEXTFONTSIZE
	label.Font = TEXTFONT
	label.BorderSizePixel = BORDERSIZEPIXEL
	label.TextScaled = false
	label.Text = TEXT
	label.Name = NAME
	label.Parent = PARENT
	return label
end

function NoOutlines(PART)
	PART.TopSurface, PART.BottomSurface, PART.LeftSurface, PART.RightSurface, PART.FrontSurface, PART.BackSurface = 10, 10, 10, 10, 10, 10
end

function CreateWeldOrSnapOrMotor(TYPE, PARENT, PART0, PART1, C0, C1)
	local NEWWELD = IT(TYPE)
	NEWWELD.Part0 = PART0
	NEWWELD.Part1 = PART1
	NEWWELD.C0 = C0
	NEWWELD.C1 = C1
	NEWWELD.Parent = PARENT
	return NEWWELD
end

local S = IT("Sound")
function CreateSound(ID, PARENT, VOLUME, PITCH, DOESLOOP)
	local NEWSOUND = nil
	coroutine.resume(coroutine.create(function()
		NEWSOUND = S:Clone()
		NEWSOUND.Parent = PARENT
		NEWSOUND.Volume = VOLUME
		NEWSOUND.Pitch = PITCH
		NEWSOUND.SoundId = "http://www.roblox.com/asset/?id="..ID
		NEWSOUND:play()
		if DOESLOOP == true then
			NEWSOUND.Looped = true
		else
			repeat wait(1) until NEWSOUND.Playing == false
			NEWSOUND:remove()
		end
	end))
	return NEWSOUND
end

function CFrameFromTopBack(at, top, back)
	local right = top:Cross(back)
	return CF(at.x, at.y, at.z, right.x, top.x, back.x, right.y, top.y, back.y, right.z, top.z, back.z)
end

--WACKYEFFECT({EffectType = "", Size = VT(1,1,1), Size2 = VT(0,0,0), Transparency = 0, Transparency2 = 1, CFrame = CF(), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(1,1,1), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
function WACKYEFFECT(Table)
	local TYPE = (Table.EffectType or "Sphere")
	local SIZE = (Table.Size or VT(1,1,1))
	local ENDSIZE = (Table.Size2 or VT(0,0,0))
	local TRANSPARENCY = (Table.Transparency or 0)
	local ENDTRANSPARENCY = (Table.Transparency2 or 1)
	local CFRAME = (Table.CFrame or Torso.CFrame)
	local MOVEDIRECTION = (Table.MoveToPos or nil)
	local ROTATION1 = (Table.RotationX or 0)
	local ROTATION2 = (Table.RotationY or 0)
	local ROTATION3 = (Table.RotationZ or 0)
	local MATERIAL = (Table.Material or "Neon")
	local COLOR = (Table.Color or C3(1,1,1))
	local TIME = (Table.Time or 45)
	local SOUNDID = (Table.SoundID or nil)
	local SOUNDPITCH = (Table.SoundPitch or nil)
	local SOUNDVOLUME = (Table.SoundVolume or nil)
	coroutine.resume(coroutine.create(function()
		local PLAYSSOUND = false
		local SOUND = nil
		local EFFECT = CreatePart(3, Effects, MATERIAL, 0, TRANSPARENCY, BRICKC("Pearl"), "Effect", VT(1,1,1), true)
		if SOUNDID ~= nil and SOUNDPITCH ~= nil and SOUNDVOLUME ~= nil then
			PLAYSSOUND = true
			SOUND = CreateSound(SOUNDID, EFFECT, SOUNDVOLUME, SOUNDPITCH, false)
		end
		EFFECT.Color = COLOR
		local MSH = nil
		if TYPE == "Sphere" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "Sphere", "", "", SIZE, VT(0,0,0))
		elseif TYPE == "Block" then
			MSH = IT("BlockMesh",EFFECT)
			MSH.Scale = VT(SIZE.X,SIZE.X,SIZE.X)
		elseif TYPE == "Wave" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "20329976", "", SIZE, VT(0,0,-SIZE.X/8))
		elseif TYPE == "Ring" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "559831844", "", VT(SIZE.X,SIZE.X,0.1), VT(0,0,0))
		elseif TYPE == "Slash" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "662586858", "", VT(SIZE.X/10,0,SIZE.X/10), VT(0,0,0))
		elseif TYPE == "Round Slash" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "662585058", "", VT(SIZE.X/10,0,SIZE.X/10), VT(0,0,0))
		elseif TYPE == "Swirl" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "1051557", "", SIZE, VT(0,0,0))
		elseif TYPE == "Skull" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "4770583", "", SIZE, VT(0,0,0))
		elseif TYPE == "Crystal" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "9756362", "", SIZE, VT(0,0,0))
		end
		if MSH ~= nil then
			local MOVESPEED = nil
			if MOVEDIRECTION ~= nil then
				MOVESPEED = (CFRAME.p - MOVEDIRECTION).Magnitude/TIME
			end
			local GROWTH = SIZE - ENDSIZE
			local TRANS = TRANSPARENCY - ENDTRANSPARENCY
			if TYPE == "Block" then
				EFFECT.CFrame = CFRAME*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)))
			else
				EFFECT.CFrame = CFRAME
			end
			for LOOP = 1, TIME+1 do
				Swait()
				MSH.Scale = MSH.Scale - GROWTH/TIME
				if TYPE == "Wave" then
					MSH.Offset = VT(0,0,-MSH.Scale.X/8)
				end
				EFFECT.Transparency = EFFECT.Transparency - TRANS/TIME
				if TYPE == "Block" then
					EFFECT.CFrame = CFRAME*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)))
				else
					EFFECT.CFrame = EFFECT.CFrame*ANGLES(RAD(ROTATION1),RAD(ROTATION2),RAD(ROTATION3))
				end
				if MOVEDIRECTION ~= nil then
					local ORI = EFFECT.Orientation
					EFFECT.CFrame = CF(EFFECT.Position,MOVEDIRECTION)*CF(0,0,-MOVESPEED)
					EFFECT.Orientation = ORI
				end
			end
			if PLAYSSOUND == false then
				EFFECT:remove()
			else
				SOUND.Stopped:Connect(function()
					EFFECT:remove()
				end)
			end
		else
			if PLAYSSOUND == false then
				EFFECT:remove()
			else
				repeat Swait() until SOUND.Playing == false
				EFFECT:remove()
			end
		end
	end))
end

function MakeForm(PART,TYPE)
	if TYPE == "Cyl" then
		local MSH = IT("CylinderMesh",PART)
	elseif TYPE == "Ball" then
		local MSH = IT("SpecialMesh",PART)
		MSH.MeshType = "Sphere"
	elseif TYPE == "Wedge" then
		local MSH = IT("SpecialMesh",PART)
		MSH.MeshType = "Wedge"
	end
end

Debris = game:GetService("Debris")

function CastProperRay(StartPos, EndPos, Distance, Ignore)
	local DIRECTION = CF(StartPos,EndPos).lookVector
	return Raycast(StartPos, DIRECTION, Distance, Ignore)
end

local EyeSizes={
	NumberSequenceKeypoint.new(0,1,0),
	NumberSequenceKeypoint.new(1,0,0)
}
local EyeTrans={
	NumberSequenceKeypoint.new(0,0.8,0),
	NumberSequenceKeypoint.new(1,1,0)
}
local PE=Instance.new("ParticleEmitter",nil)
PE.LightEmission=.8
PE.Color = ColorSequence.new(BRICKC("Really red").Color)
PE.Size=NumberSequence.new(EyeSizes)
PE.Transparency=NumberSequence.new(EyeTrans)
PE.Lifetime=NumberRange.new(0.35,1.5)
PE.Rotation=NumberRange.new(0,360)
PE.Rate=999
PE.VelocitySpread = 10000
PE.Acceleration = Vector3.new(0,0,0)
PE.Drag = 5
PE.Speed = NumberRange.new(0,0,0)
PE.Texture="http://www.roblox.com/asset/?id=1351966707"
PE.ZOffset = -0
PE.Name = "PE"
PE.Enabled = false

function particles(art)
	local PARTICLES = PE:Clone()
	PARTICLES.Parent = art
end

function CreateDebreeRing(FLOOR,POSITION,SIZE,BLOCKSIZE,SWAIT)
	if FLOOR ~= nil then
		coroutine.resume(coroutine.create(function()
			local PART = CreatePart(3, Effects, "Plastic", 0, 1, "Pearl", "DebreeCenter", VT(0,0,0))
			PART.CFrame = CF(POSITION)
			for i = 1, 45 do
				local RingPiece = CreatePart(3, Effects, "Plastic", 0, 0, "Pearl", "DebreePart", BLOCKSIZE)
				RingPiece.Material = FLOOR.Material
				RingPiece.Color = FLOOR.Color
				RingPiece.CFrame = PART.CFrame * ANGLES(RAD(0), RAD(i*8), RAD(0)) * CF(SIZE, 0, 0) * ANGLES(RAD(MRANDOM(-360,360)),RAD(MRANDOM(-360,360)),RAD(MRANDOM(-360,360)))
				Debris:AddItem(RingPiece,SWAIT)
			end
			PART:remove()
		end))
	end
end

function CreateFlyingDebree(FLOOR,POSITION,AMOUNT,BLOCKSIZE,SWAIT,STRENGTH)
	if FLOOR ~= nil then
		for i = 1, AMOUNT do
			local DEBREE = CreatePart(3, Effects, "Neon", FLOOR.Reflectance, FLOOR.Transparency, "Peal", "Debree", BLOCKSIZE, false)
			DEBREE.Material = FLOOR.Material
			DEBREE.Color = FLOOR.Color
			DEBREE.CFrame = POSITION * ANGLES(RAD(MRANDOM(-360,360)),RAD(MRANDOM(-360,360)),RAD(MRANDOM(-360,360)))
			DEBREE.Velocity = VT(MRANDOM(-STRENGTH,STRENGTH),MRANDOM(-STRENGTH,STRENGTH),MRANDOM(-STRENGTH,STRENGTH))
			coroutine.resume(coroutine.create(function()
				Swait(15)
				DEBREE.Parent = workspace
				DEBREE.CanCollide = true
				Debris:AddItem(DEBREE,SWAIT)
			end))
		end
	end
end

--//=================================\\
--||	     WEAPON CREATION
--\\=================================//

local PRT = CreatePart(3, Character, "Fabric", 0, 0, "Really black", "Hood", VT(1,1,1),false)
PRT.Color = C3(0,0,0)
local HoodWeld = CreateWeldOrSnapOrMotor("Weld", Head, Head, PRT, CF(0,0.2,0), CF(0, 0, 0))
CreateMesh("SpecialMesh", PRT, "FileMesh", "76062497", "", VT(1,1,1)*1.05, VT(0,0,0))
local PRT = CreatePart(3, Character, "Fabric", 0, 0, "Really black", "Scarf", VT(1,1,1),false)
PRT.Color = C3(0,0,0)
CreateWeldOrSnapOrMotor("Weld", Torso, Torso, PRT, CF(0.05,0.4,-0.1) * ANGLES(RAD(-3), RAD(0), RAD(0)), CF(0, 0, 0))
CreateMesh("SpecialMesh", PRT, "FileMesh", "99856331", "", VT(1.1,1,1.1), VT(0,0,0))
for i = 1, 16 do
	local FACE = CreatePart(3, Character, "Fabric", 0, 0+(i-1)/16.2, "Dark stone grey", "FaceGradient", VT(1.01,0.65,1.01),false)
	FACE.Color = C3(0,0,0)
	Head:FindFirstChildOfClass("SpecialMesh"):Clone().Parent = FACE
	CreateWeldOrSnapOrMotor("Weld", Head, Head, FACE, CF(0,0.45-(i-1)/25,0), CF(0, 0, 0))
end
local EYE = CreatePart(3, Character, "Neon", 0, 0, "Really red", "Eyeball", VT(0.15,0.15,0.15),false)
MakeForm(EYE,"Ball")
CreateWeldOrSnapOrMotor("Weld", Head, Head, EYE, CF(0.15,0.26,-0.55), CF(0, 0, 0))
local EYE2 = CreatePart(3, Character, "Neon", 0, 0, "Really red", "Eyeball", VT(0.15,0.15,0.15),false)
MakeForm(EYE2,"Ball")
CreateWeldOrSnapOrMotor("Weld", Head, Head, EYE2, CF(-0.15,0.26,-0.55), CF(0, 0, 0))
local LASTPART = Head
for i = 1, 20 do
	local MATH = (1-(i/25))
	if LASTPART == Head then
		local Horn = CreatePart(3, Character, "SmoothPlastic", 0, 0, "Dirt brown", "Horn", VT(0.25*MATH,0.25,0.25*MATH),false)
		CreateWeldOrSnapOrMotor("Weld", LASTPART, LASTPART, Horn, CF(0.3, 0.7, -0.35) * ANGLES(RAD(-55), RAD(15), RAD(-15)), CF(0, 0, 0))
		LASTPART = Horn
		Horn.Color = C3((i*3-3)/255,0,0)
	else
		local Horn = CreatePart(3, Character, "SmoothPlastic", 0, 0, "Dirt brown", "Horn", VT(0.25*MATH,0.25,0.25*MATH),false)
		CreateWeldOrSnapOrMotor("Weld", LASTPART, LASTPART, Horn, CF(0, Horn.Size.Y/1.8, 0) * ANGLES(RAD(6), RAD(-0.3), RAD(0)), CF(0, 0, 0))
		LASTPART = Horn
		Horn.Color = C3((i*3-3)/255,0,0)
	end
end
local LASTPART = Head
for i = 1, 20 do
	local MATH = (1-(i/25))
	if LASTPART == Head then
		local Horn = CreatePart(3, Character, "SmoothPlastic", 0, 0, "Dirt brown", "Horn", VT(0.25*MATH,0.25,0.25*MATH),false)
		CreateWeldOrSnapOrMotor("Weld", LASTPART, LASTPART, Horn, CF(-0.3, 0.7, -0.35) * ANGLES(RAD(-55), RAD(-15), RAD(15)), CF(0, 0, 0))
		LASTPART = Horn
		Horn.Color = C3((i*3-3)/255,0,0)
	else
		local Horn = CreatePart(3, Character, "SmoothPlastic", 0, 0, "Dirt brown", "Horn", VT(0.25*MATH,0.25,0.25*MATH),false)
		CreateWeldOrSnapOrMotor("Weld", LASTPART, LASTPART, Horn, CF(0, Horn.Size.Y/1.8, 0) * ANGLES(RAD(6), RAD(0.3), RAD(0)), CF(0, 0, 0))
		LASTPART = Horn
		Horn.Color = C3((i*3-3)/255,0,0)
	end
end
local Hair = CreatePart(3, Character, "Fabric", 0, 0, "Gold", "Hair", VT(1,1,1),false)
local HairWeld1 = CreateWeldOrSnapOrMotor("Weld", Hair, Head, Hair, CF(0,0.1,-0.25) * ANGLES(RAD(0), RAD(0), RAD(0)), CF(0, 0, 0))
CreateMesh("SpecialMesh", Hair, "FileMesh", "873651376", "", VT(0.025, 0.025, 0.02), VT(0,0,0))
local Hair = CreatePart(3, Character, "Fabric", 0, 0, "Gold", "Hair", VT(1,1,1),false)
local HairWeld2 = CreateWeldOrSnapOrMotor("Weld", Hair, Head, Hair, CF(0,0.2,-0.3) * ANGLES(RAD(0), RAD(0), RAD(0)), CF(0, 0, 0))
CreateMesh("SpecialMesh", Hair, "FileMesh", "873651376", "", VT(0.03, 0.015, 0.01), VT(0,0,-0.1))

local BODY = {}

for _, c in pairs(Character:GetDescendants()) do
	if c:IsA("BasePart") and c.Name ~= "Handle" then
		if c ~= RootPart and c ~= Torso and c ~= Head and c ~= RightArm and c ~= LeftArm and c ~= RightLeg and c ~= LeftLeg then
			c.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
		end
		table.insert(BODY,{c,c.Parent,c.Material,c.Color,c.Transparency})
	elseif c:IsA("JointInstance") then
		table.insert(BODY,{c,c.Parent,nil,nil,nil})
	end
end

for e = 1, #BODY do
	if BODY[e] ~= nil then
		local STUFF = BODY[e]
		local PART = STUFF[1]
		local PARENT = STUFF[2]
		local MATERIAL = STUFF[3]
		local COLOR = STUFF[4]
		local TRANSPARENCY = STUFF[5]
		if PART.ClassName == "Part" and PART ~= RootPart then
			PART.Material = MATERIAL
			PART.Color = COLOR
			PART.Transparency = TRANSPARENCY
		end
		PART.AncestryChanged:Connect(function()
			PART.Parent = PARENT
		end)
	end
end

function refit()
	Character.Parent = workspace
	for e = 1, #BODY do
		if BODY[e] ~= nil then
			local STUFF = BODY[e]
			local PART = STUFF[1]
			local PARENT = STUFF[2]
			local MATERIAL = STUFF[3]
			local COLOR = STUFF[4]
			local TRANSPARENCY = STUFF[5]
			if PART.ClassName == "Part" and PART ~= RootPart then
				PART.Material = MATERIAL
				PART.Color = COLOR
				PART.Transparency = TRANSPARENCY
			end
			if PART.Parent ~= PARENT then
				Humanoid:remove()
				PART.Parent = PARENT
				Humanoid = IT("Humanoid",Character)
			end
		end
	end
end

local SKILLTEXTCOLOR = C3(0,0,0)
local SKILLFONT = "Antique"
local SKILLTEXTSIZE = 7

Humanoid.Died:connect(function()
	refit()
end)

local SKILL1FRAME = CreateFrame(WEAPONGUI, 1, 2, UD2(0.23, 0, 0.80, 0), UD2(0.26, 0, 0.07, 0), C3(0,0,0), C3(0, 0, 0), "Skill 1 Frame")
local SKILL2FRAME = CreateFrame(WEAPONGUI, 1, 2, UD2(0.50, 0, 0.80, 0), UD2(0.26, 0, 0.07, 0), C3(0,0,0), C3(0, 0, 0), "Skill 2 Frame")
local SKILL3FRAME = CreateFrame(WEAPONGUI, 1, 2, UD2(0.365, 0, 0.90, 0), UD2(0.26, 0, 0.07, 0), C3(0,0,0), C3(0, 0, 0), "Skill 3 Frame")
local SKILL4FRAME = CreateFrame(WEAPONGUI, 1, 2, UD2(0.365, 0, 0.70, 0), UD2(0.26, 0, 0.07, 0), C3(0,0,0), C3(0, 0, 0), "Skill 4 Frame")
local SKILL5FRAME = CreateFrame(WEAPONGUI, 1, 2, UD2(0.365, 0, 0.80, 0), UD2(0.26, 0, 0.07, 0), C3(0,0,0), C3(0, 0, 0), "Skill 5 Frame")
local SKILL6FRAME = CreateFrame(WEAPONGUI, 1, 2, UD2(0.365, 0, 0.05, 0), UD2(0.26, 0, 0.07, 0), C3(0,0,0), C3(0, 0, 0), "Skill 6 Frame")

local SKILL1TEXT = CreateLabel(SKILL1FRAME, "[Z] Whitelist", SKILLTEXTCOLOR, SKILLTEXTSIZE, SKILLFONT, 0, 2, 1, "Text 1")
local SKILL2TEXT = CreateLabel(SKILL2FRAME, "[B] Clear whitelist", SKILLTEXTCOLOR, SKILLTEXTSIZE, SKILLFONT, 0, 2, 1, "Text 2")
local SKILL3TEXT = CreateLabel(SKILL3FRAME, "[C] Smite", SKILLTEXTCOLOR, 8, SKILLFONT, 0, 2, 1, "Text 3")
local SKILL4TEXT = CreateLabel(SKILL4FRAME, "[X] Meteor Shower", SKILLTEXTCOLOR, 10, SKILLFONT, 0, 2, 1, "Text 4")
local SKILL5TEXT = CreateLabel(SKILL5FRAME, "[Q] Teleport", SKILLTEXTCOLOR, 10, SKILLFONT, 0, 2, 1, "Text 5")
local SKILL6TEXT = CreateLabel(SKILL6FRAME, "[P] Equivalent Pain", SKILLTEXTCOLOR, 12, SKILLFONT, 0, 2, 1, "Text 6")

function Blink()
	coroutine.resume(coroutine.create(function()
		if EYE ~= nil then
			for i = 1, 5 do
				Swait()
				EYE.Mesh.Scale = EYE.Mesh.Scale - VT(0,0.2,0)
				EYE2.Mesh.Scale = EYE.Mesh.Scale
			end
			for i = 1, 7 do
				Swait()
				EYE.Mesh.Scale = EYE.Mesh.Scale + VT(0,0.2,0)
				EYE2.Mesh.Scale = EYE.Mesh.Scale
			end
			EYE.Mesh.Scale = VT(1,1,1)
			EYE2.Mesh.Scale = EYE.Mesh.Scale
		end
	end))
end

--//=================================\\
--||	     DAMAGE FUNCTIONS
--\\=================================//

function StatLabel(CFRAME, TEXT, COLOR)
	local STATPART = CreatePart(3, Effects, "SmoothPlastic", 0, 1, "Really black", "Effect", VT())
	STATPART.CFrame = CF(CFRAME.p,CFRAME.p+VT(MRANDOM(-5,5),MRANDOM(0,5),MRANDOM(-5,5)))
	local BODYGYRO = IT("BodyGyro", STATPART)
	game:GetService("Debris"):AddItem(STATPART ,5)
	local BILLBOARDGUI = Instance.new("BillboardGui", STATPART)
	BILLBOARDGUI.Adornee = STATPART
	BILLBOARDGUI.Size = UD2(2.5, 0, 2.5 ,0)
	BILLBOARDGUI.StudsOffset = VT(-2, 2, 0)
	BILLBOARDGUI.AlwaysOnTop = false
	local TEXTLABEL = Instance.new("TextLabel", BILLBOARDGUI)
	TEXTLABEL.BackgroundTransparency = 1
	TEXTLABEL.Size = UD2(2.5, 0, 2.5, 0)
	TEXTLABEL.Text = TEXT
	TEXTLABEL.Font = SKILLFONT
	TEXTLABEL.FontSize="Size42"
	TEXTLABEL.TextColor3 = COLOR
	TEXTLABEL.TextStrokeTransparency = 0
	TEXTLABEL.TextScaled = true
	TEXTLABEL.TextWrapped = true
	coroutine.resume(coroutine.create(function(THEPART, THEBODYPOSITION, THETEXTLABEL)
		for i = 1, 50 do
			Swait()
			STATPART.CFrame = STATPART.CFrame * CF(0,0,-0.2)
			TEXTLABEL.TextTransparency = TEXTLABEL.TextTransparency + (1/50)
			TEXTLABEL.TextStrokeTransparency = TEXTLABEL.TextTransparency
		end
		THEPART.Parent = nil
	end),STATPART, TEXTLABEL)
end

--//=================================\\
--||			DAMAGING
--\\=================================//

function KillChildren(v)
	v:BreakJoints()
	for _, c in pairs(v:GetChildren()) do
		if c:IsA("BasePart") then
			if c.Transparency < 1 then
				if c:FindFirstChildOfClass("Decal") then
					c:FindFirstChildOfClass("Decal"):remove()
				end
				particles(c)
				c.PE.Enabled = true
				c.Parent = Effects
				c.CanCollide = false
				c.Material = "Neon"
				c.Color = C3(1,0,0)
				c.Transparency = 1
				local grav = Instance.new("BodyPosition",c)
				grav.P = 20000
				grav.maxForce = Vector3.new(math.huge,math.huge,math.huge)
				grav.position = c.Position + VT(MRANDOM(-5,5),MRANDOM(-5,5),MRANDOM(-5,5))
				grav.Name = "GravityForce"
				coroutine.resume(coroutine.create(function()
					for i = 1, 20 do
						Swait()
						c.Transparency = c.Transparency + 1/20
					end
					c.PE.Enabled = false
					Debris:AddItem(c,2)
				end))
			end
		end
	end
end

function ApplyAoE(POSITION,RANGE)
	local CHILDREN = workspace:GetDescendants()
	for index, CHILD in pairs(CHILDREN) do
		if CHILD.ClassName == "Model" and CHILD ~= Character then
			local LISTED = false
			for LIST = 1, #WHITELIST do
				if WHITELIST[LIST] ~= nil then
					if CHILD.Name == WHITELIST[LIST] then
						LISTED = true
					end
				end
			end
			if LISTED == false then
				local HUM = CHILD:FindFirstChildOfClass("Humanoid")
				if HUM then
					local TORSO = CHILD:FindFirstChild("Torso") or CHILD:FindFirstChild("UpperTorso")
					if TORSO then
						if (TORSO.Position - POSITION).Magnitude <= RANGE+TORSO.Size.Magnitude then
							KillChildren(CHILD)
						end
					end
				end
			end
		end
	end
end

--//=================================\\
--||	ATTACK FUNCTIONS AND STUFF
--\\=================================//

function Click()
	ATTACK = true
	Rooted = false
	local HIT = nil
	OFFSET = -45
	for i=0, 1, 0.1 / Animation_Speed do
		Swait()
		Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(5 - 2.5), RAD(0), RAD(45)), 0.15 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0.5) * ANGLES(RAD(90), RAD(0), RAD(12)) * RIGHTSHOULDERC0, 2 / Animation_Speed)
	end
	OFFSET = 45
	local PUNCH = CreatePart(3, Effects, "Granite", 0, 1, "Really black", "Hit", VT(0.7,0.7,0.7),false)
	PUNCH.CanCollide = true
	CreateWeldOrSnapOrMotor("Weld", RightArm, RightArm, PUNCH, CF(0,-1,0), CF(0, 0, 0))
	TAUNT = true
	local TOUCH = PUNCH.Touched:Connect(function(hit)
		if hit.Parent:FindFirstChildOfClass("Humanoid") then
			HIT = hit.Parent
		end
	end)
	for i=0, 0.3, 0.1 / Animation_Speed do
		Swait()
		RootPart.CFrame = RootPart.CFrame*CF(0,0,-0.3)
		if HIT ~= nil then
			break
		end
		Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(5 - 2.5), RAD(0), RAD(-45)), 0.15 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.45, 0.5, -0.75) * ANGLES(RAD(90), RAD(0), RAD(35)) * RIGHTSHOULDERC0, 2 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(0), RAD(45), RAD(-12)) * ANGLES(RAD(-35), RAD(0), RAD(0)) * LEFTSHOULDERC0, 2 / Animation_Speed)
	end
	PUNCH:remove()
	TOUCH:disconnect()
	if HIT ~= nil then
		for _, c in pairs(HIT:GetChildren()) do
			if c:IsA("BasePart") then
				c.Anchored = true
			end
		end
		Rooted = true
		CreateSound(649634100, Torso, 10, 0.8)
		CreateSound(1368573150, RightArm, 3, 1.5)
		for i=0, 0.6, 0.1 / Animation_Speed do
			Swait()
			WACKYEFFECT({EffectType = "Block", Size = VT(3,3,3)/3, Size2 = VT(1,1,1)/3, Transparency = 0.5, Transparency2 = 1, CFrame = RightArm.CFrame*CF(0,-1.3,0), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(1,0,0), SoundID = nil, SoundPitch = 1, SoundVolume = 5})
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(5 - 2.5), RAD(25), RAD(-45)), 0.05 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.45, 0.5, -0.75) * ANGLES(RAD(90), RAD(0), RAD(35)) * RIGHTSHOULDERC0, 2 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(0), RAD(45), RAD(-12)) * ANGLES(RAD(-35), RAD(0), RAD(0)) * LEFTSHOULDERC0, 2 / Animation_Speed)
		end
		for _, c in pairs(HIT:GetChildren()) do
			if c:IsA("BasePart") then
				c.Anchored = false
			end
		end
		KillChildren(HIT)
	end
	OFFSET = 0
	ATTACK = false
	Rooted = false
	TAUNT = false
end

function Whitelist()
	if Mouse.Target ~= nil then
		if Mouse.Target.Parent ~= Character and Mouse.Target.Parent.Parent ~= Character and Mouse.Target.Parent:FindFirstChildOfClass("Humanoid") ~= nil then
			if game.Players:FindFirstChild(Mouse.Target.Parent.Name) then
				table.insert(WHITELIST,Mouse.Target.Parent.Name)
			end
		end
	end
end

function Clear_Whitelist()
	if Mouse.Target ~= nil then
		if Mouse.Target.Parent ~= Character and Mouse.Target.Parent.Parent ~= Character and Mouse.Target.Parent:FindFirstChildOfClass("Humanoid") ~= nil then
			for LIST = 1, #WHITELIST do
				if WHITELIST[LIST] ~= nil then
					if Mouse.Target.Parent.Name == WHITELIST[LIST] then
						table.remove(WHITELIST,LIST)
						for _, c in pairs(Cam:GetChildren()) do
							if c.Name == Mouse.Target.Parent.Name then
								c:remove()
							end
						end
					end
				end
			end
		end
	end
end

function SpawnSmite(POS)
	local HITFLOOR,HITPOS = Raycast(POS+VT(0,1,0), (CF(POS, POS + VT(0, -1, 0))).lookVector, 100, Character)
	local EMITPOS = HITPOS
	if HITFLOOR ~= nil then
		if HITFLOOR.Parent:FindFirstChildOfClass("Humanoid") then
			HITFLOOR,HITPOS = Raycast(POS+VT(0,1,0), (CF(POS, POS + VT(0, -1, 0))).lookVector, 100, HITFLOOR.Parent)
			EMITPOS = HITPOS
		elseif HITFLOOR.Parent.Parent:FindFirstChildOfClass("Humanoid") then
			HITFLOOR,HITPOS = Raycast(POS+VT(0,1,0), (CF(POS, POS + VT(0, -1, 0))).lookVector, 100, HITFLOOR.Parent.Parent)
			EMITPOS = HITPOS
		end
	end
	if HITFLOOR ~= nil then
		ApplyAoE(EMITPOS,10)
		WACKYEFFECT({EffectType = "Sphere", Size = VT(0,100000,0), Size2 = VT(10,100000,10), Transparency = 0, Transparency2 = 1, CFrame = CF(EMITPOS) * ANGLES(RAD(MRANDOM(-15,15)), RAD(0), RAD(MRANDOM(-15,15))), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(1,0,0), SoundID = 419011114, SoundPitch = 1, SoundVolume = 5})
		WACKYEFFECT({EffectType = "Block", Size = VT(0,0,0), Size2 = VT(10,10,10)*2, Transparency = 0, Transparency2 = 1, CFrame = CF(EMITPOS), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(1,0,0), SoundID = nil, SoundPitch = 1, SoundVolume = 5})
		WACKYEFFECT({EffectType = "Block", Size = VT(0,0,0), Size2 = VT(10,10,10)*1.5, Transparency = 0, Transparency2 = 1, CFrame = CF(EMITPOS), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(1,0,0), SoundID = nil, SoundPitch = 1, SoundVolume = 5})
		for i = 1, 5 do
			local TOPOS = CF(EMITPOS)*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)))*CF(0,0,12)
			WACKYEFFECT({EffectType = "Slash", Size = VT(0,0,0), Size2 = VT(0.2,0,0.2), Transparency = 0, Transparency2 = 1, CFrame = CF(EMITPOS,TOPOS.p) * ANGLES(RAD(90), RAD(0), RAD(0)), MoveToPos = TOPOS.p, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(1,0,0), SoundID = 419011114, SoundPitch = 1, SoundVolume = 5})
		end
	end
end

function SpawnMeteor(POS,SIZE,ISDEBREE,ORIPOS)
	coroutine.resume(coroutine.create(function()
		local METEOR = IT("Model",Effects)
		METEOR.Name = "Meteorite"
		local CENTER = CreatePart(3, METEOR, "Granite", 0, 0, "Really black", "MeteorCenter", VT(5,5,5)*SIZE)
		METEOR.PrimaryPart = CENTER
		local PRT = CreatePart(3, METEOR, "Granite", 0, 0, "Really black", "MeteorCenter", VT(5,5,5)*SIZE)
		PRT.CFrame = CENTER.CFrame*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)))
		for i = 1, 15 do
			local FIRE = CreatePart(3, METEOR, "Neon", 0, 0, "Really red", "Fire", VT(5.1,1,5.1)*SIZE)
			FIRE.CFrame = CENTER.CFrame*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)))
		end
		if ISDEBREE ~= true then
			METEOR:SetPrimaryPartCFrame(CF(POS) * ANGLES(RAD(MRANDOM(-15,15)), RAD(0), RAD(MRANDOM(-15,15)))*CF(0,500,0) * ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360))))
		else
			METEOR:SetPrimaryPartCFrame(CF(ORIPOS,POS) * ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360))))
		end
		local IMPACT = false
		CreateSound(463593339, CENTER, 10, 0.6)
		if SIZE >= 3.5 then
			for i = 1, MRANDOM(3,7) do
				SpawnMeteor(CF(POS) * ANGLES(RAD(0), RAD(MRANDOM(0,360)), RAD(0))*CF(0,0,SIZE*12).p,SIZE/MRANDOM(4,5),true,CENTER.CFrame*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)))*CF(0,0,SIZE*15).p)
			end
		end
		for i = 1, 200 do
			Swait()
			local HITFLOOR,HITPOS = Raycast(CENTER.Position, CF(CENTER.Position,POS).lookVector, 3, Character)
			if HITFLOOR == nil then
				local ORI = CENTER.Orientation
				METEOR:SetPrimaryPartCFrame(CF(HITPOS) * ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360))))
			else
				if HITFLOOR.Anchored == true then
					CreateDebreeRing(HITFLOOR,HITPOS,30*SIZE,VT(6,6,6)*SIZE,5)
					CreateFlyingDebree(HITFLOOR,CF(HITPOS),8,VT(4,4,4)*SIZE,5,175)
				end
				IMPACT = true
				break
			end
		end
		if IMPACT == true then
			WACKYEFFECT({EffectType = "Block", Size = CENTER.Size, Size2 = VT(10,10,10)*4*SIZE, Transparency = 0, Transparency2 = 1, CFrame = CF(CENTER.Position), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(1,0,0), SoundID = 130972023, SoundPitch = 1, SoundVolume = 5})
			WACKYEFFECT({EffectType = "Block", Size = CENTER.Size, Size2 = VT(10,10,10)*3*SIZE, Transparency = 0, Transparency2 = 1, CFrame = CF(CENTER.Position), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(1,0,0), SoundID = 201858144, SoundPitch = 1, SoundVolume = 5})
			WACKYEFFECT({EffectType = "Sphere", Size = VT(SIZE*20,0,SIZE*20), Size2 = VT(0,SIZE*750,0), Transparency = 0, Transparency2 = 1, CFrame = CF(CENTER.Position), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(1,0,0), SoundID = 130972023, SoundPitch = 1, SoundVolume = 5})
			ApplyAoE(CENTER.Position,30*SIZE)
		end
		METEOR:remove()
	end))
end

function Smite()
	ATTACK = true
	Rooted = false
	CreateSound(1368573150, RightArm, 3, 1.5)
	for i=0, 0.6, 0.1 / Animation_Speed do
		Swait()
		WACKYEFFECT({TIME = 15, EffectType = "Block", Size = VT(3,3,3)/3, Size2 = VT(1,1,1)/3, Transparency = 0.5, Transparency2 = 1, CFrame = RightArm.CFrame*CF(0,-1.3,0), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(1,0,0), SoundID = nil, SoundPitch = 1, SoundVolume = 5})
		Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(-15 - 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)), 1 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.6, 0.75, -0.5) * ANGLES(RAD(0), RAD(-45), RAD(12)) * ANGLES(RAD(125 - 2.5 * COS(SINE / 12) + 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)) * RIGHTSHOULDERC0, 2.5 / Animation_Speed)
	end
	local POWER = 0
	repeat 
		Swait() 
		WACKYEFFECT({EffectType = "Block", Size = VT(3,3,3)/3, Size2 = VT(1,1,1)/3, Transparency = 0.5, Transparency2 = 1, CFrame = RightArm.CFrame*CF(0,-1.3,0), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(1,0,0), SoundID = nil, SoundPitch = 1, SoundVolume = 5})
		Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(-15 - 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)), 1 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.6, 0.75, -0.5) * ANGLES(RAD(0), RAD(-45), RAD(12)) * ANGLES(RAD(125 - 2.5 * COS(SINE / 12) + 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)) * RIGHTSHOULDERC0, 2.5 / Animation_Speed)
		POWER = POWER + 0.5 
		if POWER >= 85 then
			POWER = 85
		end
	until KEYHOLD == false
	if POWER < 0.6 then
		SpawnSmite(Mouse.Hit.p)
	else
		if POWER < 15 then
			POWER = 15
		end
		SpawnMeteor(Mouse.Hit.p,POWER/15)
	end
	ATTACK = false
	Rooted = false
end

function Meteor_Shower()
	ATTACK = true
	Rooted = false
	CreateSound(1368573150, RightArm, 3, 0.8)
	CreateSound(649634100, Torso, 10, 0.8)
	for i=0, 1.2, 0.1 / Animation_Speed do
		Swait()
		WACKYEFFECT({TIME = 15, EffectType = "Block", Size = VT(3,3,3)/2, Size2 = VT(1,1,1)/3, Transparency = 0.5, Transparency2 = 1, CFrame = RightArm.CFrame*CF(0,-1.3,0), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(1,0,0), SoundID = nil, SoundPitch = 1, SoundVolume = 5})
		Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(-15 - 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)), 1 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.6, 0.75, -0.5) * ANGLES(RAD(0), RAD(-45), RAD(12)) * ANGLES(RAD(125 - 2.5 * COS(SINE / 12) + 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)) * RIGHTSHOULDERC0, 2.5 / Animation_Speed)
	end
	local POS = Mouse.Hit.p
	CreateSound(463593339, Effects, 3, 1)
	coroutine.resume(coroutine.create(function()
		for i = 1, 35 do
			wait(MRANDOM(5,150)/100)
			SpawnMeteor(CF(POS) * ANGLES(RAD(0),RAD(MRANDOM(0,360)),RAD(0))*CF(0,0,MRANDOM(0,1500)/10).p,MRANDOM(10,25)/10)
		end
	end))
	ATTACK = false
	Rooted = false
end

function Taunt()
	ATTACK = true
	Rooted = false
	TAUNT = true
	for i=0, 0.1, 0.1 / Animation_Speed do
		Swait()
		Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(5 - 2.5), RAD(0), RAD(0)), 0.15 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(0), RAD(0), RAD(12)) * RIGHTSHOULDERC0, 2 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(0), RAD(0), RAD(-12)) * LEFTSHOULDERC0, 2 / Animation_Speed)
	end
	for i=0, 3, 0.1 / Animation_Speed do
		Swait()
		Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(5 - 2.5), RAD(0), RAD(0)), 0.15 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(170), RAD(0), RAD(-15)) * RIGHTSHOULDERC0, 0.15 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(170), RAD(0), RAD(15)) * LEFTSHOULDERC0, 0.15 / Animation_Speed)
	end
	CreateSound(363808674, Torso, 10, 1.3)
	for i=0, 1, 0.1 / Animation_Speed do
		Swait()
		Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(5 - 2.5), RAD(0), RAD(120)), 3 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(150), RAD(0), RAD(-25)) * RIGHTSHOULDERC0, 3/ Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(230), RAD(0), RAD(35)) * LEFTSHOULDERC0, 3 / Animation_Speed)
	end
	WACKYEFFECT({EffectType = "Block", Size = VT(6,6,6), Size2 = VT(15,15,15), Transparency = 0, Transparency2 = 1, CFrame = Torso.CFrame, MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(1,0,0), SoundID = nil, SoundPitch = 1, SoundVolume = 5})
	CreateSound(649634100, Torso, 10, 0.8)
	for i=0, 0.01, 0.1 / Animation_Speed do
		Swait()
		Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(15 - 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)), 3 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1, 0.5, 0.5) * ANGLES(RAD(0), RAD(-45), RAD(12)) * ANGLES(RAD(-45 - 2.5 * COS(SINE / 12) + 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)) * RIGHTSHOULDERC0, 3 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1, 0.5, 0.5) * ANGLES(RAD(0), RAD(45), RAD(-12)) * ANGLES(RAD(-45 - 2.5 * COS(SINE / 12) + 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)) * LEFTSHOULDERC0, 3 / Animation_Speed)
	end
	ATTACK = false
	Rooted = false
	TAUNT = false
end

function Teleport()
	ATTACK = true
	Rooted = false
	for i=0, 0.5, 0.1 / Animation_Speed do
		Swait()
		Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(15 - 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)), 1 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.6, 0.75, -0.5) * ANGLES(RAD(0), RAD(-25), RAD(12)) * ANGLES(RAD(125 - 2.5 * COS(SINE / 12) + 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)) * RIGHTSHOULDERC0, 1.5 / Animation_Speed)
	end
	for e = 1, #BODY do
		if BODY[e] ~= nil then
			local STUFF = BODY[e]
			local PART = STUFF[1]
			if PART:IsA("BasePart") and PART ~= RootPart and PART.Name ~= "FaceGradient" and PART.Name ~= "Hair" and PART.Transparency ~= 1 then
				local PRT = PART:Clone()
				PRT.Anchored = true
				PRT.CanCollide = false
				PRT.Material = "Neon"
				PRT.Color = C3(1,0,0)
				PRT.Name = "WarpEffect"
				PRT.Parent = Effects
				PRT.CFrame = PART.CFrame
				PRT:BreakJoints()
				if PRT:FindFirstChildOfClass("Sound") then
					PRT:FindFirstChildOfClass("Sound"):remove()
				end
				if PRT:FindFirstChildOfClass("Decal") then
					PRT:FindFirstChildOfClass("Decal"):remove()
				end
				coroutine.resume(coroutine.create(function()
					for i = 1, 100 do
						Swait()
						PRT.Transparency = PRT.Transparency + 1/100
					end
					PRT:remove()
				end))
			end
		end
	end
	CreateSound(217767125, Torso, 10, 1)
	local POS = RootPart.Orientation
	RootPart.CFrame = CF(Mouse.Hit.p+VT(0,6,0))
	RootPart.Orientation = POS
	RootJoint.Parent = RootPart
	for i=0, 0.5, 0.1 / Animation_Speed do
		Swait()
		Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(15 - 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)), 1 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.6, 0.75, -0.5) * ANGLES(RAD(0), RAD(-15), RAD(12)) * ANGLES(RAD(175 - 2.5 * COS(SINE / 12) + 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)) * RIGHTSHOULDERC0, 2.5 / Animation_Speed)
	end
	for i=0, 0.1, 0.1 / Animation_Speed do
		Swait()
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1, 0.5, 0.5) * ANGLES(RAD(0), RAD(-45), RAD(12)) * ANGLES(RAD(45 - 2.5 * COS(SINE / 12) + 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)) * RIGHTSHOULDERC0, 0.75 / Animation_Speed)
	end
	ATTACK = false
	Rooted = false
end

function Equivalent_Pain()
	local HITFLOOR,HITPOS = Raycast(RootPart.Position, (CF(RootPart.Position, RootPart.Position + VT(0, -1, 0))).lookVector, 4, Character)
		if HITFLOOR then
		ATTACK = true
		Rooted = true
		FULL = true
		local GYRO = IT("BodyGyro",RootPart)
		GYRO.D = 25
		GYRO.P = 20000
		GYRO.MaxTorque = VT(0,math.huge,0)
		for i=0, 0.3, 0.1 / Animation_Speed do
			GYRO.cframe = CF(RootPart.Position,Mouse.Hit.p)
			Swait()
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.05 * COS(SINE / 12)) * ANGLES(RAD(-25), RAD(0), RAD(-15)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0.3) * ANGLES(RAD(90), RAD(0), RAD(12)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(0), RAD(45), RAD(-12)) * ANGLES(RAD(-25), RAD(0), RAD(0)) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -1 - 0.05 * COS(SINE / 12), -0.01) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(-35)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1 - 0.05 * COS(SINE / 12), -0.01) * ANGLES(RAD(0), RAD(-75), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(5)), 1 / Animation_Speed)
		end
		GYRO:remove()
		CreateSound(12222200, RightArm, 10, 1)
		for i=0, 0.4, 0.1 / Animation_Speed do
			Swait()
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, -0.3, -0.75) * ANGLES(RAD(40), RAD(0), RAD(35)), 1.5 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(-15 - 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.45, -1.45) * ANGLES(RAD(75), RAD(0), RAD(35)) * RIGHTSHOULDERC0, 2 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(0), RAD(-25), RAD(-12)) * ANGLES(RAD(-35), RAD(55), RAD(0)) * LEFTSHOULDERC0, 2 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -0.3, -0.5) * ANGLES(RAD(0), RAD(55), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(65)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -0.6, -0.2) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(-15)), 1 / Animation_Speed)
		end
		CreateSound(289842971, RightArm, 10, 1)
		coroutine.resume(coroutine.create(function()
			local HIT,POS = Raycast(Mouse.Hit.p+VT(0,1,0), (CF(Mouse.Hit.p+VT(0,1,0), Mouse.Hit.p-VT(0,1,0))).lookVector, 45, Character)
			local ECHO = POS
			if HITFLOOR.Parent:FindFirstChildOfClass("Humanoid") then
				HIT,POS = Raycast(ECHO+VT(0,1,0), (CF(ECHO, ECHO + VT(0, -1, 0))).lookVector, 100, HITFLOOR.Parent)
				ECHO = POS
			elseif HITFLOOR.Parent.Parent:FindFirstChildOfClass("Humanoid") then
				HIT,POS = Raycast(ECHO+VT(0,1,0), (CF(ECHO, ECHO + VT(0, -1, 0))).lookVector, 100, HITFLOOR.Parent.Parent)
				ECHO = POS
			end
			if ECHO.Y == HITPOS.Y then
				local DISTANCE = (HITPOS - ECHO).Magnitude/3
				local CFRAME = CF(HITPOS,ECHO)
				local RANGE = math.ceil(DISTANCE)
				for i = 1, RANGE-1 do
					Swait(3)
					local A = CFRAME*CF(0,0,-i*3)
					ApplyAoE(A.p,4)
					CreateFlyingDebree(HITFLOOR,A,2,VT(2,2,2),2,65)
				end
				local SIZE = 3
				local POS = CFRAME*CF(0,0,-RANGE*3).p
				WACKYEFFECT({Time = 75, EffectType = "Sphere", Size = VT(55,0,55)*SIZE, Size2 = VT(55,15,55)*SIZE, Transparency = 0, Transparency2 = 1, CFrame = CF(POS), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(1,0,0), SoundID = 130972023, SoundPitch = 0.8, SoundVolume = 10})
				WACKYEFFECT({EffectType = "Sphere", Size = VT(10,250,10)*SIZE, Size2 = VT(20,1000,20)*SIZE, Transparency = 0, Transparency2 = 1, CFrame = CF(POS), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(1,0,0), SoundID = 178452241, SoundPitch = 1, SoundVolume = 10})
				WACKYEFFECT({EffectType = "Sphere", Size = VT(30,150,30)*SIZE, Size2 = VT(50,300,50)*SIZE, Transparency = 0, Transparency2 = 1, CFrame = CF(POS), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(1,0,0), SoundID = 178452241, SoundPitch = 1, SoundVolume = 10})
				for i = 1, 9 do
					WACKYEFFECT({TIME = 65, EffectType = "Sphere", Size = VT(5,5,0)*SIZE, Size2 = VT(0,0,35)*SIZE, Transparency = 0, Transparency2 = 1, CFrame = CF(POS+VT(0,15*SIZE,0))*ANGLES(RAD(0),RAD((360/9)*i),RAD(0))*ANGLES(RAD(25),RAD(0),RAD(0))*CF(0,0,-25*SIZE), MoveToPos = CF(POS+VT(0,15*SIZE,0))*ANGLES(RAD(0),RAD((360/9)*i),RAD(0))*ANGLES(RAD(25),RAD(0),RAD(0))*CF(0,0,-55*SIZE).p, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(1,0,0), SoundID = nil, SoundPitch = 0.8, SoundVolume = 5})
				end
				for i = 1, 9 do
					WACKYEFFECT({TIME = 65, EffectType = "Sphere", Size = VT(5,5,0)*SIZE, Size2 = VT(0,0,35)*SIZE, Transparency = 0, Transparency2 = 1, CFrame = CF(POS+VT(0,5*SIZE,0))*ANGLES(RAD(0),RAD((360/9)*i),RAD(0))*ANGLES(RAD(25),RAD(0),RAD(0))*CF(0,0,-25*SIZE), MoveToPos = CF(POS+VT(0,5*SIZE,0))*ANGLES(RAD(0),RAD((360/9)*i),RAD(0))*ANGLES(RAD(25),RAD(0),RAD(0))*CF(0,0,-55*SIZE).p, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(1,0,0), SoundID = nil, SoundPitch = 0.8, SoundVolume = 5})
				end
				ApplyAoE(POS,30*SIZE)
				CreateDebreeRing(HITFLOOR,POS,30*SIZE,VT(8,8,8)*SIZE,5)
				CreateDebreeRing(HITFLOOR,POS,50*SIZE,VT(2,2,2)*SIZE,5)
			end
		end))
		for i=0, 0.6, 0.1 / Animation_Speed do
			Swait()
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, -0.3, -0.75) * ANGLES(RAD(40), RAD(0), RAD(35)), 1.5 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(-15 - 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.45, -1.45) * ANGLES(RAD(75), RAD(0), RAD(35)) * RIGHTSHOULDERC0, 2 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(0), RAD(-25), RAD(-12)) * ANGLES(RAD(-35), RAD(55), RAD(0)) * LEFTSHOULDERC0, 2 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -0.3, -0.5) * ANGLES(RAD(0), RAD(55), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(65)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -0.6, -0.2) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(-15)), 1 / Animation_Speed)
		end
		FULL = false
		ATTACK = false
		Rooted = false
	end
end

--//=================================\\
--||	  ASSIGN THINGS TO KEYS
--\\=================================//

function MouseDown(Mouse)
	if ATTACK == false then
		Click()
	end
end

function MouseUp(Mouse)
HOLD = false
end

function KeyDown(Key)
	if Key ~= "w" and Key ~= "a" and Key ~= "s" and Key ~= "d" then
		KEYHOLD = true
		if Key == "z" and ATTACK == false then
			Whitelist()
		end
	
		if Key == "b" and ATTACK == false then
			Clear_Whitelist()
		end
	
		if Key == "c" and ATTACK == false then
			Smite()
		end
	
		if Key == "x" and ATTACK == false then
			Meteor_Shower()
		end
	
		if Key == "t" and ATTACK == false then
			Taunt()
		end

		if Key == "q" and ATTACK == false then
			Teleport()
		end

		if Key == "p" and ATTACK == false then
			Equivalent_Pain()
		end
	end
end

function KeyUp(Key)
	if Key ~= "w" and Key ~= "a" and Key ~= "s" and Key ~= "d" then
		KEYHOLD = false
	end
end

	Mouse.Button1Down:connect(function(NEWKEY)
		MouseDown(NEWKEY)
	end)
	Mouse.Button1Up:connect(function(NEWKEY)
		MouseUp(NEWKEY)
	end)
	Mouse.KeyDown:connect(function(NEWKEY)
		KeyDown(NEWKEY)
	end)
	Mouse.KeyUp:connect(function(NEWKEY)
		KeyUp(NEWKEY)
	end)

--//=================================\\
--\\=================================//


function unanchor()
	if UNANCHOR == true then
		g = Character:GetChildren()
		for i = 1, #g do
			if g[i].ClassName == "Part" then
				g[i].Anchored = false
			end
		end
	end
end


--//=================================\\
--||	WRAP THE WHOLE SCRIPT UP
--\\=================================//

Humanoid.Changed:connect(function(Jump)
	if Jump == "Jump" and (Disable_Jump == true) then
		Humanoid.Jump = false
	end
end)

local BLINKLOOP = 0
script.Parent = WEAPONGUI
ANIMATE.Parent = nil

while true do
	Swait()
	if Humanoid then
		local IDLEANIMATION = Humanoid:LoadAnimation(ROBLOXIDLEANIMATION)
		IDLEANIMATION:Play()
	end
	SINE = SINE + CHANGE*2
	local TORSOVELOCITY = (RootPart.Velocity * VT(1, 0, 1)).magnitude
	local TORSOVERTICALVELOCITY = RootPart.Velocity.y
	local HITFLOOR = Raycast(RootPart.Position, (CF(RootPart.Position, RootPart.Position + VT(0, -1, 0))).lookVector, 4, Character)
	local WALKSPEEDVALUE = 12 / (Humanoid.WalkSpeed / 16)
	HairWeld1.C1 = Clerp(HairWeld1.C1, CF(0, 0, 0) * ANGLES(RAD(0), RAD(0 + 1.5 * SIN(SINE / 12) - 2.5 * COS(SINE / 12)), RAD(4.5 * SIN(SINE / 12))), 1 / Animation_Speed)
	HairWeld2.C1 = Clerp(HairWeld2.C1, CF(0, 0, 0) * ANGLES(RAD(0), RAD(0 - 1.5 * SIN(SINE / 12) + 2.5 * COS(SINE / 12)), RAD(-4.5 * SIN(SINE / 12))), 1 / Animation_Speed)
	HoodWeld.C1 = Clerp(HoodWeld.C1, CF(0, 0, 0) * ANGLES(RAD(0), RAD(0 + 0.75 * SIN(SINE / 12) - 1.75 * COS(SINE / 12)), RAD(2.75 * SIN(SINE / 12))), 1 / Animation_Speed)
	if ANIM == "Walk" and TORSOVELOCITY > 1 and FULL == false then
		RootJoint.C1 = Clerp(RootJoint.C1, ROOTC0 * CF(0, 0, -0.1 * COS(SINE / (WALKSPEEDVALUE / 2))) * ANGLES(RAD(0), RAD(0) - RootPart.RotVelocity.Y / 75, RAD(0)), 2 * (Humanoid.WalkSpeed / 16) / Animation_Speed)
		Neck.C1 = Clerp(Neck.C1, CF(0, -0.5, 0) * ANGLES(RAD(-90), RAD(0), RAD(180)) * ANGLES(RAD(2.5 * SIN(SINE / (WALKSPEEDVALUE / 2))), RAD(0), RAD(0) - Head.RotVelocity.Y / 30), 0.2 * (Humanoid.WalkSpeed / 16) / Animation_Speed)
		RightHip.C1 = Clerp(RightHip.C1, CF(0.5, 0.875 - 0.125 * SIN(SINE / WALKSPEEDVALUE) - 0.1 * COS(SINE / WALKSPEEDVALUE*2), -0.125 * COS(SINE / WALKSPEEDVALUE) +0.2+ 0.2 * COS(SINE / WALKSPEEDVALUE)) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(0) - RightLeg.RotVelocity.Y / 75, RAD(0), RAD(35 * COS(SINE / WALKSPEEDVALUE))), 1 / Animation_Speed)
		LeftHip.C1 = Clerp(LeftHip.C1, CF(-0.5, 0.875 + 0.125 * SIN(SINE / WALKSPEEDVALUE) - 0.1 * COS(SINE / WALKSPEEDVALUE*2), 0.125 * COS(SINE / WALKSPEEDVALUE) +0.2+ -0.2 * COS(SINE / WALKSPEEDVALUE)) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(0) + LeftLeg.RotVelocity.Y / 75, RAD(0), RAD(35 * COS(SINE / WALKSPEEDVALUE))), 1 / Animation_Speed)
	elseif (ANIM ~= "Walk") or (TORSOVELOCITY < 1) or FULL == true then
		RootJoint.C1 = Clerp(RootJoint.C1, ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.2 / Animation_Speed)
		Neck.C1 = Clerp(Neck.C1, CF(0, -0.5, 0) * ANGLES(RAD(-90), RAD(0), RAD(180)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.2 / Animation_Speed)
		RightHip.C1 = Clerp(RightHip.C1, CF(0.5, 1, 0) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.2 / Animation_Speed)
		LeftHip.C1 = Clerp(LeftHip.C1, CF(-0.5, 1, 0) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.2 / Animation_Speed)
	end
	if FULL == false then
		if TORSOVERTICALVELOCITY > 1 and HITFLOOR == nil then
			ANIM = "Jump"
			if ATTACK == false then
				Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(-5 - 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)), 0.4 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1, 0.5, 0.5) * ANGLES(RAD(-15), RAD(-45), RAD(12)) * ANGLES(RAD(-45 - 2.5 * COS(SINE / 12) + 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)) * RIGHTSHOULDERC0, 0.15 / Animation_Speed)
			end
			RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.2 / Animation_Speed)
			if TAUNT == false then
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1, 0.5, 0.5) * ANGLES(RAD(0), RAD(45), RAD(-12)) * ANGLES(RAD(-45 - 2.5 * COS(SINE / 12) + 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)) * LEFTSHOULDERC0, 0.15 / Animation_Speed)
			end
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -1, -0.3) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(-5), RAD(0), RAD(-20)), 0.2 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1, -0.3) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(-5), RAD(0), RAD(20)), 0.2 / Animation_Speed)
		elseif TORSOVERTICALVELOCITY < -1 and HITFLOOR == nil then
			ANIM = "Fall"
			if ATTACK == false then
				Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(5 - 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)), 0.15 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1, 0.5, 0.5) * ANGLES(RAD(0), RAD(-45), RAD(12)) * ANGLES(RAD(-45 - 2.5 * COS(SINE / 12) + 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)) * RIGHTSHOULDERC0, 0.15 / Animation_Speed)
			end
			RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0, 0, 0 ) * ANGLES(RAD(15), RAD(0), RAD(OFFSET)), 0.2 / Animation_Speed)
			if TAUNT == false then
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1, 0.5, 0.5) * ANGLES(RAD(0), RAD(45), RAD(-12)) * ANGLES(RAD(-45 - 2.5 * COS(SINE / 12) + 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)) * LEFTSHOULDERC0, 0.15 / Animation_Speed)
			end
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -0.25, -0.5) * ANGLES(RAD(0), RAD(75), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(20)), 0.4 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1, 0) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(10)), 1 / Animation_Speed)
		elseif TORSOVELOCITY < 1 and HITFLOOR ~= nil then
			ANIM = "Idle"
			if ATTACK == false then
				Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(15 - 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)), 0.15 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1, 0.5, 0.5) * ANGLES(RAD(-3.5 * COS(SINE / 12)), RAD(-45), RAD(12)) * ANGLES(RAD(-45 - 2.5 * COS(SINE / 12) + 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)) * RIGHTSHOULDERC0, 0.15 / Animation_Speed)
			end
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.1 * COS(SINE / 12)) * ANGLES(RAD(0), RAD(0), RAD(OFFSET)), 0.8 / Animation_Speed)
			if TAUNT == false then
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1, 0.5, 0.5) * ANGLES(RAD(0), RAD(45), RAD(-12)) * ANGLES(RAD(-45 - 2.5 * COS(SINE / 12) + 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)) * LEFTSHOULDERC0, 0.15 / Animation_Speed)
			end
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -1 - 0.1 * COS(SINE / 12), -0.01) * ANGLES(RAD(0), RAD(65), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(2.5 * COS(SINE / 12))), 0.8 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1 - 0.1 * COS(SINE / 12), -0.01) * ANGLES(RAD(0), RAD(-65), RAD(0)) * ANGLES(RAD(-8), RAD(5), RAD(15-2.5 * COS(SINE / 12))), 0.8 / Animation_Speed)
		elseif TORSOVELOCITY > 1 and HITFLOOR ~= nil then
			ANIM = "Walk"
			if ATTACK == false then
				Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(10 - 2.5 * SIN(SINE / 12)), RAD(5), RAD(0)), 0.15 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1, 0.5, 0.5) * ANGLES(RAD(0), RAD(-45), RAD(12)) * ANGLES(RAD(-45 - 2.5 * COS(SINE / 12) + 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)) * RIGHTSHOULDERC0, 0.15 / Animation_Speed)
			end
			if TAUNT == false then
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1, 0.5, 0.5) * ANGLES(RAD(0), RAD(45), RAD(-12)) * ANGLES(RAD(-45 - 2.5 * COS(SINE / 12) + 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)) * LEFTSHOULDERC0, 0.15 / Animation_Speed)
			end
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, -0.1) * ANGLES(RAD(5), RAD(0), RAD(OFFSET)), 0.8 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1 , -1, 0) * ANGLES(RAD(0), RAD(75), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(-15)), 2 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1, 0) * ANGLES(RAD(0), RAD(-75), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(15)), 2 / Animation_Speed)
		end
	end
	unanchor()
	Humanoid.MaxHealth = "inf"
	Humanoid.Health = "inf"
	if Rooted == false then
		Disable_Jump = false
		Humanoid.WalkSpeed = Speed
	elseif Rooted == true then
		Disable_Jump = true
		Humanoid.WalkSpeed = 0
	end
	sick.Volume = 2
	sick.Pitch = 1
	sick.Playing = true
	sick.Parent = Torso
	Humanoid.Name = MRANDOM(100000000,999999999)
	Humanoid.PlatformStand = false
	for _, c in pairs(Cam:GetChildren()) do
		if game.Players:FindFirstChild(c.Name) == nil and c.ClassName == "BillboardGui" then
			c:remove()
		end
	end
	for LIST = 1, #WHITELIST do
		if WHITELIST[LIST] ~= nil then
			local CHARACTER = workspace:FindFirstChild(WHITELIST[LIST])
			if CHARACTER then
				if Cam:FindFirstChild(WHITELIST[LIST]) == nil then
					local TORSO = CHARACTER:FindFirstChild("Torso") or CHARACTER:FindFirstChild("UpperTorso")
					if TORSO then
						CreateSound(201858045, Cam, 3, 1)	
						local GUI = Instance.new("BillboardGui",Cam)
						GUI.Name = WHITELIST[LIST]
						GUI.Size = UDim2.new(5,0,5,0)
						GUI.Adornee = TORSO
						local GUI2 = IT("ImageLabel",GUI)
						GUI2.BackgroundTransparency = 1
						GUI2.BorderSizePixel = 0
						GUI2.ImageTransparency = 1
						GUI2.Size = UDim2.new(1,0,1,0)
						GUI2.SizeConstraint = "RelativeYY"
						GUI.AlwaysOnTop = true
						GUI2.Image = "http://www.roblox.com/asset/?id=142164463"
					end
				else
					local GUI = Cam:FindFirstChild(WHITELIST[LIST])
					if GUI.ImageLabel.ImageTransparency <= 1 then
						GUI.ImageLabel.ImageTransparency = GUI.ImageLabel.ImageTransparency - 0.03
					end
					local TORSO = CHARACTER:FindFirstChild("Torso") or CHARACTER:FindFirstChild("UpperTorso")
					if TORSO then
						GUI.Adornee = TORSO
					end
				end
			else
				if Cam:FindFirstChild(WHITELIST[LIST]) then
					Cam:FindFirstChild(WHITELIST[LIST]):remove()
				end
			end
		else
			if Cam:FindFirstChild(WHITELIST[LIST]) then
				Cam:FindFirstChild(WHITELIST[LIST]):remove()
			end
			table.remove(WHITELIST,LIST)
		end
	end
	if Character:FindFirstChildOfClass("Accessory") then
		Character:FindFirstChildOfClass("Accessory"):remove()
	elseif Character:FindFirstChildOfClass("Hat") then
		Character:FindFirstChildOfClass("Hat"):remove()
	end
	if Head:FindFirstChild("face") then
		Head.face.Texture = "rbxassetid://403870689"
	end
	BLINKLOOP = BLINKLOOP + 1
	if BLINKLOOP >=650 then
		BLINKLOOP = 0
		Blink()
	end
	Humanoid.DisplayDistanceType = "None"
	Humanoid.PlatformStand = false
	refit()
	for _, c in pairs(Torso:GetChildren()) do
		if c:IsA("JointInstance") or c.ClassName == "Sound" then
		else
			c:remove()
		end
	end
end
