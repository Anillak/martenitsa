
function loadCheckpoints()
  checkpoints = {}
  complete = false

  createCheckpoint(6, 10)
  createCheckpoint(8, 11)
  createCheckpoint(8, 12)
end

function updateCheckpoints(dt)
  for _,checkpoint in ipairs(checkpoints) do
    checkpoint.animation:update(dt)
  end

  completed = 0
  for _,checkpoint in ipairs(checkpoints) do
    if checkpoint.covered then
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
  for _,checkpoint in ipairs(checkpoints) do
    checkpoint.animation:draw(
      sprites.checkpoint,
      (checkpoint.x - 1) * CELL_SIZE,
      (checkpoint.y - 1) * CELL_SIZE)
  end
end

function createCheckpoint(x, y)
  checkpoint = {}
  checkpoint.x = x
  checkpoint.y = y
  checkpoint.covered = false

  checkpoint.grid = Anim8.newGrid(CELL_SIZE, CELL_SIZE, CELL_SIZE*3, CELL_SIZE*3)
  checkpoint.animation = Anim8.newAnimation(checkpoint.grid('1-3',1, '1-3',2, '1-3',3), {1, 0.1, 0.1, 0.2, 0.7, 0.2, 0.1, 0.1, 1})

  table.insert(checkpoints, checkpoint)
end

function check(checkpoint)
  checkpoint.covered = true
end

function uncheck(checkpoint)
  checkpoint.covered = false
end
