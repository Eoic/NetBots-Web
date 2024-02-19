export const animateSlogan = () => {
    if (location.pathname !== '/') {
        return;
    }

    const wordPool = [
        'thinking',
        'coding',
        'planning',
        'designing'
    ];

    let currentWordIndex = 0;
    const sloganWordElement = document.querySelector('.slogan-word');

    function updateWord() {
        currentWordIndex = (currentWordIndex + 1) % wordPool.length
        sloganWordElement.textContent = `${wordPool[currentWordIndex]}`;
    };

    updateWord();
    setInterval(() => updateWord(), 1500);
};
