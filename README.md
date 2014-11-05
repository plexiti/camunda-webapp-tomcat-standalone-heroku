# ![Camunda](http://plexiti.github.io/camunda-webapp-tomcat-standalone-heroku/resources/images/camunda.png)&nbsp;camunda BPM for ... <a href="https://heroku.com/deploy"><img align="right" src="https://www.herokucdn.com/deploy/button.png"/></a>

[![Heroku](http://plexiti.github.io/camunda-webapp-tomcat-standalone-heroku/resources/images/heroku.png)][heroku]&nbsp;
[![Tomcat](http://plexiti.github.io/camunda-webapp-tomcat-standalone-heroku/resources/images/tomcat.svg)][tomcat]&nbsp;
[![Postgres](http://plexiti.github.io/camunda-webapp-tomcat-standalone-heroku/resources/images/postgresql.svg)][postgres]

## Deploy camunda BPM standalone on Heroku
 
Either you just push that button... :-)

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

... and you will be asked to decide about the needed camunda BPM version on the next page.

Or if you prefer the command line:

```bash
git clone git@github.com:plexiti/camunda-webapp-tomcat-standalone-heroku.git
cd camunda-webapp-tomcat-standalone-heroku
heroku create --region eu
git push heroku master
heroku open
``` 
That's all there is to it. **Have fun!** Then **star** this repository :-), but also have even more fun and ...

## Deploy a different (than default) version

If you don't want to use the button above, just set the pom.xml property `camunda-bpm.version` - and you 
are done. Or, as a second possibility you can set an environment variable called CAMUNDA_BPM_VERSION:

```bash
heroku config:set CAMUNDA_BPM_VERSION=7.2.0-alpha5
```

The maven build creates a war overlay and uses a defensive xsl:stylesheet to add the postgres 
configuration required for Heroku to camunda's applicationContext. So everything 
*should* continue to work fine, even if that applicationContext changes in the future. If not, please 
report an issue here at GitHub!

<a name="maintainer"/>
## Maintainer

Martin Schimak - [eMail](mailto:martin.schimak@plexiti.com) - [GitHub](https://github.com/martinschimak) - [Blog][plexiti]

<a name="license"/>
## License

[Apache License, Version 2.0][apache-license]

[heroku]: http://www.heroku.com
[tomcat]: http://tomcat.apache.org
[postgres]: http://www.postgresql.org
[plexiti]: http://plexiti.com
[apache-license]: http://www.apache.org/licenses/LICENSE-2.0.html
