<template>
    <div>

        <base-header class="pb-6 pb-8 pt-5 pt-md-8 bg-gradient-success">
            <h1 style="color:white;">
                당신의 집을 찾아보세요!
            </h1>
            <br>
            <b-button variant="primary">매물보러가기</b-button>
            <b-button variant="primary">공지사항</b-button>
        </base-header>
        <div>
            <img id="homeImg" :src="myhouse"/>
        </div>

    </div>
</template>
<script>
    // Charts
    import * as chartConfigs from '@/components/Charts/config';

    // Components

    import StatsCard from '@/components/Cards/StatsCard';

    // Tables
    import SocialTrafficTable from './Dashboard/SocialTrafficTable';
    import PageVisitsTable from './Dashboard/PageVisitsTable';

    export default {
        components: {
            StatsCard,
            PageVisitsTable,
            SocialTrafficTable
        },
        data() {
            return {
                myhouse: "../../../img/house.png",
                // bigLineChart: {   allData: [     [0, 20, 10, 30, 15, 40, 20, 60, 60],     [0,
                // 20, 5, 25, 10, 30, 15, 40, 40]   ],   activeIndex: 0,   chartData: {
                // datasets: [       {         label: 'Performance',         data: [0, 20, 10,
                // 30, 15, 40, 20, 60, 60],       }     ],     labels: ['May', 'Jun', 'Jul',
                // 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],   },   extraOptions:
                // chartConfigs.blueChartOptions, }, redBarChart: {   chartData: {     labels:
                // ['Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],     datasets: [{       label:
                // 'Sales',       data: [25, 20, 30, 22, 17, 29]     }]   },   extraOptions:
                // chartConfigs.blueChartOptions }
            };
        },
        create(){
            this.$router.go(this.$router.currentRoute);
        }
        // methods: {   initBigChart(index) {     let chartData = {       datasets: [ {
        // label: 'Performance',           data: this.bigLineChart.allData[index]
        // }       ],       labels: ['May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov',
        // 'Dec'],     }; this.bigLineChart.chartData = chartData;
        // this.bigLineChart.activeIndex = index;   } }, mounted() {
        // this.initBigChart(0); }
    };
</script>
<style>
    #homeImg {
        width: 100%;
    }
    .el-table .cell {
        padding-left: 0;
        padding-right: 0;
    }
</style>