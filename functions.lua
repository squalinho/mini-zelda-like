function damier(x,y,taille,nbMax,nb,opacity)
    local sX = x
    local sY = y
   
    for i=1,nb do 
        
        if(i%2==0) then love.graphics.setColor(0.1, 0.2, 1, opacity) 
        
        else love.graphics.setColor(0.2, 0.56, 0.1, opacity)
        end

        love.graphics.rectangle("fill", sX, sY, taille, taille)

        if(i%nbMax == 0 and i >0) then 
            sX = x
            sY = sY + taille
        else sX = sX + taille
        end

        
    end
end

function afficheAssets()

    for j=1,15 do
        for i=1,20 do 
            if (map1[j][i] == 1 ) then love.graphics.draw(spritesheet, fantome, i*dami.w-dami.w, j*dami.w-dami.w) 
            elseif (map1[j][i] == 2 ) then love.graphics.draw(spritesheet, arbre, i*dami.w-dami.w, j*dami.w-dami.w)
            elseif (map1[j][i] == 3 ) then love.graphics.draw(spritesheet, coffre, i*dami.w-dami.w, j*dami.w-dami.w) end
        end
    end 
        
end

function afficheSol()
    
    for j=1,15 do
        for i=1,20 do 
            if (sol1[j][i] == 0 ) then love.graphics.draw(spritesheet, herbe, i*dami.w-dami.w, j*dami.w-dami.w) 
            elseif (sol1[j][i] == 1 ) then love.graphics.draw(spritesheet, terre1, i*dami.w-dami.w, j*dami.w-dami.w) 
            end
        end
    end 
        
end

tweening = {}

function easeSinOut(t, b, c, d)

    return c * math.sin(t/d * (math.pi/2)) + b

end


function initTween()

    tweening.time = 0
    tweening.value = 100
    tweening.distance = 400
    tweening.duration = 1

end