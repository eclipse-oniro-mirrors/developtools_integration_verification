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
import { ComponentNavNavigation054A } from './ComponentNavNavigation054_A'

interface GeneratedTypeLiteralInterface_1 {
  pageInfos?: NavPathStack;
}

@Entry
@Component
export struct ComponentNavNavigation054001 {
  @Provide('pageInfos') pageInfos: NavPathStack = new NavPathStack()
  @Builder
  PageMap(name: string) {
    if (name === 'pageOne') {
      ComponentNavNavigation054_A();
    }
  }

  build() {
    Navigation(this.pageInfos) {
      Column() {
        Button('only color')
          .width('80%')
          .height(40)
          .margin(20)
          .id('ComponentNavNavigation054001')
          .onClick(() => {
            this.pageInfos.pushPath({ name: 'pageOne' }) //将name指定的NavDestination页面信息入栈
          })
      }
    }.title({main:'主标题主标题主标题',sub:'副标题副标题副标题'},{backgroundColor:Color.Pink,backgroundBlurStyle:BlurStyle.COMPONENT_ULTRA_THICK}).navDestination(this.PageMap)
  }
}