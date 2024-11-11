function creeBulles(pX, pY, pR, pS, pDX, pDY)
    local bulles = {}
    bulles.nombre = 0
    bulles.x = pX
    bulles.y = pY
    bulles.r = pR -- radius
    bulles.speed = pS
    bulles.dx = pDX
    bulles.dy = pDY

    -- Mouvement des bulles
    bulles.update = function(dt)
        bulles.x = bulles.x + bulles.dx * (bulles.speed * dt)
        bulles.y = bulles.y + bulles.dy * (bulles.speed * dt)

        if bulles.y >= hauteur - bulles.r then
            bulles.dy = bulles.dy * -1
        end
        if bulles.y <= 0 + bulles.r then
            bulles.dy = bulles.dy * -1
        end
        if bulles.x >= largeur - bulles.r then
            bulles.dx = bulles.dx * -1
        end
        if bulles.x <= 0 + bulles.r then
            bulles.dx = bulles.dx * -1
        end
    end

    bulles.draw = function()
        love.graphics.circle("line", bulles.x, bulles.y, bulles.r)
    end
    return bulles
end

function ajoutBulles()
    for i=1,#bulles do
        local object = bulles[i]
        object.r = math.random(5,50)
        object.x = math.random(object.r, largeur - object.r)
        object.y = math.random(object.r, hauteur - object.r)
        object.speed = math.random(5,40)
        object.dx = math.random(1,10)
        object.dy = math.random(1,10)
        
        table.insert(bulles, creeBulles(object.x, object.y, object.r, object.speed, object.dx, object.dy))
    end
    table.insert(bulles, creeBulles(200, 400, 20, 30, 5, 6)) -- "LA FONCTION NE MARCHE PAS AVEC KEYPRESSED SANS CREER CETTE INSERTION"
end
