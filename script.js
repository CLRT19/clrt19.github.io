// Get references to HTML elements
const loginForm = document.getElementById('loginForm');
const loginSection = document.getElementById('loginSection');
const queueSection = document.getElementById('queueSection');
const queueForm = document.getElementById('queueForm');
const queueList = document.getElementById('queueList');
const tutorLoginBtn = document.getElementById('tutorLoginBtn');

// Set the tutor password
const TUTOR_PASSWORD = '1234'; // Change this to a secure password
let isLoggedIn = false;

// Initialize the queue from localStorage or as an empty array
let queue = JSON.parse(localStorage.getItem('mathTutoringQueue')) || [];

// Event listener for the Tutor Login button
tutorLoginBtn.addEventListener('click', function() {
    loginSection.classList.toggle('hidden');
});

// Event listener for the login form submission
loginForm.addEventListener('submit', function(e) {
    e.preventDefault();
    const password = document.getElementById('password').value.trim();
    if (password === TUTOR_PASSWORD) {
        isLoggedIn = true;
        loginSection.classList.add('hidden');
        tutorLoginBtn.classList.add('hidden'); // Hide the Tutor Login button after login
        updateQueueDisplay();
    } else {
        alert('Incorrect password');
    }
});

// Event listener for the queue form submission
queueForm.addEventListener('submit', function(e) {
    e.preventDefault();
    const name = document.getElementById('name').value.trim();
    const topic = document.getElementById('topic').value.trim();
    
    queue.push({ name, topic });
    updateQueueDisplay();
    saveQueue();
    
    queueForm.reset();
});

// Function to update the queue display
function updateQueueDisplay() {
    queueList.innerHTML = '';
    queue.forEach((student, index) => {
        const li = document.createElement('li');
        li.className = 'list-group-item d-flex justify-content-between align-items-center';
        li.textContent = `${index + 1}. ${student.name} - ${student.topic}`;
        
        // Only show the Remove button if the tutor is logged in
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

// Function to remove a student from the queue
function removeStudent(index) {
    if (isLoggedIn) {
        queue.splice(index, 1);
        updateQueueDisplay();
        saveQueue();
    }
}

// Function to save the queue to localStorage
function saveQueue() {
    localStorage.setItem('mathTutoringQueue', JSON.stringify(queue));
}

// Initial display of the queue
updateQueueDisplay();
