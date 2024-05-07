# DevOps Scripting Exercises

## Exercise 1: CPU Usage Monitoring Script

**Objective:** Develop a script that monitors CPU usage on a Unix/Linux system and generates a report with the processes consuming the most CPU resources.

**Steps:**

1. Use the `top` command to obtain information about running processes and their CPU usage.
2. Filter the output of the `top` command to retrieve the processes that are using the most CPU.
3. Save this information to a text file for later review or emailing.

**Tasks**

- Research how to use the `top` command to obtain specific information about CPU usage.
- Write a shell script that runs the `top` command, filters the output, and saves it to a file.
- Add additional functionalities, such as the ability to specify a CPU usage threshold to alert if exceeded.



## Exercise 2: Disk Space Usage Monitoring Script

**Objective:** Develop a script that monitors disk space usage on a Unix/Linux system and notifies if free space falls below a specified threshold.

**Steps:**

1. Use the `df` command to obtain information about available disk space on each mounted filesystem.
2. Analyze the output of `df` to determine the available space on the main filesystem.
3. Compare this available space with a predefined threshold and notify if it falls below that threshold.

**Tasks**

- Research how to use the `df` command to obtain information about available disk space.
- Write a shell script that runs the `df` command, analyzes its output, and notifies if disk space falls below a certain threshold.
- Add options to the script to specify different thresholds based on the filesystem or specific directory.



## Exercise 3: Service Restart Script

**Objective:** Develop a script that automates the restarting of a service on a Unix/Linux system.

**Steps:**

1. Allow the user to specify the name of the service they want to restart as an argument to the script.
2. Check if the service is currently running.
3. If the service is running, stop it and then start it again.
4. If the service is not running, start the service.

**Tasks**

- Research how to check the status of a service using terminal commands (e.g., `systemctl status` on systemd-based systems).
- Write a shell script that accepts the service name as an argument and performs the steps mentioned above.
- Add error handling and clear informative messages for the user.



## Exercise 4: File Backup Script

**Objective:** Create a script that performs automatic backups of specific files and directories.

**Steps:**

1. Allow the user to specify the files or directories they want to back up as arguments to the script.
2. Create a backup folder with a timestamp to clearly identify each backup.
3. Copy the specified files and directories into the backup folder.
4. Compress the backup folder into a tar.gz archive to save space.

**Tasks**

- Research how to use the `tar` command to compress files and directories into a tar.gz archive.
- Write a shell script that accepts the names of files or directories as arguments and performs the steps mentioned above.
- Add additional functionalities, such as the ability to schedule periodic backups using `cron`.



## Exercise 5: Version Bump Script

**Objective:** Develop a script that automatically increments the version number in a file.

**Steps:**

1. Create a file named `version.md` with the current version number of your application.
2. Write a script named `bump_version.sh` that reads the version number from `version.md`, increments it based on a parameter (`major`, `minor`, or `patch`), and updates the file with the new version number.
3. Run the script with a parameter to bump the version number.
4. Verify that the version number in `version.md` has been updated correctly.

**Example:**

Suppose `version.md` contains the following content:

Version: 1.0.0

Running the script `sh bump_version.sh minor` should increment the version number to 1.1.0 and update version.md accordingly.

**Tasks:**

1. Write a script that reads the current version number from version.md.
2. Parse the version number and increment the appropriate part (major, minor, or patch) based on the parameter provided.
3. Update version.md with the new version number.
4. Add error handling to the script to manage cases where the file or version number format is invalid.
