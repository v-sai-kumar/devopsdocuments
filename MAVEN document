Maven
Maven is an Open Source, Java Based,build tool
Sun Micro Systems -> Oracle
build tool.
Oracle Java
Open JDK
IBM JDK
Standalone Applications (jar --> Java Archive) 
Java code 
  jar  --> .classfiles + manifiest files.
Web Applications (war -> Web Archive) 
Java Code + Web Content (HTML/CSS/Java Script/XML/images) 
war = jar files + web content
Enterprise Applications (ear Enterprise Archive) Multiple modules ...
ear = war + jar files + resource files 
JVM- Java Virtual Machine
HelloWorld.java -> Source Code
javac HelloWorld.java
Helloworld.class ---> Byte Code

Maven Dir Structures
-------------------------------------
apache-maven-3.8.4-bin.zip
boot:
bin: Binary files --> mvn
conf:
settings.xml
lib:
jar files

Maven Installations
--------------------------
Maven 3.8.4
Java 8 or Java 1.8
JDK Java Development kit
 JRE Java Runtime Environment
javac
java -version
javac -version
javac  command not found...
mvn-version
ssh -i "devopsjanbatch.pem"ec2-user@ec2-3-111-169-63.ap-south-1.compute.amazonaws.com

/opt/apache-maven-3.8.4-> Home directory

export M2_HOME=/opt/apache-maven-3.8.4 export PATH=$PATH: $M2_HOME/bin

export GRADLE_HOME/Users/mithunreddy/MithunTechnologies/Softwares/Running/gradle-6.6.1
 export PATH=$PATH$GRADLE_HOME/bin

JAVA HOME
M2_HOME
ANT build.xml

Maven -->pom.xml

Gradle -> build.gradle

facebook.amo

Sample content in pom.xml
-----------------------------------------------
Parent Tag/Root tag

<project>

<groupId>com.bt</groupId> 
<artifactId>maven-java-project</artifactId>
<version>0.0.1-SNAPSHOT</version> 
<packaging>jar</packaging>

<dependencies>

<dependency>

<groupId>junit</groupId>

<artifactId>junit</artifactId> <version>3.8.1</version>

<scope>test</scope>

</dependency>

</dependencies>

</project>
TO run the Unit test cases

HelloWorld.java -> Source Code

HelloWorldTest.java -> Unit Test case
mvn package

Maven Repos
--------------------------
1 . Maven Local Repo
~/.m2/repository->Default path for Maven Local Repo

C:\\Users\mithun\.m2\ repository->Windows

/Users/mithun/.m2/repository -->MAC
/home/mithun/.m2/repository-> Linux

Mvn  Home directory
conf/
settings.xml
<localRepository>here keep the path</localRepository>
(Update Maven Local Repository )

Normally, We will change the default local repository folder from default .m2 to another more meaningful name as follows. Find {M2_HOME}\conf\settings.xml, update local Repository to something else.

<!-- localRepository

The path to the local repository maven will use to store artifacts.

| Default: ${user.home}/.m2/repository

<localRepository>/path/to/local/repo</localRepository>
-->
<localRepository>/Users/mithun/custom_maven_repo/</localRepository>

2 .Maven Central Repository
The central repository is the repository provided by the Maven community. "It contains a large repository of commonly used libraries. This repository comes into play when Maven does not find libraries in the local repository.
The central repository can be found at: http://search.maven.org/.
3.Remote Repository
Enterprises usually maintain their own repositories for the libraries that are being used for the project. These differ from the local repository; a repository is maintained on a separate server, different from the developer's machine and is accessible within the organization.
Ex : in organization 
10 jar files --> upload in nexus 
Nexus --> remote repo
jfrog artifactorory

Mvn  Life Cycles
---------------
clean
site
Default
Goals:
clean: It will deletes the previous build files. 
site: It will generates the documentation for the sourcDefault 
validate: It will validates the dir structure and files.
compile: It will compile the source code and junit test cases code.
test: It will run the unit test cases
package: It will creates the package. (jar/war/ear)
install: It will store the build atrifact/ package in Maven Local Repo.
deploy: It will store the build artifact into remote rpo.

mvn clean package  
700  Junit test cases.
699--> passed
1 Failed   -->won't generate package 
mvn clean package
To ignore test cases
mvn clean package -DskipTests ---> unit test cases will be skipped
mvn cleanpackage-Dmaven.test.skip=true--->compile unittests both will be skipped
maven-stanalone-application-0.0.1-SNAPSHOT.jar
AI-Vno.jar
<groupId>com.mt</groupId> <artifactId>maven-web-application</artifactId>

maven-web-application-0.0.1-SNAPSHOT.war

maven-web-application.war
<finalName>maven-web-application</finalName>
 Without war file ear file will.not be there 
To generate a specific module we can use 
mvn clean package -pl MavenEnterpriseApp-web
It will execute only this package and create a .war file 
