import Vue from 'vue'
import VueRouter from 'vue-router'
import SubmitResume from '../../WEB-INF/jsp/submitResume.jsp'

Vue.use(VueRouter)

export default new VueRouter({
    routes:[
        {
            path: '/resume/submitResume',
            name: 'submitResume',
            component: SubmitResume
        }
    ]
})
