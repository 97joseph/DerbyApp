# DerbyNamesService

#### Prerequisite
- Java 8
- Maven 

#### Build and Run
- Clone the project 
- Run command `mvn clean install` to build the project
- Run command `mvn spring-boot:run -Dspring-boot.run.jvmArguments="-DDATASOURCE_URL='<DATASOURCE_URL>' -DDATASOURCE_USERNAME='<DATASOURCE_USERNAME>' -DDATASOURCE_PASSWORD='<DATASOURCE_PASSWORD>'"` to run the application <br/>
<DATASOURCE_URL> :: Database URL (Example: jdbc:mysql://localhost:3306/dbo) <br/>
<DATASOURCE_USERNAME> :: Database username <br/>
<DATASOURCE_PASSWORD> :: Database password
- Ideally the application runs on port `8080` if you want to run it on a specific port add `-Dspring-boot.run.arguments=--server.port=8086` to the above command to run on `8086` or your desired port number 

> Note: This application requires MySQL database with `DerbyNames` and `Leagues` tables created under `dbo` schema. Please see DDL for creation of the required tables and DML for inserting test into them under, `src/resources/sql`

#### Accessing URIs 
`hostname:port/DerbyService/PlayerNames` Fetches list of all player names from the database in JSON format <br/> 
`hostname:port/DerbyService/Leagues` Fetches list of all leagues from the database in JSON format
`hostname:port/DerbyService` Derby Service home page consisting of Get player names and Get leagues buttons

> Assuming the service is running on 8086 exmaple URL will look like this `http://localhost:8086/DerbyService/PlayerNames`, for other URIs you'll be redirected to a 404 page
