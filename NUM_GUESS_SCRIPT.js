let secretNumber = Math.floor(Math.random() * 100) + 1;
let attemptsLeft = 10;

function checkGuess() {
  const guessInput = document.getElementById("guess-input");
  const result = document.getElementById("result");
  const attempts = document.getElementById("attempts");
  const playAgainBtn = document.getElementById("play-again");

  const userGuess = Number(guessInput.value);

  // Validation
  if (isNaN(userGuess) || userGuess < 1 || userGuess > 100) {
    result.textContent = "❌ Enter a number between 1 and 100!";
    result.style.color = "red";
    return;
  }

  attemptsLeft--;

  if (userGuess === secretNumber) {
    result.textContent = `🎉 Correct! The number was ${secretNumber}.`;
    result.style.color = "green";
    endGame();
  } else if (attemptsLeft === 0) {
    result.textContent = `💀 Game Over! The number was ${secretNumber}.`;
    result.style.color = "red";
    endGame();
  } else if (userGuess < secretNumber) {
    result.textContent = "📉 Too low! Try a higher number.";
    result.style.color = "#f39c12";
  } else {
    result.textContent = "📈 Too high! Try a lower number.";
    result.style.color = "#f39c12";
  }

  attempts.textContent = `Attempts left: ${attemptsLeft}`;
  guessInput.value = "";
  guessInput.focus();
}

function endGame() {
  document.getElementById("guess-input").disabled = true;
  document.getElementById("submit-btn").disabled = true;
  document.getElementById("play-again").style.display = "inline-block";
}

function restartGame() {
  secretNumber = Math.floor(Math.random() * 100) + 1;
  attemptsLeft = 10;

  document.getElementById("result").textContent = "";
  document.getElementById("attempts").textContent = "Attempts left: 10";

  const guessInput = document.getElementById("guess-input");
  guessInput.disabled = false;
  guessInput.value = "";
  guessInput.focus();

  document.getElementById("submit-btn").disabled = false;
  document.getElementById("play-again").style.display = "none";
}
