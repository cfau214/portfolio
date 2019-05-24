
function square (number) { 
    return number*number 
}

var app = new Vue({
    el: '#app',
    data: {
        message: 'Test Message'
    }
})

var app2 = new Vue({
    el: '#app2',
    data: {
        myMessage: 'From app2: Square of' + square(3)
    }
})

var para1 = new Vue({
    el: '#para1',
    data: {
        paraMessage: 'From Paragraph1'
    }
})

var title = new Vue({
    el: '#title1',
    data: {
        message: 'Hover over me to see the title!',
        messageTwo: 'Message two'
    }
})

var appTodo = new Vue({
    el: '#appTodo',
    data: {
        todos: [
            { text: 'Learn Javascript' },
            { text: 'Learn Vue' },
            { text: 'Finish M-D AR App' }
        ]
    }
})

let addList = (list) => {
    let count = 0 
    for (i = 0; list.length; i++) {
        count += list[i]
    }
    return count > 6
}

var appIf = new Vue({
    el: '#appIf',
    data: {
        numList: [1,2,3],
        seen: false
    }
})