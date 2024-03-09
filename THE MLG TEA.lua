--
--by SazErenos i think
wait(.2)

vPlayer=game.Players.LocalPlayer



Tool=script.Parent
--if script.Parent.className~="Tool"  then

	Tool=Instance.new("Tool")
	Tool.Name="Tea"
	Tool.Parent=vPlayer.Backpack
	Handle=Instance.new("Part")
	Handle.Size=Vector3.new(2.6,2.6,2.6)
	Handle.TopSurface=0
	Handle.BottomSurface=0
	Handle.Name="Handle"
	Handle.formFactor="Custom"
	Handle.Parent=Tool
	Handle.BrickColor=BrickColor:White()
	Tool.GripRight=Vector3.new(0,0,1)
	Tool.GripPos=Vector3.new(-1.08,-.1,.1)
	

	m=Instance.new("SpecialMesh")
	m.MeshType="FileMesh"
	m.MeshId="http://www.roblox.com/asset/?id=1029523"
	m.Parent=Handle
	m.Scale=Vector3.new(.05,.05,.05)
	--script:clone().Parent=Tool
	script.Parent=Tool
	wait()
--else
	
	Tool=script.Parent
	Mouse=vPlayer:GetMouse()
	deb=true
	onClick=function()
		if deb==false then
			return
		end
		deb=false
		e=0
		rs=vPlayer.Character["Torso"]["Right Shoulder"]
		
		
		s=Instance.new("Sound")
		s.SoundId="http://www.roblox.com/asset/?id=159257160"
		s.Volume=1
		s.Parent=Tool.Handle
		s:Play()
		game:GetService("Debris"):AddItem(s,5)
		wait(5)
		lolol=rs.C0
		for i=1, 4 do
			rs.C0=rs.C0*CFrame.fromEulerAnglesXYZ(0,0,math.rad(30))
			wait(.031)
		end
		s=Instance.new("Sound")
		s.Volume=1
		s.Parent=Tool.Handle
		s.Name="Throw"
		s.Pitch=.8
		s.SoundId="http://www.roblox.com/asset/?id=189505665"
		s:Play()
		game:GetService("Debris"):AddItem(s,5)
		for i=1, 2 do
			rs.C0=rs.C0*CFrame.fromEulerAnglesXYZ(0,0,-math.rad(30))
			wait(.031)
		end
		--throw
		hh=Tool.Handle:clone()
		dir=(hh.Position - game.Players.LocalPlayer:GetMouse().Hit.p).unit*-1
		Tool.Handle.Transparency=1
		hh.CanCollide=true
		hh.Parent=workspace
		hh.Velocity=dir*200+Vector3.new(0,5,0)
		ff=Instance.new("BodyForce")
		ff.force=Vector3.new(0,hh:GetMass()*140,0)
		ff.Parent=hh
		for i=1, 2 do
			rs.C0=rs.C0*CFrame.fromEulerAnglesXYZ(0,0,-math.rad(30))
			hh.Velocity=dir*330
			wait(.031)
		end
		hitdeb=true
		hh.Touched:connect(function(hit)
			if hit==nil or hitdeb==false then return end
			if hit.Parent==nil then return end
			if hit.Parent:FindFirstChild("Humanoid")~=nil and hh:FindFirstChild("Hit")==nil then
				if hit.Parent==game.Players.LocalPlayer.Character then return end
				hitdeb=false
				hit.Anchored=true
				hh.Anchored=true
				s=Instance.new("Sound")
				s.Volume=1
				s.Parent=hit
				s.Name="Hit1"
				s.SoundId="http://www.roblox.com/asset/?id=167783266"
				s:Play()
				wait(.5)
				hit.Anchored=false
				hit.Parent:BreakJoints()
				s=Instance.new("Sound")
				s.Volume=1
				s.Parent=hh
				s.Name="Hit1"
				s.SoundId="http://www.roblox.com/asset/?id=168009623"
				s:Play()
				s=Instance.new("Sound")
				s.Volume=1
				s.Parent=hh
				s.Name="Hit2"
				s.SoundId="http://www.roblox.com/asset/?id=163680447"
				s:Play()
				s5=Instance.new("Sound")
				s5.Volume=1
				s5.Parent=hh
				s5.Name="Hit"
				s5.SoundId="http://www.roblox.com/asset/?id=138122923"
				s5.Pitch=.85
				s5:Play()
				e=Instance.new("Explosion",workspace)
				e.Position=hh.Position
				e.BlastPressure=e.BlastPressure*4
				
				for _,v in pairs(hit.Parent:children()) do
					if v:IsA("BasePart") then
						v.Velocity=(v.Position - hh.Position).unit * 90 + Vector3.new(math.random(-20,20),math.random(0,20),math.random(-20,20))
						v.RotVelocity=-v.Velocity * 1.2
					end
				end
				
				m=Instance.new("Model",workspace)
				m.Name="Illuminaughty"
				p=Instance.new("Part",m)
				p.Name="REK"
				p.TopSurface=0
				p.BottomSurface=0
				p.Anchored=true
				p.CanCollide=false
				p.Transparency=1
				p.CFrame=hh.CFrame
				b=Instance.new("BillboardGui",p)
				b.Size=UDim2.new(25,0,25,0)
				b.Adornee=p
				--ss=script.REKT:clone()
				--ss.Disabled=false
				--recentchar=b
				--ss.Parent=b
				partica(b)
				
				
				hh.Transparency=1
				for i=1, 20 do
					p=Instance.new("Part")
					p.TopSurface=0
					p.BottomSurface=0
					p.Name="Shard"
					p.CFrame=hh.CFrame * CFrame.fromEulerAnglesXYZ(math.random(-50,50),math.random(-50,50),math.random(-50,50)) + Vector3.new(math.random(-15,15)/10,math.random(-15,15)/10,math.random(-15,15)/10)
					p.BrickColor=hh.BrickColor
					p.CanCollide=false
					p.formFactor="Custom"
					p.Size=Vector3.new(.2,.2,.2)
					if math.random(1,3)==1 then
						m=Instance.new("BlockMesh")
						m.Scale=Vector3.new(math.random(10,15)/10,.2,math.random(10,15)/10)
						m.Parent=p
					else
						m=Instance.new("SpecialMesh")
						m.MeshType="Wedge"
						m.Scale=Vector3.new(math.random(10,15)/10,.2,math.random(10,15)/10)
						m.Parent=p
					end
					p.RotVelocity=Vector3.new(math.random(-50,50),math.random(-50,50),math.random(-50,50))
					p.Velocity=p.RotVelocity + Vector3.new(0,25,0) + hh.Velocity / 6
					p.Parent=workspace
				end
				
				hh.Anchored=true
				
			end
			if hit.Parent:FindFirstChild("Humanoid")==nil and hh:FindFirstChild("Hit")==nil and hit.CanCollide==true then
				hh.Transparency=1
				for i=1, 20 do
					p=Instance.new("Part")
					p.TopSurface=0
					p.BottomSurface=0
					p.Name="Shard"
					p.CFrame=hh.CFrame * CFrame.fromEulerAnglesXYZ(math.random(-50,50),math.random(-50,50),math.random(-50,50)) + Vector3.new(math.random(-15,15)/10,math.random(-15,15)/10,math.random(-15,15)/10)
					p.BrickColor=hh.BrickColor
					p.CanCollide=false
					p.formFactor="Custom"
					p.Size=Vector3.new(.2,.2,.2)
					if math.random(1,3)==1 then
						m=Instance.new("BlockMesh")
						m.Scale=Vector3.new(math.random(10,15)/10,.2,math.random(10,15)/10)
						m.Parent=p
					else
						m=Instance.new("SpecialMesh")
						m.MeshType="Wedge"
						m.Scale=Vector3.new(math.random(10,15)/10,.2,math.random(10,15)/10)
						m.Parent=p
					end
					p.RotVelocity=Vector3.new(math.random(-50,50),math.random(-50,50),math.random(-50,50))
					p.Velocity=p.RotVelocity + Vector3.new(0,25,0) + hh.Velocity / 6
					p.Parent=workspace
				end
				for i=1, 4 do
				s5=Instance.new("Sound")
				s5.Volume=1
				s5.Parent=hh
				s5.Name="Hit"
				s5.SoundId="http://www.roblox.com/asset/?id=138122923"
				s5.Pitch=.85
				s5:Play()
				end
				hh.Anchored=true
			end
		end)
		game:GetService("Debris"):AddItem(hh,5)
		wait(4.33)
		Tool.Handle.Transparency=0
		deb=true
	end
	Tool.Activated:connect(onClick)
