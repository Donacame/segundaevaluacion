
        
        const form = document.querySelector('form') as HTMLFormElement | null;

        if (form) {
            form.addEventListener('submit', (event) => {
                event.preventDefault();

                const nameInput = document.querySelector('#name') as HTMLInputElement | null;
                const emailInput = document.querySelector('#email') as HTMLInputElement | null;
                const messageInput = document.querySelector('#message') as HTMLTextAreaElement | null;

                if (!nameInput || !emailInput || !messageInput) {
                    console.error('Form elements not found');
                    return;
                }

                const name = nameInput.value.trim();
                const email = emailInput.value.trim();
                const message = messageInput.value.trim();

                if (!name) {
                    alert('Por favor, ingresa tu nombre.');
                    return;
                }

                if (!email || !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
                    alert('Por favor, ingresa un correo electrónico válido.');
                    return;
                }

                if (!message) {
                    alert('Por favor, ingresa un mensaje.');
                    return;
                }

                alert('Formulario enviado correctamente.');
                form.reset();
            });
        } else {
            console.error('Form not found in the document.');
        }
    