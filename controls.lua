function love.keypressed(key)


    if(key == "escape") then love.window.close() 
    end



    if(gameMode == "editor") then

        if(key == "space") then 
                if menu then menu = false else menu = true end
            
        elseif(key == "left" and selector.x > 0) then 
                selector.x = selector.x - selector.w
        elseif(key == "right" and selector.x < scW - selector.w) then 
                selector.x = selector.x + selector.w
        elseif(key == "up" and selector.y > 0) then 
                selector.y = selector.y - selector.w
        elseif(key == "down" and selector.y < scH - selector.w) then 
                selector.y = selector.y + selector.w
            
        end

    elseif(gameMode == "jeu") then


        local tween

        tween = easeSinOut(tweening.time, p.x, tweening.distance, tweening.duration)


        if(key == "left" and p.x > 0 and map1[p.cY+1][p.cX] == 0) then 
                p.x = p.x - p.w
        elseif(key == "right" and p.x < scW - p.w and map1[p.cY+1][p.cX+2] == 0) then 
                p.x = p.x + p.w
        elseif(key == "up" and p.y > 0 and map1[p.cY][p.cX+1] == 0) then 
                p.y = p.y - p.w
        elseif(key == "down" and p.y < scH - p.w and map1[p.cY+2][p.cX+1] == 0) then 
                p.y = p.y + p.w
        
        end
    end


        if(key == "g") then 
                if(gameMode == "editor") then
                        gameMode = "jeu"
                elseif(gameMode == "jeu") then
                        gameMode = "editor"
                end
        end
 
    
end

 