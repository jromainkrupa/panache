// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

// Rails functionality
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "controllers";
require("trix")
require("@rails/actiontext")

// Administrate specific functionality


import "src/actiontext"

// ADD YOUR JAVACSRIPT HERE

// Start Rails UJS
Rails.start()
Turbolinks.start()
ActiveStorage.start()
