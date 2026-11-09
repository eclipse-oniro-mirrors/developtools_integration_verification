/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
@Entry
@Component
export struct ComponentNavNavigationBack0292A {
  @Consume('pageInfos') pageInfos: NavPathStack
  @State backButtonIcon:string | PixelMap | Resource= 'AAA'
  build() {
    NavDestination() {
      Column() {
        Button('NextPage', { stateEffect: true, type: ButtonType.Capsule })
          .width('80%')
          .height(40)
          .margin(20)
          .id('ComponentNavNavigationBack0292_A1')
          .onClick(() => {
            this.pageInfos.pushPathByName('pageTwo', null) //将name指定的NavDestination页面信息入栈，传递的数据为param
          })
        Button('backButtonIcon', { stateEffect: true, type: ButtonType.Capsule })
          .width('80%')
          .height(40)
          .margin(20)
          .id('ComponentNavNavigationBack0292_A2')
          .onClick(() => {
            this.backButtonIcon = $r('app.media.test2')
          })
      }.width('100%').height('100%')
    }.title('pageOne')
    .backButtonIcon(this.backButtonIcon)
    .mode(NavDestinationMode.STANDARD)
    .onBackPressed(() => {
      const popDestinationInfo = this.pageInfos.pop() // 弹出路由栈栈顶元素
      console.log('pop' + '返回值' + JSON.stringify(popDestinationInfo))
      return true
    })
    .backgroundColor(Color.White)
  }
}

export { ComponentNavNavigationBack0292A }
