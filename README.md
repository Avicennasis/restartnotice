# restartnotice

A simple, well-documented shell script that sends an email notification whenever a server reboots. Perfect for monitoring unexpected restarts or confirming scheduled maintenance.

## Features

- **Automatic Notifications** — Emails you immediately when a server restarts.
- **Detailed System Info** — Includes hostname, IP address, uptime, OS, and kernel version.
- **System Logging** — Logs all notification attempts to syslog for auditing.
- **Easy Installation** — Just configure and add to crontab.

## Requirements

- A Linux/Unix system with bash.
- A working mail transfer agent (MTA) such as:
  - [Postfix](http://www.postfix.org/)
  - [msmtp](https://marlam.de/msmtp/)
  - [sendmail](https://www.proofpoint.com/us/products/email-protection/open-source-email-solution)

### Gmail Users

If using Gmail, you'll need to create an **App Password** instead of your regular account password:

1. Enable 2-Step Verification on your Google Account.
2. Go to [App Passwords](https://myaccount.google.com/apppasswords).
3. Generate a new App Password for "Mail" and use it in your MTA configuration.

> **Note:** Google deprecated "Less Secure Apps" access. App Passwords are now required.

## Installation

1. **Clone the repository:**

   ```bash
   git clone https://github.com/Avicennasis/restartnotice.git
   cd restartnotice
   ```

2. **Configure the script:**

   Edit `restartnotice.sh` and update the `RECIPIENT_EMAIL` variable:

   ```bash
   RECIPIENT_EMAIL="your-email@example.com"
   ```

3. **Make the script executable:**

   ```bash
   chmod +x restartnotice.sh
   ```

4. **Add to crontab:**

   ```bash
   crontab -e
   ```

   Add this line (adjust the path to match your installation):

   ```
   @reboot /path/to/restartnotice.sh
   ```

5. **Test the script:**

   Run it manually to verify email delivery:

   ```bash
   ./restartnotice.sh
   ```

## Example Email

When activated, you'll receive an email like this:

```
Server Reboot Notification
==========================

Server "webserver01" has restarted.

Reboot Details:
---------------
  Timestamp:    2026 Jan 03 00:15:30
  Hostname:     webserver01
  IP Address:   192.168.1.100
  Uptime:       up 1 minute
  OS:           Ubuntu 24.04 LTS
  Kernel:       6.8.0-generic
```

## Troubleshooting

- **Email not sending?** — Check your MTA configuration and test with `echo "test" | mail -s "Test" your@email.com`.
- **Check the logs:** — Run `grep restartnotice /var/log/syslog` or `journalctl -t restartnotice`.
- **Permissions issue?** — Ensure cron has execute permissions on the script.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Credits

**Author:** Léon "Avic" Simmons ([@Avicennasis](https://github.com/Avicennasis))
