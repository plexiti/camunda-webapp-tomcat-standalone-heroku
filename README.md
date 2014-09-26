# ![Camunda](http://plexiti.github.io/camunda-webapp-tomcat-standalone-heroku/resources/images/camunda.png)&nbsp;camunda BPM Standalone - for ...

![Heroku](http://plexiti.github.io/camunda-webapp-tomcat-standalone-heroku/resources/images/heroku.png)&nbsp;
![Tomcat](http://plexiti.github.io/camunda-webapp-tomcat-standalone-heroku/resources/images/tomcat.svg)&nbsp;
![Postgres](http://plexiti.github.io/camunda-webapp-tomcat-standalone-heroku/resources/images/postgresql.svg)

## How to deploy camunda BPM Standalone on Heroku/Tomcat/Postgres? 

```bash
git clone git@github.com:plexiti/camunda-webapp-tomcat-standalone-heroku.git
cd camunda-webapp-tomcat-standalone-heroku
heroku create --region eu
git push heroku master
heroku open
``` 
That's all there is to it. **Have fun!** Then **star** this repository :-), but also have even more fun ...

## ... and deploy another version of camunda BPM

Just set the pom.xml property camunda-bpm-version - and you are done.

The maven build creates a war overlay and uses a defensive xsl:stylesheet to add the postgres 
configuration required for Heroku to camunda's applicationContext. So everything 
*should* continue to work fine, even if that applicationContext changes in the future. If not, please 
report an issue here at GitHub!
