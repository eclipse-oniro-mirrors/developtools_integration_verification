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

import { PageOne0090Builder } from './pageOne0090';

@Builder
export function navigationScene0090Builder(name: string, param: Object) {
  NavigationScene0090()
}

@Builder
function dynamicBuilderScene0090(name: string, param: Object) {
  if (name === 'PageOne0090') {
    PageOne0090Builder(name, param);
  }
}

@Component
export struct NavigationScene0090 {
  pathStack: NavPathStack = new NavPathStack();

  build() {
    NavDestination() {
      Column() {
        // 按钮区域 - 始终可见
        Column() {
          Text('Navigation Scene')
            .fontSize(24)
            .fontWeight(FontWeight.Bold)
            .margin({ bottom: 20 });

          Button('pushPath pageOne STANDARD')
            .id('pushPathPageOneStandardBtn0090')
            .width(300)
            .height(50)
            .margin({ bottom: 10 })
            .onClick(() => {
              this.pathStack.pushPath({ name: 'PageOne0090', param: 'push pageOne STANDARD' });
            });

          Button('pushPath pageOne NEW_INSTANCE')
            .id('pushPathPageOneNewInstanceBtn0090')
            .width(300)
            .height(50)
            .margin({ bottom: 10 })
            .onClick(() => {
              this.pathStack.pushPath({ name: 'PageOne0090', param: 'push pageOne NEW_INSTANCE' }, { launchMode: LaunchMode.NEW_INSTANCE });
            });

          Button('pushPath pageOne STANDARD (2)')
            .id('pushPathPageOneStandardBtn0090_2')
            .width(300)
            .height(50)
            .margin({ bottom: 10 })
            .onClick(() => {
              this.pathStack.pushPath({ name: 'PageOne0090', param: 'push pageOne STANDARD (2)' });
            });
        }
        .width('100%')
        .padding(20)
        .justifyContent(FlexAlign.Center)
        .backgroundColor('#E3F2FD')

        // Navigation组件 - 用于显示子页面
        Navigation(this.pathStack) {
          // 初始内容为空，Navigation组件会根据pathStack状态显示子页面
        }
        .title('Navigation Scene')
        .navDestination(dynamicBuilderScene0090)
        .width('100%')
        .layoutWeight(1)
      }
      .width('100%')
      .height('100%')
    }
    .title('Navigation Scene')
    .mode(NavDestinationMode.STANDARD)
    .onReady((context: NavDestinationContext) => {
      this.pathStack = context.pathStack;
    })
  }
}
