Vue.component('app-nav', {
  props: ['title'],
  template: `
  <div style="height:100px; background-color:black;color:white;">
    <h1>{{ title }}</h1>
  </div>
  `,
})
