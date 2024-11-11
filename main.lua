
-- Exercice: faire 10 bulles qui rebondissent sur le bord de l'écran

require("bulles")
bulles = {}
nombreBulles = 0
tic = 0

function love.load()
    largeur = love.graphics.getWidth()
    hauteur = love.graphics.getHeight()
end

function love.update(dt)
    for i=1,#bulles do
        bulles[i].update(dt)
    end
end

function love.draw()
    for i=1,#bulles do
        bulles[i].draw()
    end

    love.graphics.print("Nombre de bulles: "..nombreBulles, 0,0)
end

function love.keypressed(key)
    if (key == "space") then
        ajoutBulles()
        nombreBulles = nombreBulles + 1
    end
end
