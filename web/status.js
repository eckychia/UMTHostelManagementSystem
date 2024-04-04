/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


var modal_wrapper = document.querySelector(".modal_wrapper");
var shadow = document.querySelector(".shadow");
var status = document.getElementById("status").value;

if (status === "Unsuccessful"){
    window.addEventListener("load", function(){
	modal_wrapper.classList.add("active");
    });

}

