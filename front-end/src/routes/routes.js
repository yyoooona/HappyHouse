import DashboardLayout from '@/views/Layout/DashboardLayout.vue';
import AuthLayout from '@/views/Pages/AuthLayout.vue';

import NotFound from '@/views/NotFoundPage.vue';

const routes = [
  {
    path: '/',
    redirect: 'dashboard',
    component: DashboardLayout,
    children: [
      {
        path: '/dashboard',
        name: 'MAIN',
        // route level code-splitting
        // this generates a separate chunk (about.[hash].js) for this route
        // which is lazy-loaded when the route is visited.
        component: () => import(/* webpackChunkName: "demo" */ '../views/Dashboard.vue')
      },
      // {
      //   path: '/icons',
      //   name: 'icons',
      //   component: () => import(/* webpackChunkName: "demo" */ '../views/Icons.vue')
      // },
      // {
      //   path: '/profile',
      //   name: 'profile',
      //   component: () => import(/* webpackChunkName: "demo" */ '../views/Pages/UserProfile.vue')
      // },
      {
        path: '/maps',
        name: 'MAPS',
        component: () => import(/* webpackChunkName: "demo" */ '../views/KakaoMaps.vue')
      },
      {
        path: '/tables',
        name: 'NOTICE',
        component: () => import(/* webpackChunkName: "demo" */ '../views/RegularTables.vue')
      },
      {
        path: '/mypage',
        name: 'MYPG',
        component: () => import(/* webpackChunkName: "demo" */ '../views/Pages/MyPage.vue')
      }
    ]
  },
  {
    path: '/',
    redirect: 'login',
    component: AuthLayout,
    children: [
      {
        path: '/login',
        name: 'login',
        component: () => import(/* webpackChunkName: "demo" */ '../views/Pages/Login.vue')
      },
      {
        path: '/register',
        name: 'register',
        component: () => import(/* webpackChunkName: "demo" */ '../views/Pages/Register.vue')
      },
      { path: '*', component: NotFound }
    ]
  }
];

export default routes;
