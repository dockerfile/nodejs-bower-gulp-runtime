#
# Node.js w/ Bower & Gulp runtime Dockerfile
#
# https://github.com/dockerfile/nodejs-bower-gulp-runtime
#

# Pull base image.
FROM dockerfile/nodejs-bower-gulp

# Set instructions on build.
ONBUILD ADD package.json /app/
ONBUILD RUN npm install
ONBUILD ADD bower.json /app/
ONBUILD RUN bower install --allow-root
ONBUILD ADD . /app
ONBUILD RUN gulp build

# Define working directory.
WORKDIR /app

# Define default command.
CMD ["npm", "start"]

# Expose ports.
EXPOSE 8080
