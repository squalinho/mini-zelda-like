require("controls")
require("functions")
require("maps")

io.stdout:setvbuf("no")
love.graphics.setDefaultFilter("nearest")

function love.load()

    initTween()
    spritesheet = love.graphics.newImage("imgs/assets.png")
        fantome = love.graphics.newQuad(0, 0, 32, 32, spritesheet)
        arbre = love.graphics.newQuad(32, 0, 32, 32, spritesheet)
        coffre = love.graphics.newQuad(64, 0, 32, 32, spritesheet)
        herbe = love.graphics.newQuad(0, 96, 32, 32,spritesheet)
        terre1 = love.graphics.newQuad(32, 96, 32, 32,spritesheet)
        hero = love.graphics.newQuad(0, 128, 32, 32, spritesheet)
   

    
    dami = {}
    dami.w = 32
    scW, scH = 640, 480
    love.window.setMode(scW,scH)
    gameMode = "jeu"
    menu = false
    selector = {}
    selector.x = 0
    selector.y = 0
    selector.w = dami.w
    love.window.setTitle("Mini ZELDA")
    p = {}
    p.x = 256
    p.y = 256
    p.w = 32
    p.cX = 0
    p.cY = 0
    --love.window.setFullscreen(true, "desktop")
end

function love.update(dt)

    mX, mY = love.mouse.getPosition()
    cX = math.floor(mX/32)
    cY = math.floor(mY/32)
    NumSpritesheet = map1[cY+1][cX+1]
    p.cX = math.floor(p.x/32)
    p.cY = math.floor(p.y/32)
    NumCaseHero = map1[p.cY+1][p.cX+1]
   -- test = map1[p.cY + 1][p.cX]
   if(tweening.time < tweening.duration) then tweening.time = tweening.time + dt end

end

function love.draw()


    if(gameMode == "editor") then 

        damier(0,0,dami.w,21,314,0.5)
        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.rectangle("line", selector.x, selector.y, selector.w, selector.w)
        afficheAssets()
    elseif(gameMode == "jeu") then
        afficheSol()
        afficheAssets()

        local tween

        tween = easeSinOut(tweening.time, tweening.value, tweening.distance, tweening.duration)
        --print(tween)
        love.graphics.draw(spritesheet, hero, p.x, p.y)
        love.graphics.circle("fill", tween, 20,20)
        
    end
    
    
    
   
    


    if menu then 
        love.graphics.setColor(0, 0.3, 1, 0.4)
        love.graphics.rectangle("fill", 0, 0, scW, 40)
        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.print("Mouse : ("..mX..","..mY..")",10,10)
        love.graphics.print("Cases : "..cX..","..cY,200,10)
        love.graphics.print("NumSpritesheet : "..NumSpritesheet,300,10)
        love.graphics.print("player cases : ("..p.cX..","..p.cY..")",300,22)
        love.graphics.print("caseHero : "..NumCaseHero,500,10)
        love.graphics.setColor(1, 1, 1, 1)
    end

  
 
end

