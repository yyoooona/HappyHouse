<template>
    <b-card no-body="no-body">
        <b-card-header class="border-0">
            <h3 class="mb-0">공지사항</h3>
        </b-card-header>

        <el-table
            class="table-responsive table"
            header-row-class-name="thead-light"
            :data="projects">

            <el-table-column label="글번호" prop="budget" min-width="140px"></el-table-column>
            <el-table-column label="제목" min-width="310px" prop="name">
                <template v-slot="{row}">
                    <b-media no-body="no-body" class="align-items-center">
                        <b-media-body>
                            <span class="font-weight-600 name mb-0 text-sm">{{row.title}}</span>
                        </b-media-body>
                    </b-media>
                </template>
            </el-table-column>

            <el-table-column label="작성자" min-width="310px" prop="name">
                <template v-slot="{row}">
                    <b-media no-body="no-body" class="align-items-center">
                        <b-media-body>
                            <span class="font-weight-600 name mb-0 text-sm">{{row.title}}</span>
                        </b-media-body>
                    </b-media>
                </template>
            </el-table-column>

            <!-- <el-table-column label="Status" min-width="170px" prop="status"> <template
            v-slot="{row}"> <badge class="badge-dot mr-4" type=""> <i
            :class="`bg-${row.statusType}`"></i> <span class="status"
            :class="`text-${row.statusType}`">{{row.status}}</span> </badge> </template>
            </el-table-column> -->

            <!-- <el-table-column label="작성자" min-width="190px"> <div class="avatar-group">
            <a href="#" class="avatar avatar-sm rounded-circle" data-toggle="tooltip"
            data-original-title="Ryan Tompson"> <img alt="Image placeholder"
            src="img/theme/team-1.jpg"></a> <a href="#" class="avatar avatar-sm
            rounded-circle" data-toggle="tooltip" data-original-title="Romina Hadid"> <img
            alt="Image placeholder" src="img/theme/team-2.jpg"></a> <a href="#"
            class="avatar avatar-sm rounded-circle" data-toggle="tooltip"
            data-original-title="Alexander Smith"> <img alt="Image placeholder"
            src="img/theme/team-3.jpg"></a> <a href="#" class="avatar avatar-sm
            rounded-circle" data-toggle="tooltip" data-original-title="Jessica Doe"> <img
            alt="Image placeholder" src="img/theme/team-4.jpg"></a> </div>
            </el-table-column> -->
            <el-table-column label="작성일시" prop="budget" min-width="140px"></el-table-column>

            <el-table-column label="조회수" prop="completion" min-width="240px">
                <template v-slot="{row}">
                    <div class="d-flex align-items-center">
                        <span class="completion mr-2">{{row.completion}}%</span>
                        <div>
                            <base-progress :type="row.statusType" :value="row.completion"/>
                        </div>
                    </div>
                </template>
            </el-table-column>
        </el-table>

        <b-button id="writeBtn" variant="primary">글쓰기</b-button>

        <b-card-footer class="py-4 d-flex justify-content-end">
            <base-pagination v-model="currentPage" :per-page="10" :total="50"></base-pagination>
        </b-card-footer>
    </b-card>
</template>
<script>
    import projects from './../projects'
    import {Table, TableColumn} from 'element-ui'
    export default {
        name: 'light-table',
        components: {
            [Table.name]: Table,
            [TableColumn.name]: TableColumn
        },
        data() {
            return {projects, currentPage: 1};
        }
    }
</script>
<style>
#writeBtn{
    width:100px;
    height:40px;
}
</style>