const loginForm = document.getElementById('loginForm');
const loginSection = document.getElementById('loginSection');
const queueSection = document.getElementById('queueSection');
const queueForm = document.getElementById('queueForm');
const queueList = document.getElementById('queueList');

const TUTOR_PASSWORD = 'your_secure_password_here'; // Change this to a secure password
let isLoggedIn = false;

// Check if there's a stored queue, otherwise initialize an empty one
let queue = JSON.parse(localStorage.getItem('mathTutoringQueue')) || [];

loginForm.addEventListener('submit', function(e) {
    e.preventDefault();
    const password = document.getElementById('password').value;
    if (password === TUTOR_PASSWORD) {
        isLoggedIn = true;
        loginSection.classList.add('hidden');
        queueSection.classList.remove('hidden');
        updateQueueDisplay();
    } else {
        alert('Incorrect password');
    }
});

queueForm.addEventListener('submit', function(e) {
    e.preventDefault();
    const name = document.getElementById('name').value;
    const topic = document.getElementById('topic').value;
    
    queue.push({ name, topic });
    updateQueueDisplay();
    saveQueue();
    
    queueForm.reset();
});

function updateQueueDisplay() {
    queueList.innerHTML = '';
    queue.forEach((student, index) => {
        const li = document.createElement('li');
        li.className = 'list-group-item d-flex justify-content-between align-items-center';
        li.textContent = `${index + 1}. ${student.name} - ${student.topic}`;
        
        if (isLoggedIn) {
            const removeBtn = document.createElement('button');
            removeBtn.textContent = 'Remove';
            removeBtn.className = 'btn btn-danger btn-sm';
            removeBtn.onclick = () => removeStudent(index);
            li.appendChild(removeBtn);
        }
        
        queueList.appendChild(li);
    });
}

function removeStudent(index) {
    if (isLoggedIn) {
        queue.splice(index, 1);
        updateQueueDisplay();
        saveQueue();
    }
}

function saveQueue() {
    localStorage.setItem('mathTutoringQueue', JSON.stringify(queue));
}

// Initial queue display
updateQueueDisplay();