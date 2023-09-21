// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

import "jquery"
import "@hotwired/turbo-rails"
import "controllers"
import "require materialize"

$(document).on("turbo:load", function () {
    $(".dropdown-trigger").dropdown();
    $("#fade-out-target").fadeOut(5000);
});