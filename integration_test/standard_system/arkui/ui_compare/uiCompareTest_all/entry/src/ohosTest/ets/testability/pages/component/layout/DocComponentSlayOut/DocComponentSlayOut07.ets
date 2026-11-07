/*
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { PageOneTmp } from './PageOne'
import { pageTwoTmp } from './PageTwo'
import { Pages }  from './PageTwo'

@Entry
@Component
struct DocComponentSlayOut07 {
  @Provide('pageInfos') pageInfos: NavPathStack = new NavPathStack()
  @State text : string ='Routing stacks and program triggering capabilities are supported'

  @Builder
  PageMap(name: string) {
    if (name === 'pageOne') {
      PageOneTmp()
    } else if (name === 'pageTwo') {
      pageTwoTmp({ names: name, values: this.pageInfos } as Pages)
    }
  }

  aboutToAppear() {
    setTimeout(() => {
      this.pageInfos.pushPath({ name: 'pageOne' });
    }, 1000);
  }

  build() {
    Navigation(this.pageInfos) {
      Column() {
        Button('pushPath', { stateEffect: true, type: ButtonType.Capsule })
          .width('80%')
          .height(40)
          .margin(20)
          .onClick(() => {
            this.pageInfos.pushPath({ name: 'pageOne' })
          })
          .id('DocComponentSlayOut07')
        Text(this.text)
          .fontSize(16)
          .width('100%')
          .margin(10)
          .fontColor(Color.Gray)
          .height(80)
          .textAlign(TextAlign.Center)
      }
    }
    .title('NavIndex')
    .navDestination(this.PageMap)
  }
}
