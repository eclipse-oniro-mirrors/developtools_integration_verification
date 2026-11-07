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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { ComponentNavNavigationBack0292A } from './ComponentNavNavigationBack0292_A.ets'
import { ComponentNavNavigationBack0292B } from './ComponentNavNavigationBack0292_B.ets'
import { Pages } from './ComponentNavNavigationBack0292_B.ets'

interface GeneratedTypeLiteralInterface_1 {
  pageInfos?: NavPathStack;
}

@Entry
@Component
export struct ComponentNavNavigationBack0292001 {
  @Provide('pageInfos') pageInfos: NavPathStack = new NavPathStack()
  @State mode:NavigationMode=NavigationMode.Auto
  @State titleMode:NavigationTitleMode=NavigationTitleMode.Free
  @Builder
  PageMap(name: string) {
    if (name === 'pageOne') {
      ComponentNavNavigationBack0292_A();
    } else if (name === 'pageTwo') {
      ComponentNavNavigationBack0292_B({ pageInfos: this.pageInfos } as GeneratedTypeLiteralInterface_1);
    }
  }

  build() {
    Navigation(this.pageInfos) {
      Column() {
        Button('NextPage')
          .width('80%')
          .height(40)
          .margin(20)
          .id('ComponentNavNavigationBack0292001')
          .onClick(() => {
            this.pageInfos.pushPath({ name: 'pageOne' }) //将name指定的NavDestination页面信息入栈
          })
        Button('NavigationTitleMode')
          .width('80%')
          .height(40)
          .margin(20)
          .id('ComponentNavNavigationBack0292_003')
          .onClick(() => {
            this.titleMode=NavigationTitleMode.Full
          })
        Button('NavigationMode')
          .width('80%')
          .height(40)
          .margin(20)
          .id('ComponentNavNavigationBack0292_002')
          .onClick(() => {
            this.mode=NavigationMode.Auto
          })

      }
    }.title('NavIndex').navDestination(this.PageMap).mode(this.mode).titleMode(this.titleMode)
  }
}