<template>
    <div class="wrapper">
        <notifications></notifications>
        <side-bar>
            <template slot="links">
                <sidebar-item
                    :link="{
            name: 'Dashboard',
            path: '/dashboard',
            icon: 'ni ni-tv-2 text-primary',
          }"></sidebar-item>

                <!-- <sidebar-item :link="{ name: 'Icons', path: '/icons', icon: 'ni ni-planet
                text-blue' }" > </sidebar-item> -->

                <sidebar-item
                    :link="{
                name: 'Maps',
                path: '/maps',
                icon: 'ni ni-pin-3 text-orange'
              }"></sidebar-item>

                <!-- <sidebar-item :link="{ name: 'User Profile', path: '/profile', icon: 'ni
                ni-single-02 text-yellow' }"> </sidebar-item> -->

                <sidebar-item
                    :link="{
                  name: 'Tables',
                  path: '/tables',
                  icon: 'ni ni-bullet-list-67 text-red'
                }"></sidebar-item>

                <div v-if="getAccessToken">
                    <sidebar-item
                        :link="{
                    name: 'MyPage',
                    path: '/mypage',
                    icon: 'ni ni-key-25 text-info'
                  }"></sidebar-item>
                    <!-- <sidebar-item
                        :link="{
                    name: 'Logout',
                    path: '/dashboard',
                    icon: 'ni ni-key-25 text-info'
                  }" @click="onClickLogout"></sidebar-item> -->
                    <!-- <sidebar-item> <button type="button" variant="primary" class="m-1"
                    @click="onClickLogout">Logout</button> -->
                    <!-- @click="onClickLogout" :link="{ name: 'Logout', icon: 'ni ni-tv-2
                    text-primary', }"> -->
                    <!-- </sidebar-item> -->
                    <!-- <sidebar-item> <b-button type="button" variant="primary" class="m-1"
                    @click="onClickLogout">Logout</b-button > </sidebar-item> -->
                    <!-- <sidebar-item @click="onClickLogout">로그아웃</sidebar-item> -->
                </div>
                <div v-else>
                    <sidebar-item
                        :link="{
                    name: 'Login',
                    path: '/login',
                    icon: 'ni ni-key-25 text-info'
                  }"></sidebar-item>
                    <sidebar-item
                        :link="{
                    name: 'Register',
                    path: '/register',
                    icon: 'ni ni-circle-08 text-pink'
                  }"></sidebar-item>
                </div>
                <!-- <sidebar-item> <router-link to="/login">로그인</router-link> </sidebar-item >
                <sidebar-item> <router-link to="/register">회원가입</router-link> </sidebar-item >
                -->
            </template>

            <!-- <template slot="links-after"> <hr class="my-3"> <h6 class="navbar-heading
            p-0 text-muted">Documentation</h6> <b-nav class="navbar-nav mb-md-3">
            <b-nav-item
            href="https://www.creative-tim.com/learning-lab/bootstrap-vue/quick-start/argon-dashboard"
            > <i class="ni ni-spaceship"></i> <b-nav-text class="p-0">Getting
            started</b-nav-text> </b-nav-item> <b-nav-item
            href="https://www.creative-tim.com/learning-lab/bootstrap-vue/colors/argon-dashboard">
            <i class="ni ni-palette"></i> <b-nav-text class="p-0">Foundation</b-nav-text>
            </b-nav-item> <b-nav-item
            href="https://www.creative-tim.com/learning-lab/bootstrap-vue/avatar/argon-dashboard">
            <i class="ni ni-ui-04"></i> <b-nav-text class="p-0">Components</b-nav-text>
            </b-nav-item> </b-nav> </template> -->
        </side-bar>
        <div class="main-content">
            <dashboard-navbar :type="$route.meta.navbarType"></dashboard-navbar>

            <div @click="$sidebar.displaySidebar(false)">
                <fade-transition :duration="200" origin="center top" mode="out-in">
                    
                    <router-view></router-view>
                </fade-transition>
            </div>
            <!-- <content-footer v-if="!$route.meta.hideFooter"></content-footer> -->
        </div>
    </div>
</template>
<script>
    /* eslint-disable no-new */
    import PerfectScrollbar from 'perfect-scrollbar';
    import 'perfect-scrollbar/css/perfect-scrollbar.css';

    function hasElement(className) {
        return document
            .getElementsByClassName(className)
            .length > 0;
    }

    function initScrollbar(className) {
        if (hasElement(className)) {
            new PerfectScrollbar(`.${className}`);
        } else {
            // try to init it later in case this component is loaded async
            setTimeout(() => {
                initScrollbar(className);
            }, 100);
        }
    }

    import DashboardNavbar from './DashboardNavbar.vue';
    // import ContentFooter from './ContentFooter.vue';
    import DashboardContent from './Content.vue';
    import {FadeTransition} from 'vue2-transitions';

    //mapGetters 등록
    import { mapGetters } from "vuex";
    import SidebarItem from '../../components/SidebarPlugin/SidebarItem.vue';

    export default {
        data() {
            return {isLogin: false};
        },
        computed: {
            ...mapGetters(["getAccessToken", "getUserId", "getUserName"])
        },
        components: {
            DashboardNavbar,
            // ContentFooter,
            DashboardContent,
            FadeTransition,
            SidebarItem
        },
        methods: {
            initScrollbar() {
                let isWindows = navigator
                    .platform
                    .startsWith('Win');
                if (isWindows) {
                    initScrollbar('sidenav');
                }
            }
            // onClickLogout() {
            //     this
            //         .$store
            //         .dispatch("LOGOUT")
            //         .then(() => location.reload());
            // }
        },
        mounted() {
            this.initScrollbar()
        }
    };
</script>
<style lang="scss"></style>