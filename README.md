# <img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/People%20with%20professions/Technologist%20Medium%20Skin%20Tone.png" alt="Technologist Medium Skin Tone" width="25" height="25" /> Inception

<div align=center>
  
  ![badge](https://raw.githubusercontent.com/angelamcosta/angelamcosta/main/42_badges/inceptionn.png)
</div>

Inception is a a System Administration related exercise. This project involves setting up a small infrastructure composed of various services under specific rules. The entire project will be executed within a virtual machine, and I will be utilizing Docker Compose for the configuration. The subject of the project can be found [here](https://raw.githubusercontent.com/angelamcosta/inception/main/en.subject.pdf).

## 📜 Mandatory Features

-   A Docker container that contains NGINX with TLSv1.2 or TLSv1.3 only.
-   A Docker container that contains WordPress + php-fpm (it must be installed and configured) only without nginx.
-   A Docker container that contains MariaDB only without nginx.
-   A volume that contains your WordPress database.
-   A second volume that contains your WordPress website files.
-   A docker-network that establishes the connection between your containers.

## ⭐ Additional Features

-   Set up redis cache for your WordPress website in order to properly manage the cache.
-   Set up a FTP server container pointing to the volume of your WordPress website.
-   Create a simple static website in the language of your choice except PHP (Yes, PHP is excluded!). For example, a showcase site or a site for presenting your resume.
-   Set up Adminer.
-   Set up a service of your choice that you think is useful. During the defense, you
will have to justify your choice.
