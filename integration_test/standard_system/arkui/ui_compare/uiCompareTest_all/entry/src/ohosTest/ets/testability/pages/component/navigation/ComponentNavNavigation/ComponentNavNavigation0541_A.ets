import { image } from '@kit.ImageKit'
import { BusinessError } from '@kit.BasicServicesKit'
import { fileIo } from '@kit.CoreFileKit'

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
export struct ComponentNavNavigation0541A {
  @Consume('pageInfos') pageInfos: NavPathStack
  @State backButtonIcon:string | PixelMap | Resource= 'AAA'
  @State isGifMode: boolean = false; // 用于切换状态
  build() {
    NavDestination() {
      Column() {
        Button('NextPage', { stateEffect: true, type: ButtonType.Capsule })
          .width('80%')
          .height(40)
          .margin(20)
          .id('ComponentNavNavigation0541_A1')
          .onClick(() => {
            this.pageInfos.pushPathByName('pageTwo', null) //将name指定的NavDestination页面信息入栈，传递的数据为param
          })
      }.width('100%').height('100%')
    }.title('test only blur',{backgroundColor:Color.Red})
  }
}

export { ComponentNavNavigation0541A }

