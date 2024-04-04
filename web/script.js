/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */

var swiper = new Swiper(".home-slider",{
    grabCursor:true,
    loop: true,
    centeredSlides:true,
    autoplay:{
        delay:2500,
        disableOInteraction:false,
    },
    navigation:{
        nextE1:"swiper-button-next",
        prevE1:"swiper-button-prev",
    },
});

var swiper = new Swiper(".hostel-slider",{
    spaceBetween:20,
    grabCursor:true,
    loop: true,
    centeredSlides:true,
    autoplay:{
        delay:1500,
        disableOInteraction:false,
    },
    navigation:{
        nextE1:"swiper-button-next",
        prevE1:"swiper-button-prev",
    },
    pagination:{
        el:".swiper-pagination",
        clickable:true,
    },
    breakpoints: {
        0:{
            slidesPerView: 1,
        },
         768:{
            slidesPerView: 2,
        },
         991:{
            slidesPerView: 3,
         },
    },
});

var swiper = new Swiper(".gallery-slider",{
    spaceBetween:10,
    grabCursor:true,
    loop: true,
    centeredSlides:true,
    autoplay:{
        delay:1500,
        disableOInteraction:false,
    },
    navigation:{
        nextE1:"swiper-button-next",
        prevE1:"swiper-button-prev",
    },
    pagination:{
        el:".swiper-pagination",
        clickable:true,
    },
    breakpoints: {
        0:{
            slidesPerView: 1,
        },
         768:{
            slidesPerView: 3,
        },
         991:{
            slidesPerView: 4,
         },
    },
});

let accordions = document.querySelectorAll('.faqs .row .content .box');
accordions.forEach(acco=>{
    
    acco.onclick=()=>{
        accordions.forEach(subAcco => {subAcco.classList.remove('active')})
        acco.classList.add('active');
    }
})
