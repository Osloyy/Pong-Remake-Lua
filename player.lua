

player = {}

function player.load()
    lg, lk = love.graphics, love.keyboard
    player.w = 10
    player.h = 80
    player.speed = 350
    
    player.x, player.y = 0, (720 - player.h) / 2
end

function player.update(dt)
    local dy = 0

    if lk.isDown("w") then
        dy = dy - player.speed * dt
    end
    if lk.isDown("s") then
        dy = dy + player.speed * dt
    end
    
    local screenh = lg.getHeight()

    player.y = math.max(0, math.min(player.y + dy, screenh - player.h))

    if ball.x + ball.radius > player.x and ball.x - ball.radius < player.x + player.w and 
        ball.y + ball.radius > player.y and ball.y - ball.radius < player.y + player.h then
            ball.angle = math.pi - ball.angle
        end
end

function player.draw()
    lg.setColor(1,1,1)
    lg.rectangle("fill", player.x, player.y, player.w, player.h)
end

return player