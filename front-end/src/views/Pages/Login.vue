<template>
    <div>
        <!-- Header -->
        <div class="header bg-gradient-success py-7 py-lg-8 pt-lg-9">
            <b-container>
                <div class="header-body text-center mb-7">
                    <b-row class="justify-content-center">
                        <b-col xl="5" lg="6" md="8" class="px-5">
                            <h1 class="text-white">환영합니다!</h1>
                            <p class="text-lead text-white">로그인하고 서비스를 이용해주세요.</p>
                        </b-col>
                    </b-row>
                </div>
            </b-container>
            <div class="separator separator-bottom separator-skew zindex-100">
                <svg
                    x="0"
                    y="0"
                    viewBox="0 0 2560 100"
                    preserveAspectRatio="none"
                    version="1.1"
                    xmlns="http://www.w3.org/2000/svg">
                    <polygon class="fill-default" points="2560 0 2560 100 0 100"></polygon>
                </svg>
            </div>
        </div>
        <!-- Page content -->
        <b-container class="mt--8 pb-5">
            <b-row class="justify-content-center">
                <b-col lg="5" md="7">
                    <b-card no-body="no-body" class="bg-secondary border-0 mb-0">
                        <!-- <b-card-header class="bg-transparent pb-5" > <div class="text-muted
                        text-center mt-2 mb-3"><small>Sign in with</small></div> <div class="btn-wrapper
                        text-center"> <a href="#" class="btn btn-neutral btn-icon"> <span
                        class="btn-inner--icon"><img src="img/icons/common/github.svg"></span> <span
                        class="btn-inner--text">Github</span> </a> <a href="#" class="btn btn-neutral
                        btn-icon"> <span class="btn-inner--icon"><img
                        src="img/icons/common/google.svg"></span> <span
                        class="btn-inner--text">Google</span> </a> </div> </b-card-header> -->
                        <b-card-body class="px-lg-5 py-lg-5">
                            <b-form>
                                <b-form-group label="아이디:" label-for="userid">
                                    <b-form-input
                                        id="userid"
                                        v-model="user.user_id"
                                        required="required"
                                        placeholder="아이디 입력...."></b-form-input>
                                </b-form-group>
                                <b-form-group label="비밀번호:" label-for="userpwd">
                                    <b-form-input
                                        type="password"
                                        id="userpwd"
                                        v-model="user.user_password"
                                        required="required"
                                        placeholder="비밀번호 입력...."
                                        @keypress.enter="login"></b-form-input>
                                </b-form-group>
                                <b-button type="button" variant="primary" class="m-1" @click="login">로그인</b-button >
                                <!-- <b-button type="button" variant="success" class="m-1" >회원가입</b-button > -->
                            </b-form>
                            <!-- <div class="text-center text-muted mb-4"> <small>Or sign in with
                            credentials</small> </div> -->
                            <!-- <validation-observer v-slot="{handleSubmit}" ref="formValidator"> <b-form
                            role="form" @submit.prevent="handleSubmit(onSubmit)"> <base-input alternative
                            class="mb-3" name="id" :rules="{required: true, id: true}" prepend-icon="ni
                            ni-email-83" placeholder="id" v-model="model.id"> </base-input> <base-input
                            alternative class="mb-3" name="Password" :rules="{required: true, min: 6}"
                            prepend-icon="ni ni-lock-circle-open" type="password" placeholder="Password"
                            v-model="model.password"> </base-input> <b-form-checkbox
                            v-model="model.rememberMe">Remember me</b-form-checkbox> <div
                            class="text-center"> <base-button type="primary" native-type="submit"
                            class="my-4">Sign in</base-button> </div> </b-form> </validation-observer> -->
                        </b-card-body>
                    </b-card>
                    <b-row class="mt-3">
                        <b-col cols="6">
                            <!-- <router-link to="/dashboard" class="text-light"><small>Forgot
                            password?</small></router-link> -->
                        </b-col>
                        <b-col cols="6" class="text-right">
                            <router-link to="/register" class="text-light">
                                <small>Create new account</small>
                            </router-link>
                        </b-col>
                    </b-row>
                </b-col>
            </b-row>
        </b-container>
    </div>
</template>
<script>

    import Vue from "vue";
    import VueRouter from "vue-router";
    Vue.use(VueRouter);

    export default {
        name: "Login",
        data: function () {
            return {
                user: {
                    user_id: "",
                    user_password: ""
                },
                message: ""
            };
        },
        computed: {
            nextRoute() {
                return this.$route.params.nextRoute
                    ? this.$route.params.nextRoute
                    : "";
            }
        },
        methods: {
            login: function () {
                // LOGIN 액션 실행 서버와 통신(axios)을 해 토큰값을 얻어야 하므로 Actions를 호출.
                this
                    .$store
                    .dispatch("LOGIN", this.user)
                    .then(() => (this.$store.state.loginChk == true)?this.$router.replace(`/${this.nextRoute}`):
                      this.$router.replace(`/dashboard`)
                    )
                    .catch(({message}) => (this.msg = message));
            }
        }
    };
</script>