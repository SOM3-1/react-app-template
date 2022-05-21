@echo off
title React setup
ECHO ===================================================================================
ECHO Read beolow info before proceeding!

ECHO Hey there, Welcome!
ECHO Hope you have installed nodejs before continuing further, if not then visit https://nodejs.org/en/download/	to install
ECHO These are the following dependencies that'll be installed to configure reacct app, you can edit the file to install any more dependecies
ECHO Dependencies: react, react-dom
ECHO Dev Dependencies: webpack webpack-cli webpack-dev-server @babel/core @babel/preset-react @babel/preset-env
ECHO Loaders and plugin: babel-loader css-loader style-loader html-webpack-plugin svg-inline-loader
ECHO If you modified any dependencies then make sure to configre webpack.configure.js properly.
ECHO And there will be one more pause at the end regarding script setup.

ECHO ===================================================================================
pause
ECHO ===================================================================================
ECHO	creating new folder
ECHO ===================================================================================
mkdir react-app
ECHO ===================================================================================
ECHO	created new folder
ECHO ===================================================================================
cd react-app

ECHO ===================================================================================
ECHO	initialising npm
ECHO ===================================================================================
call npm init -y
ECHO ===================================================================================
ECHO	success
ECHO ===================================================================================
ECHO ===================================================================================
ECHO	installing dependencies
ECHO ===================================================================================
call npm i react react-dom
ECHO ===================================================================================
ECHO	installing dev dependencies
ECHO ===================================================================================
call npm i webpack webpack-cli webpack-dev-server @babel/core @babel/preset-react @babel/preset-env babel-loader css-loader style-loader html-webpack-plugin svg-inline-loader -D
ECHO ===================================================================================
ECHO	dependecies installed, configuring webpack file
ECHO ===================================================================================
type nul > webpack.config.js

echo const path = require("path"); >> webpack.config.js
echo const HtmlWebpackPlugin = require("html-webpack-plugin"); >> webpack.config.js
echo module.exports = { >> webpack.config.js
echo  entry: "./src/index.js", >> webpack.config.js
echo  module: { >> webpack.config.js
echo    rules: [ >> webpack.config.js
echo      { >> webpack.config.js
echo        test: /\.css$/i, >> webpack.config.js
echo        use: ["style-loader", "css-loader"], >> webpack.config.js
echo      }, >> webpack.config.js
echo      { >> webpack.config.js
echo        test: /\.svg$/, >> webpack.config.js
echo        use: "svg-inline-loader", >> webpack.config.js
echo      }, >> webpack.config.js
echo      { >> webpack.config.js
echo        test: /\.(js)$/, >> webpack.config.js
echo        exclude: /node_modules/, >> webpack.config.js
echo        use: { >> webpack.config.js
echo            loader: 'babel-loader', >> webpack.config.js
echo            options:{ >> webpack.config.js
echo            presets: ['@babel/preset-env', '@babel/preset-react'] >> webpack.config.js
echo        }} >> webpack.config.js
echo      }, >> webpack.config.js
echo    ], >> webpack.config.js
echo  }, >> webpack.config.js
echo devtool: 'inline-source-map', >> webpack.config.js
echo devServer: { >> webpack.config.js
echo  static: './dist', >> webpack.config.js
echo  hot: true, >> webpack.config.js
echo  open: true >> webpack.config.js
echo }, >> webpack.config.js
echo output: { >> webpack.config.js
echo    filename: "bundle.js", >> webpack.config.js
echo    path: path.resolve(__dirname, "dist"), >> webpack.config.js
echo  }, >> webpack.config.js
echo  plugins: [new HtmlWebpackPlugin({ >> webpack.config.js
echo        template: './src/index.html' >> webpack.config.js
echo })], >> webpack.config.js
echo  mode: "development", >> webpack.config.js
echo };>> webpack.config.js

ECHO ===================================================================================

mkdir src
cd src
type nul > index.html 
echo ^<html lang="en"^> >> index.html
echo ^<head^> >> index.html
echo    ^<meta charset="UTF-8"^> >> index.html
echo    ^<meta http-equiv="X-UA-Compatible" content="IE=edge"^> >> index.html
echo    ^<meta name="viewport" content="width=device-width, initial-scale=1.0"^> >> index.html
echo    ^<title^>React App^</title^> >> index.html
echo ^</head^> >> index.html
echo ^<body^> >> index.html
echo ^<div id="root"^> ^</div^> >> index.html
echo ^</body^> >> index.html
echo ^</html^> >> index.html

ECHO ===================================================================================

type nul > index.js
echo import ReactDOM from 'react-dom'; >> index.js
echo import React from 'react'; >> index.js

echo import App from './App/App'; >> index.js

echo const root = ReactDOM.createRoot(document.getElementById('root')); >> index.js
echo root.render(^<App /^>); >> index.js

ECHO ===================================================================================

mkdir App
cd App
type nul > App.js
echo import React from 'react'; >>App.js

echo const App = () =^> { >> App.js
echo  return ( >> App.js
echo    ^<^> >> App.js
echo		^<h1^> Welcome stranger!!!! ^</h1^> >> App.js
echo    ^</^> >> App.js
echo  ); >> App.js
echo } >> App.js

echo export default App; >> App.js

ECHO ===================================================================================

cd..
cd..
ECHO ===================================================================================

ECHO Everything configured now!!
ECHO You can update script section in package.json to have a shortcut to run dev server/ bundle like this
ECHO "scripts": {	
ECHO "test": "echo \"Error: no test specified\" && exit 1",	
ECHO "start": "webpack seve",
ECHO "build": "webpack"	
ECHO }

ECHO Well I'll be starting dev server myself now, and naming start/build is upto you. Name it however you want
ECHO To stop it you can press ctrl+c
ECHO Once you add those command you can start dev server by running this command npm run start

ECHO ===================================================================================
pause 

call npx webpack serve


