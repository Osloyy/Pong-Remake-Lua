

ball = {}
player1Score = 0
player2Score = 0

function ball.load()
    lg = love.graphics
    screenw = 1280
    screenh = 720
    x1, y1 = screenw / 2, 0
    x2, y2 = screenw / 2, screenh
    resetBall()
end

function ball.update(dt)
    local vx = math.cos(ball.angle) * ball.velocity
    local vy = math.sin(ball.angle) * ball.velocity
    
    ball.x = ball.x + vx * dt
    ball.y = ball.y + vy * dt

    if ball.x - ball.radius < 0 then
        player2Score = player2Score + 1
        
        resetBall()
    elseif ball.x + ball.radius > lg.getWidth() then
        player1Score = player1Score + 1
        
        resetBall()
    end

    if ball.y - ball.radius < 0 or ball.y + ball.radius > lg.getHeight() then
        ball.angle = -ball.angle
    end
end

function ball.draw()
    lg.setColor(1,1,1)
    lg.circle("fill", ball.x, ball.y, ball.radius)
    lg.line(x1, y1, x2, y2)
    local score1 = "player 1 score: " .. player1Score
    local score2 = "player 2 score: " .. player2Score
    lg.print(score1, 300, 50)
    lg.print(score2, 900, 50)
end

function resetBall()
    ball.x = lg.getWidth() / 2
    ball.y = lg.getHeight() / 2
    ball.angle = math.random() * math.pi
    ball.radius = 10
    ball.velocity = 350
end

return ball, player1Score, player2Score, ball.x, ball.y