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
import { ComponentNavNavigation0541A } from './ComponentNavNavigation0541_A.ets'

interface GeneratedTypeLiteralInterface_1 {
  pageInfos?: NavPathStack;
}

@Entry
@Component
export struct ComponentNavNavigation0541001 {
  @Provide('pageInfos') pageInfos: NavPathStack = new NavPathStack()
  @State mode:NavigationMode=NavigationMode.Auto
  @State titleMode:NavigationTitleMode=NavigationTitleMode.Free
  @Builder
  PageMap(name: string) {
    if (name === 'pageOne') {
      ComponentNavNavigation0541_A();
    }
  }

  build() {
    Navigation(this.pageInfos) {
      Column() {
        Button('only color')
          .width('80%')
          .height(40)
          .margin(20)
          .id('ComponentNavNavigation0541001')
          .onClick(() => {
            this.pageInfos.pushPath({ name: 'pageOne' }) //将name指定的NavDestination页面信息入栈
          })
      }
    }.title('NavIndex',{backgroundColor:Color.Pink,backgroundBlurStyle:BlurStyle.BACKGROUND_THIN}).navDestination(this.PageMap)
  }
}