

ai = {}

function ai.load()
    lg = love.graphics
    ai.w = 10
    ai.h = 80
    ai.speed = 200
    ai.x = 1270
    ai.y = (720 - ai.h) / 2
    
end

function ai.update(dt)
    local targety = ball.y - ai.h / 2
    local deadzone = 10

    if math.abs(ai.y - targety) > deadzone then
        local randomOffset = math.random(-1, -10)
        targety = targety + randomOffset

        if ai.y < targety then
            ai.y = ai.y + ai.speed * dt
        elseif ai.y > targety then
            ai.y = ai.y - ai.speed * dt
        end
    end
    ai.y = math.max(0, math.min(720 - ai.h, ai.y))

    if ball.x + ball.radius > ai.x and ball.x - ball.radius < ai.x + ai.w and 
        ball.y + ball.radius > ai.y and ball.y - ball.radius < ai.y + ai.h then
            ball.angle = math.pi - ball.angle
        end
end

function ai.draw()
    lg.setColor(1,1,1)
    lg.rectangle("fill", ai.x, ai.y, ai.w, ai.h)
    
end

return ai