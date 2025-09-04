export function createConfetti(isCorrect: boolean) {
  const colors = isCorrect 
    ? ['#16a34a', '#86efac', '#dcfce7', '#22c55e'] // Green colors for correct
    : ['#dc2626', '#fca5a5', '#fee2e2', '#ef4444']; // Red colors for incorrect
  
  const confettiCount = isCorrect ? 50 : 30;
  
  for (let i = 0; i < confettiCount; i++) {
    createConfettiPiece(colors);
  }
}

function createConfettiPiece(colors: string[]) {
  const confetti = document.createElement('div');
  confetti.style.position = 'fixed';
  confetti.style.width = '10px';
  confetti.style.height = '10px';
  confetti.style.backgroundColor = colors[Math.floor(Math.random() * colors.length)];
  confetti.style.left = Math.random() * 100 + 'vw';
  confetti.style.top = '-10px';
  confetti.style.zIndex = '9999';
  confetti.style.borderRadius = Math.random() > 0.5 ? '50%' : '0';
  confetti.style.pointerEvents = 'none';
  
  document.body.appendChild(confetti);
  
  const animationDuration = 3000 + Math.random() * 2000;
  const rotation = Math.random() * 360;
  const horizontalMovement = (Math.random() - 0.5) * 200;
  
  confetti.animate([
    {
      transform: `translateY(0px) translateX(0px) rotate(0deg)`,
      opacity: 1
    },
    {
      transform: `translateY(100vh) translateX(${horizontalMovement}px) rotate(${rotation}deg)`,
      opacity: 0
    }
  ], {
    duration: animationDuration,
    easing: 'cubic-bezier(0.25, 0.46, 0.45, 0.94)'
  });
  
  setTimeout(() => {
    if (confetti.parentNode) {
      confetti.parentNode.removeChild(confetti);
    }
  }, animationDuration);
}