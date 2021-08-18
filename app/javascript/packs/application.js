// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

document.addEventListener('DOMContentLoaded', (e)=>{
    document.querySelectorAll('.notification .delete').forEach(button =>{
        button.addEventListener('click', (e)=>{
            e.target.parentElement.remove();
        })
    })
});

const observer = new MutationObserver(mutations_list =>{
    mutations_list.forEach(mutation => {
        mutation.addedNodes.forEach(added_node => {
            if(added_node.querySelector('.delete')){
                const button = added_node.querySelector('.delete');
                button.addEventListener('click', (e) =>{
                    e.target.parentElement.remove();
                    
                })
            }
        });
    });
});

const container = document.documentElement || document.body;
observer.observe(container, { childList: true });