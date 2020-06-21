
function loadCheckpoints()
  checkpoints = {}
  complete = false

  createCheckpoint(6, 10)
  createCheckpoint(8, 11)
  createCheckpoint(8, 12)
end

function updateCheckpoints(dt)
  for i,checkpoint in ipairs(checkpoints) do
    checkpoint.animation:update(dt)
  end

  completed = 0
  for i,c in ipairs(checkpoints) do
    if checkpoint.covered == true then
      completed = completed + 1
    end
  end
  if completed == #checkpoints then
    complete = true
  else
    complete = false
  end
end

function drawCheckpoints()
  for i,checkpoint in ipairs(checkpoints) do
    checkpoint.animation:draw(
      sprites.checkpoint,
      (checkpoint.x - 1) * cellSize,
      (checkpoint.y - 1) * cellSize)
  end
end

function createCheckpoint(x, y)
  checkpoint = {}
  checkpoint.x = x
  checkpoint.y = y
  checkpoint.covered = false

  checkpoint.grid = Anim8.newGrid(30, 30, 90, 90)
  checkpoint.animation = Anim8.newAnimation(checkpoint.grid('1-3',1, '1-3',2, '1-2',3), 0.05)

  table.insert(checkpoints, checkpoint)
end

function check(checkpoint)
  checkpoint.covered = true
end

function uncheck(checkpoint)
  checkpoint.covered = false
end
