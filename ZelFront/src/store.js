import Vue from 'vue';
import Vuex from 'vuex';

const config = require('../../ZelBack/config/default');
const userconfig = require('../../config/userconfig');

Vue.use(Vuex);

export default new Vuex.Store({
  strict: true,
  state: {
    userconfig: {
      zelid: userconfig.initial.zelid,
      externalip: userconfig.initial.ipaddress,
      cruxid: userconfig.initial.cruxid,
      kadena: userconfig.initial.kadena,
      testnet: userconfig.initial.testnet,
    },
    config: {
      apiPort: config.server.apiport,
      fluxTeamZelId: config.fluxTeamZelId,
    },
    privilage: 'none', // user, admin, fluxteam
    daemonSection: 'welcomeinfo',
    benchmarkSection: null,
    nodeSection: null,
    adminSection: null,
    appsSection: null,
    explorerSection: null,
    dashboardSection: null,
    fluxVersion: '',
  },
  getters: {
  },
  mutations: {
    setPrivilage(state, privilage) {
      state.privilage = privilage;
    },
    setDaemonSection(state, section) {
      state.daemonSection = section;
      // we always want to reset the other sections to null state
      state.benchmarkSection = null;
      state.nodeSection = null;
      state.adminSection = null;
      state.appsSection = null;
      state.explorerSection = null;
      state.dashboardSection = null;
    },
    setBenchmarkSection(state, section) {
      state.benchmarkSection = section;
      // we always want to reset the other sections to null state
      state.daemonSection = null;
      state.nodeSection = null;
      state.adminSection = null;
      state.appsSection = null;
      state.explorerSection = null;
      state.dashboardSection = null;
    },
    setNodeSection(state, section) {
      state.nodeSection = section;
      // we always want to reset the other sections to null state
      state.daemonSection = null;
      state.benchmarkSection = null;
      state.adminSection = null;
      state.appsSection = null;
      state.explorerSection = null;
      state.dashboardSection = null;
    },
    setAdminSection(state, section) {
      state.adminSection = section;
      // we always want to reset the other sections to null state
      state.daemonSection = null;
      state.benchmarkSection = null;
      state.nodeSection = null;
      state.appsSection = null;
      state.explorerSection = null;
      state.dashboardSection = null;
    },
    setAppsSection(state, section) {
      state.appsSection = section;
      // we always want to reset the other sections to null state
      state.daemonSection = null;
      state.benchmarkSection = null;
      state.nodeSection = null;
      state.adminSection = null;
      state.explorerSection = null;
      state.dashboardSection = null;
    },
    setExplorerSection(state, section) {
      state.explorerSection = section;
      // we always want to reset the other sections to null state
      state.daemonSection = null;
      state.benchmarkSection = null;
      state.nodeSection = null;
      state.adminSection = null;
      state.appsSection = null;
      state.dashboardSection = null;
    },
    setDashboardSection(state, section) {
      state.dashboardSection = section;
      // we always want to reset the other sections to null state
      state.daemonSection = null;
      state.benchmarkSection = null;
      state.nodeSection = null;
      state.adminSection = null;
      state.appsSection = null;
      state.explorerSection = null;
    },
    setFluxVersion(state, version) {
      state.fluxVersion = version;
    },
  },
  actions: {},
});