--end
partica=function(hit)
	wait()
Images={
"http://www.roblox.com/asset/?id=186565637",
"http://www.roblox.com/asset/?id=186565642",
"http://www.roblox.com/asset/?id=186565650",
"http://www.roblox.com/asset/?id=186565652",
"http://www.roblox.com/asset/?id=186565662",
"http://www.roblox.com/asset/?id=186565671",
"http://www.roblox.com/asset/?id=186565685",
"http://www.roblox.com/asset/?id=186565693",
"http://www.roblox.com/asset/?id=186565702",
"http://www.roblox.com/asset/?id=186565710",
"http://www.roblox.com/asset/?id=186565720",
"http://www.roblox.com/asset/?id=186565730",
"http://www.roblox.com/asset/?id=186565734",
"http://www.roblox.com/asset/?id=186565741",
"http://www.roblox.com/asset/?id=186565749",
"http://www.roblox.com/asset/?id=186565754",
}
sos=b--script.Parent
for i=1, #Images do
	p=Instance.new("ImageLabel",sos)
	p.Image=Images[i]
	p.BackgroundTransparency=1
	p.Visible=false
	p.Size=UDim2.new(1,0,1,0)
	p.Name=i
end
i=0
sossij=0
lel=game:GetService("RunService").Heartbeat:connect(function()
	if i<#Images then
		if sossij==1 then
			i=i+1
			--[[script.Parent[i]]b:children()[i].Visible=true
			if i>1 then
				--[[script.Parentb[i-1]]b:children()[i]:Destroy()
			end
			sossij=0
		else
			sossij=1
		end
	else
		lel:disconnect()
	end
end)
rekt={"http://www.roblox.com/asset/?id=185386536",
	"http://www.roblox.com/asset/?id=8979672",
	"http://www.roblox.com/asset/?id=10524802",
	"http://www.roblox.com/asset/?id=176067516",
	"http://www.roblox.com/asset/?id=179012130",
	"http://www.roblox.com/asset/?id=155875030",
	"http://www.roblox.com/asset/?id=180976600",
	"http://www.roblox.com/asset/?id=188207856",
	"http://www.roblox.com/asset/?id=89513267",
	}
sparkles={"http://www.roblox.com/asset/?id=186675771",
"http://www.roblox.com/asset/?id=185386497",
"http://www.roblox.com/asset/?id=185386514"}
for jooj=1, 30 do
	p=Instance.new("Part",sos)
	p.Name="Shrubbery"
	p.TopSurface=0
	p.BottomSurface=0
	p.Transparency=1
	
	p.Shape="Ball"
	soos=math.random(1,3)
	p.Size=Vector3.new(soos,soos,soos)
	p.CFrame=sos.Parent.CFrame * CFrame.new(Vector3.new(math.random(-50,50),math.random(-10,100),math.random(-50,50))/10)
	
	p.Velocity=Vector3.new(math.random(-30,30),math.random(10,100),math.random(-30,30))
	p.RotVelocity=Vector3.new(math.random(-50,50),math.random(-50,50),math.random(-50,50))
	
	b=Instance.new("BillboardGui",p)
	b.Name="SOSSIJ"
	b.Size=UDim2.new(soos*2,0,soos*2,0)
	b.Adornee=p
	s=Instance.new("ImageLabel",b)
	s.Name="Qaeoisgeyhuehuehuehuehuehuehueheuehu"
	s.Size=UDim2.new(1,0,1,0)
	s.Image=rekt[math.random(1,#rekt)]
	s.BackgroundTransparency=1
	
	p.Elasticity=0
	
	f=Instance.new("BodyForce")
	f.force=Vector3.new(0,p:GetMass()*140,0)
	f.Parent=p
	
	coroutine.resume(coroutine.create(function(p)
		while p.Parent~=nil do
			p.Rotation=-p.Parent.Parent.Rotation.x + p.Parent.Parent.Rotation.z
			wait()
		end
	end),s)
	
	game:GetService("Debris"):AddItem(p,15)
end
for jooj=1, 40 do
	p=Instance.new("Part",sos)
	p.Name="Spork"
	p.TopSurface=0
	p.BottomSurface=0
	p.Transparency=1
	p.CanCollide=false
	p.Shape="Ball"
	soos=1
	p.Size=Vector3.new(soos,soos,soos)
	p.CFrame=sos.Parent.CFrame * CFrame.new(Vector3.new(math.random(-50,50),math.random(-50,50),math.random(-50,50))/10)
	
	p.Velocity=Vector3.new(math.random(-30,30),math.random(10,100),math.random(-30,30))
	p.RotVelocity=Vector3.new(math.random(-50,50),math.random(-50,50),math.random(-50,50))
	soos=math.random(1,3)
	b=Instance.new("BillboardGui",p)
	b.Name="SOSSIJ"
	b.Size=UDim2.new(soos,0,soos,0)
	b.Adornee=p
	s=Instance.new("ImageLabel",b)
	s.Name="Qaeoisgeyhuehuehuehuehuehuehueheuehu"
	s.Size=UDim2.new(1,0,1,0)
	s.Image=sparkles[math.random(1,#sparkles)]
	s.BackgroundTransparency=1
	bbbg=b
	p.Elasticity=0
	
	f=Instance.new("BodyVelocity")
	f.velocity=p.Velocity / 5
	f.maxForce=Vector3.new(math.huge,math.huge,math.huge)
	f.Parent=p
	
	coroutine.resume(coroutine.create(function(p)
		while p.Parent~=nil do
			p.Rotation=-p.Parent.Parent.Rotation.x + p.Parent.Parent.Rotation.z
			p.Parent.Parent.BodyVelocity.velocity=p.Parent.Parent.BodyVelocity.velocity - Vector3.new(0,183/800,0)
			wait()
		end
	end),s)
	
	game:GetService("Debris"):AddItem(p,12)
end
repeat wait() until i==#Images
--script.Parent]]b:children()[tonumber(#Images)].Visible=false
--script.Parent]]b:children()[tonumber(#Images)]:Remove()
bbbg:Destroy()
wait(10)
--sos.Parent.Parent:Destroy()
end
