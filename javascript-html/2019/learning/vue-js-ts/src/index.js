
var app = new Vue({
    el: '#app',
    data: {
        message: 'Test Message'
    }
})

let square = (number) => { return number*number }

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
        message: 'Hover over me to see the title!'
    }
})
