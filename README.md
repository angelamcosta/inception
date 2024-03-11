# <img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Animals/Spouting%20Whale.png" alt="Spouting Whale" width="25" height="25" /> Inception
<div align=center>
  
  ![badge](https://raw.githubusercontent.com/angelamcosta/angelamcosta/main/42_badges/inceptionm.png)
</div>

Inception is a a System Administration related exercise. This project involves setting up a small infrastructure composed of various services under specific rules. The entire project will be executed within a virtual machine, and I will be utilizing Docker Compose for the configuration. The subject of the project can be found [here](https://raw.githubusercontent.com/angelamcosta/inception/main/en.subject.pdf).

## 📜 Mandatory Features

-   A Docker container that contains NGINX with TLSv1.2 or TLSv1.3 only.
-   A Docker container that contains WordPress + php-fpm (it must be installed and configured) only without nginx.
-   A Docker container that contains MariaDB only without nginx.
-   A volume that contains your WordPress database.
-   A second volume that contains your WordPress website files.
-   A docker-network that establishes the connection between your containers.

> [!CAUTION]
> The containers musn’t be started with a command running an infinite loop. Thus, this also applies to any command used as entrypoint, or used in entrypoint scripts. The following are a few prohibited hacky patches: `tail -f`, `bash`, `sleep infinity`, `while true`.

## ⭐ Additional Features

-   Set up redis cache for your WordPress website in order to properly manage the cache.
-   Set up a FTP server container pointing to the volume of your WordPress website.
-   Create a simple static website in the language of your choice except PHP (Yes, PHP is excluded!). For example, a showcase site or a site for presenting your resume.
-   Set up Adminer.
-   Set up a service of your choice that you think is useful. During the defense, you
will have to justify your choice.

## Glossary

- [Why can't MYSQL access the aria control file?](https://www.linode.com/community/questions/17989/why-cant-mysql-access-the-aria-control-file)

  ```
  2024-01-16 17:16:26 0 [ERROR] mysqld: Can't lock aria control file '/var/lib/mysql/aria_log_control' for exclusive use, error: 11. Will retry for 30 seconds
  2024-01-16 17:16:56 0 [ERROR] mysqld: Got error 'Could not get an exclusive lock; file is probably in use by another process' when trying to use aria control file '/var/lib/mysql/aria_log_control'
  ```

- [Running the NGINX Server in a Docker Container](https://www.baeldung.com/linux/nginx-docker-container)
