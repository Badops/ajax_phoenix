// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

// import socket from "./socket"

$(document).ready(function(){
  $("#ajax-query-all-orders").click(function(){
    $.ajax({
      type: "GET", 
      url: "/orders", 
      async: true,
      processData: false,
      contentType: false,
      success: function(response){
        $("#ajax-query-response").empty();        
        var orders = response.data
        var index;
        for(index = 0; index < orders.length; index++ ){
          var order = orders[index];
          $("#ajax-query-response").append(
            `<p> Name: ${order.name}, Title: ${order.item}</p>`
          );
        }
      }
    });
  });

  $("#ajax-query-order").click(function(){
    $.ajax({
      type: "GET",
      url: "/orders?query=" + $("#query-input").val(),
      async: true,
      processData: false,
      contentType: false, 
      success: function(response){
        if (typeof(response) == "string"){
          $("#ajax-query-order-response").empty(); 
          $("#ajax-query-order-response").append(
            `<p> ${response} </p>`
          )
        } else {
          $("#ajax-query-order-response").empty(); 
          $("#ajax-query-order-response").append(
            `<p> Name: ${response.data.name}, Title: ${response.data.item}</p>`
          );
        }
      }
    })
  })
});