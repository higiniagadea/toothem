Pasos para la instalación del entorno.
```
  git clone git@github.com:higiniagadea/toothem.git
  
  cd toothem/

  rvm install ruby-1.8.7-p374

  rvm use --create ruby-1.8.7-p374@toothem

  bundle

  gem update --system 1.6.2

  rake db:create

  rake db:migrate

  ruby script/server
```
holaaa
