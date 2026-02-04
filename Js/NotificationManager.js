class NotificationManager {
    constructor(notifications = [], title = "Notifiche", config = {}) {
        this.notifications = Array.isArray(notifications) ? notifications : [];
        this.title = title;  // ← SALVATO QUI!
        this.apiUrl = config.apiUrl || './Api/api-index-notifiche.php';
        this.notificationsPage = config.notificationsPage || '../PHP/notifiche.php';
        this.notifyContainer = null;
    }

    init() {
        this.notifyContainer = document.querySelector('aside .notify');
        if (!this.notifyContainer) return;

        // Crea lista se manca
        if (!this.notifyContainer.querySelector('ul')) {
            this.notifyContainer.innerHTML += '<ul class="notifications-list"></ul>';
        }
        this.notificationsList = this.notifyContainer.querySelector('ul');

        // Imposta titolo iniziale
        const h2 = this.notifyContainer.querySelector('h2');
        if (h2) h2.textContent = this.title;

        this.bindButtons();

        this.render();
    }

    render() {
        if (!this.notificationsList) return;

        const unreadNotifications = this.notifications.filter(n => !n.chiusa).slice(0, 3);
        const unreadCount = this.notifications.filter(n => !n.chiusa).length;

        // AGGIORNA TITOLO CON CONTATORE
        const h2 = document.querySelector('aside .notify h2');
        if (h2) {
            h2.textContent = unreadCount > 0 ? `${this.title} (${unreadCount})` : this.title;
        }

        this.notificationsList.innerHTML = '';

        if (unreadCount === 0) {
            this.notificationsList.innerHTML = '<li style="padding: 12px; color: #888;">Nessuna notifica</li>';
            return;
        }

        unreadNotifications.forEach(notifica => {
            const li = document.createElement('li');
            li.className = 'notification-item';
            li.innerHTML = `
                <p class="notification-text">${notifica.descrizione}</p>
                <button class="notification-close" data-codice="${notifica.codice}">×</button>
            `;
            li.querySelector('.notification-close').addEventListener('click', () => {
                this.closeNotification(notifica.codice);
            });
            this.notificationsList.appendChild(li);
        });
    }

    /* ================= BUTTONS ================= */
    bindButtons() {
        const notifyLi = document.querySelector('aside .notify');
        if (notifyLi && !notifyLi.querySelector('.view-all-notifications')) {
            notifyLi.innerHTML = `
                <div class="notifications-header">
                    <h2>${this.title}</h2>
                    <button class="view-all-notifications" aria-label="Vai alla pagina di tutte le notifiche">
                        Vedi tutte
                    </button>
                </div>
                <ul class="notifications-list"></ul>
            `;
        }

        // Event listener sul bottone
        const viewAllBtn = notifyLi.querySelector('.view-all-notifications');
        if (viewAllBtn) {
            viewAllBtn.addEventListener('click', () => {
                window.location.href = this.notificationsPage;
            });
        }

        this.notificationsList = notifyLi.querySelector('ul');
    }

    async closeNotification(codice) {
        try {
            await fetch(`${this.apiUrl}?codice=${codice}`, { method: 'POST' });
            const notifica = this.notifications.find(n => n.codice === codice);
            if (notifica) notifica.chiusa = 1;
            this.render();
        } catch (error) {
            console.error('Errore:', error);
        }
    }

    updateNotifications(newNotifications) {
        this.notifications = Array.isArray(newNotifications) ? newNotifications : [];
        this.render();
    }
}
