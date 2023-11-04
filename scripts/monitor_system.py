import psutil
import smtplib
from email.mime.text import MIMEText
import time

# Get CPU usage as a percentage
cpu_percentage = psutil.cpu_percent()

# Get memory usage statistics
mem_stats = psutil.virtual_memory()
mem_total = mem_stats.total
mem_used = mem_stats.used
mem_percentage = mem_stats.percent

# Get disk usage statistics for the root partition
disk_stats = psutil.disk_usage('/')
disk_total = disk_stats.total
disk_used = disk_stats.used
disk_percentage = disk_stats.percent

# Print out the metrics
print(f"CPU usage: {cpu_percentage}%")
print(f"Memory usage: {mem_used / 1024 / 1024:.2f} MB / {mem_total / 1024 / 1024:.2f} MB ({mem_percentage}%)")
print(f"Disk usage: {disk_used / 1024 / 1024:.2f} MB / {disk_total / 1024 / 1024:.2f} MB ({disk_percentage}%)")

def monitor_cpu_threshold(threshold_percentage = 90):
    if cpu_percentage > threshold_percentage:
        send_alert_email(f"High CPU Usage Alert: {cpu_percentage}%")

def monitor_mem_threshold(threshold_percentage = 90):
    if mem_percentage > threshold_percentage:
        send_alert_email(f"High Memory Usage Alert: {mem_percentage}%")

def monitor_disk_threshold(threshold_percentage = 90):
    if disk_percentage > threshold_percentage:
        send_alert_email(f"High Disk Usage Alert: {disk_percentage}%")

def send_alert_email(message):
    sender_email = "your_email@gmail.com"
    receiver_email = "recipient_email@gmail.com"
    email_password = "your_email_password"

    server = smtplib.SMTP("smtp.gmail.com", 587)
    server.starttls()
    server.login(sender_email, email_password)

    subject = "System Monitoring Alert"
    body = message
    msg = MIMEText(body)
    msg["Subject"] = subject
    msg["From"] = sender_email
    msg["To"] = receiver_email

    server.sendmail(sender_email, receiver_email, msg.as_string())
    server.quit()

# Set the monitoring interval to 5 minutes
monitoring_interval = 300

# Monitor the system at the specified interval
# The monitoring will continue indefinitely as long as script is running
while True:
    monitor_cpu_threshold()
    monitor_mem_threshold()
    monitor_disk_threshold()
    time.sleep(monitoring_interval)