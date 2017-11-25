// todo-item 이름을 가진 컴포넌트를 정의합니다
Vue.component('todo-item', {
  props: ['todo', 'key_id', 'count'],
  template: '<ul>[{{key_id}}]{{ todo }}({{count}})</ul>'
})
