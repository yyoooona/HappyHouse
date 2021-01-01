<template>
    <base-header class="pb-6 pb-8 pt-5 pt-md-8 bg-gradient-success">
        <div id="searchDiv">
            <h1 style="color:white;">
                실거래가 상세정보
            </h1>

            <br>
                <!-- <b-button variant="primary">아파트별 검색</b-button> <b-button
                variant="primary">동별 검색</b-button> -->

                <select
                    v-model="sidoselect"
                    v-on:change="changeSido"
                    id="sidoselect"
                    name="sidoList">
                    <option value="0">선택</option>
                    <option v-for="sido in sidos" v-bind:key="sido.sidoCode">
                        {{ sido.sidoName }}
                    </option>
                </select>

                <select
                    v-model="gugunselect"
                    v-on:change="changeGugun"
                    id="gugunselect"
                    name="gugunList">
                    <option value="0">선택</option>
                    <option v-for="gugun in guguns" v-bind:key="gugun.gugunName">
                        {{ gugun.gugunName }}
                    </option>
                </select>
                <select
                    v-model="dongselect"
                    v-on:change="changeDong"
                    id="dongselect"
                    name="dongList">
                    <option value="0">선택</option>
                    <option v-for="dong in dongs" v-bind:key="dong.dong">
                        {{ dong.dong }}
                    </option>
                </select>
                <!-- <h3>구군 : </h3> <b-form-select v-model="gugunSelect"
                :options="options"></b-form-select> <h3>읍면동 : </h3> <b-form-select
                v-model="dongSelect" :options="options"></b-form-select> -->
            </div>
            <!-- <b-form-select v-model="selected" :options="options" size="sm"
            class="mt-3"></b-form-select> -->
            <!-- <b-form-select v-model="sido_name" :options="options"></b-form-select> -->
            <!-- <b-form-select v-model="gugun_name" :options="options"></b-form-select>
            <b-form-select v-model="dong" :options="options"></b-form-select> -->

            <!-- Selected: <strong>{{ sido_name }}</strong> -->
            <!-- <div class="mt-3">Selected: <strong>{{ gugun_name }}</strong></div> <div
            class="mt-3">Selected: <strong>{{ dong }}</strong></div> -->
            <br>
                <table
                    class="table table-hover"
                    style="width: 80%; margin-left: auto; margin-right: auto;">
                    <thead>
                        <tr>
                            <th>번호</th>
                            <th>법정동</th>
                            <th>아파트이름</th>
                            <th>지번</th>
                            <th>지역코드</th>
                            <th>실거래가</th>
                        </tr>
                    </thead>
                    <tbody id="searchResult">
                        <tr
                            v-for='(apt,index) in $store.state.apts'
                            :key='index'
                            :apts='$store.state.apts'>
                            <td>{{ apt.house_no }}</td>
                            <td>{{ apt.dong }}</td>
                            <td>{{ apt.aptName }}</td>
                            <td>{{ apt.jibun }}</td>
                            <td>{{ apt.code }}</td>
                            <td>{{ apt.dealAmount }}</td>
                        </tr>
                    </tbody>
                </table>

                <div id="app">
                    <div style="height:10px;"></div>
                    <div id="map"></div>
                </div>
            </base-header>
</template>

        <script>
            export default {
                data() {
                    return {
                        sidoselect: "선택",
                        gugunselect: "선택",
                        dongselect: "선택",
                        sidos: [
                            {
                                sidoCode: 0,
                                sidoName: '선택'
                            }
                        ],
                        guguns: [
                            {
                                gugunCode: 0,
                                gugunName: '선택'
                            }
                        ],
                        dongs: [
                            {
                                code: 0,
                                dong: '선택'
                            }
                        ]
                    };
                },
                mounted() {
                    if (window.kakao && window.kakao.maps) {
                        this.initMap();
                    } else {
                        const script = document.createElement('script');
                        /* global kakao */
                        script.onload = () => kakao
                            .maps
                            .load(this.initMap);
                        script.src = 'http://dapi.kakao.com/v2/maps/sdk.js?autoload=false&appkey=195435a07468b8970e4' +
                                '24ff1e357290b';
                        document
                            .head
                            .appendChild(script);
                    }
                },
                methods: {
                    changeSido: function () {
                        this.$store.state.sidoselect = this
                            .sidos
                            .findIndex(i => i.sidoName == this.sidoselect);
                        this
                            .$store
                            .dispatch("GETGUGUN")
                            .then(() => {
                                this.guguns = this.$store.state.gugun;
                            })
                    },
                    changeGugun: function () {
                        this.$store.state.gugunselect = this
                            .guguns
                            .findIndex(i => i.gugunName == this.gugunselect);
                        this
                            .$store
                            .dispatch("GETDONG")
                            .then(() => {
                                this.dongs = this.$store.state.dong;
                            })
                    },
                    changeDong: function () {
                        this.$store.state.dongselect = this
                            .dongs
                            .findIndex(i => i.dong == this.dongselect);
                        console.log(this.$store.state.dongselect["dong"]);
                        "$EventBus.$emit('click-icon')"
                    },
                    initMap() {
                        var container = document.getElementById('map');
                        var options = {
                            center: new kakao
                                .maps
                                .LatLng(33.450701, 126.570667),
                            level: 3
                        };

                        var map = new kakao
                            .maps
                            .Map(container, options);
                        map.setMapTypeId(kakao.maps.MapTypeId.HYBRID);
                    }
                },
                computed: {
                    selected: function () {
                        return this.$store.state.dongselect;
                    }
                },
                watch: {
                    selected: function () {
                        this
                            .$store
                            .dispatch("SEARCHDONG")
                            .then(() => {})
                    }
                },
                created() {
                    this
                        .$store
                        .dispatch("GETSIDO")
                        .then(() => this.sidos = this.$store.state.sido)
                }
            }
        </script>

        <style>

            #searchDiv {
                text-align: center;
                margin: 0 auto;
            }
            #map {
                width: 100%;
                height: 500px;
            }
        </style>