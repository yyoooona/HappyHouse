import Vue from "vue";
import Vuex from "vuex";
import axios from "axios";
import router from "../routes/router";

Vue.use(Vuex);

const SERVER_URL = process.env.VUE_APP_SERVER_URL;

export default new Vuex.Store({
    state: {
        accessToken: null,
        userId: "",
        userName: "",
        loginChk: false,
        aptName: "",
        sidoselect: 0,
        gugunselect: 0,
        dongselect: 0,
        sido: [
            {
                sidoCode: 11,
                sidoName: "서울특별시"
            }
        ],
        gugun: [
            {
                gugunCode: 11,
                gugunName: "서울특별시"
            }
        ],
        dong: [
            {
                code: 11,
                dong: "서울특별시"
            }
        ],
        apts: [],
        ranks: []
    },
    getters: {
        getAccessToken(state) {
            if (localStorage.accessToken && typeof localStorage.accessToken != "undefined") 
                return localStorage.accessToken;
            else 
                return state.accessToken;
            }
        ,
        getUserId(state) {
            if (localStorage.userId) 
                return localStorage.userId;
            return state.userId;
        },
        getUserName(state) {
            if (localStorage.userName) 
                return localStorage.userName;
            return state.userName;
        }
    },
    mutations: {
        REGISTER(state, payload) {
            console.log(payload);
        },
        LOGIN(state, payload) {
            console.log(payload);
            if (payload["message"] == "로그인 실패") {
                // this.$router.replace(`/dashboard`);
                this.loginChk = false;
            } else {
                this.loginChk = true;
                state.accessToken = payload["auth-token"];
                state.userId = payload["user-id"];
                state.userName = payload["user-name"];
                localStorage.accessToken = state.accessToken;
                localStorage.userId = state.userId;
                localStorage.userName = state.userName;
            }
        },
        LOGOUT(state) {
            state.accessToken = null;
            state.userId = "";
            state.userName = "";
            localStorage.clear();
            this.loginChk = false;
        },
        GETSIDO(state, payload) {
            state.sido = payload["list"];
        },
        GETGUGUN(state, payload) {
            state.gugun = payload["list"];
        },
        GETDONG(state, payload) {
            state.dong = payload["list"];
        },
        SEARCHDONG(state, payload) {
            state.apts = payload["list"];
        }
    },
    actions: {
        REGISTER(context, model) {
            // axios     .defaults     .headers     .post['Access-Control-Allow-Origin'] =
            // '*';
            return axios
                .post(`${SERVER_URL}/user/register`, model)
                .then((response) => {
                    context.commit("REGISTER", response.data);
                    // axios     .defaults     .headers     .common["auth-token"] = `${response
                    // .data["auth-token"]}`;
                });
        },
        LOGIN(context, user) {
            // axios     .defaults     .headers     .post['Access-Control-Allow-Origin'] =
            // '*';
            return axios
                .post(`${SERVER_URL}/user/login`, user)
                .then((response) => {
                    context.commit("LOGIN", response.data);
                    axios
                        .defaults
                        .headers
                        .common["auth-token"] = `${response
                        .data["auth-token"]}`;
                });
        },
        LOGOUT(context) {
            context.commit("LOGOUT");
            axios
                .defaults
                .headers
                .common["auth-token"] = undefined;
        },
        GETSIDO(context) {
            console.log(SERVER_URL);
            return axios
                .get(`${SERVER_URL}/getSido`)
                .then((response) => {
                    context.commit("GETSIDO", response.data);
                });
        },
        GETGUGUN(context) {
            return axios
                .get(`${SERVER_URL}/getGugunInSido`, {
                    params: {
                        sidoCode: this
                            .state
                            .sido[this.state.selectsido]["sidoCode"]
                    }
                })
                .then((response) => {
                    context.commit("GETGUGUN", response.data);
                });
        },
        GETDONG(context) {
            return axios
                .get(`${SERVER_URL}/getDongInGugun`, {
                    params: {
                        gugunCode: this
                            .state
                            .gugun[this.state.selectgugun]["gugunCode"]
                    }
                })
                .then((response) => {
                    context.commit("GETDONG", response.data);
                });
        },
        SEARCHDONG(context) {
            return axios
                .get(`${SERVER_URL}/getAptInDong`, {
                    params: {
                        dong: this
                            .state
                            .dong[this.state.selectdong]["dong"]
                    }
                })
                .then((response) => {
                    context.commit("SEARCHDONG", response.data);
                });
        }
    },
    modules: {}
});
