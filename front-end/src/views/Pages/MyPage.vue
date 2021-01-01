<template>
    <div>
        <base-header class="pb-6 pb-8 pt-5 pt-md-8 bg-gradient-success">
            <!-- <h1 style="color:white;"> 당신의 집을 찾아보세요! </h1> <br> <b-button
            variant="primary">매물보러가기</b-button> <b-button variant="primary">공지사항</b-button>
            </base-header> -->
            <!-- <div> <img id="homeImg" :src="myhouse"/> </div> -->

            <b-jumbotron>
                <template>My Page</template>

                <b-container class="mt-4">
                    <b-row>
                        <b-col cols="4" align-self="start">{{ user }}님 환영합니다.</b-col>
                        <b-col cols="2"><button variant="primary" @click="onClickLogout">Logout</button></b-col>
                    </b-row>
                </b-container>

            </b-jumbotron>
        </base-header>
    </div>
</template>
<script>
    import Vue from "vue";
    import {BootstrapVue, IconsPlugin} from "bootstrap-vue";

    Vue.use(BootstrapVue);
    Vue.use(IconsPlugin);

    import "bootstrap/dist/css/bootstrap.css";
    import "bootstrap-vue/dist/bootstrap-vue.css";

    //mapGetters 등록
    import {mapGetters} from "vuex";

    var user;
    console.log(localStorage.userName);
    user = localStorage.userName;

    export default {
        // components: {     StatsCard,     PageVisitsTable,     SocialTrafficTable },
        // data() {     return {myhouse: "../../../img/house.png"}; },
        computed: {
            ...mapGetters(["getAccessToken", "getUserId", "getUserName"])
        },
        methods: {

            // this.$router.replace(`/dashboard`); this.loginChk = false;
            onClickLogout() {
                // localStorage.clear();
                this
                    .$store
                    .dispatch("LOGOUT")
                    .then(() => this.$router.replace(`/dashboard`));
                    // replace(`/dashboard`));
                // .then(() => location.reload(true));
            }
        }
    };
</script>
<style>
    /* #homeImg {
            width: 100%;
        }
        .el-table .cell {
            padding-left: 0;
            padding-right: 0;
        } */
</style>