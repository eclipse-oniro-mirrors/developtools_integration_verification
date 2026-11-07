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
export struct ComponentNavNavigationBack0294B {
  @Consume('pageInfos') pageInfos: NavPathStack
  build() {
    NavDestination() {
      Column() {
        Text('pageTwo')
          .fontColor(Color.Pink)
          .fontWeight(FontWeight.Bold)
      }.width('100%').height('100%')
    }.title('pageTwo')
    .backButtonIcon('BBB')
    .onBackPressed(() => {
      const popDestinationInfo = this.pageInfos.pop() // 弹出路由栈栈顶元素
      console.log('pop' + '返回值' + JSON.stringify(popDestinationInfo))
      return true
    })
    .backgroundColor(Color.White)
  }
}

export { ComponentNavNavigationBack0294B }
export class Pages {
  public names: string = ''
  values: NavPathStack | null = null
}
