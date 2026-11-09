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

import { PageOne0080Builder } from './pageOne0080';
import { PageTwo0080Builder } from './pageTwo0080';

@Builder
export function navigationScene0080Builder(name: string, param: Object) {
  NavigationScene0080()
}

@Builder
function dynamicBuilderScene0080(name: string, param: Object) {
  if (name === 'PageOne0080') {
    PageOne0080Builder(name, param);
  } else if (name === 'PageTwo0080') {
    PageTwo0080Builder(name, param);
  }
}

@Component
export struct NavigationScene0080 {
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
            .id('pushPathPageOneStandardBtn0080')
            .width(300)
            .height(50)
            .margin({ bottom: 10 })
            .onClick(() => {
              this.pathStack.pushPath({ name: 'PageOne0080', param: 'push pageOne STANDARD' });
            });

          Button('pushPath pageTwo STANDARD')
            .id('pushPathPageTwoStandardBtn0080')
            .width(300)
            .height(50)
            .margin({ bottom: 10 })
            .onClick(() => {
              this.pathStack.pushPath({ name: 'PageTwo0080', param: 'push pageTwo STANDARD' });
            });

          Button('pushPath pageOne MOVE_TO_TOP_SINGLETON')
            .id('pushPathPageOneMoveToTopSingletonBtn0080')
            .width(300)
            .height(50)
            .margin({ bottom: 10 })
            .onClick(() => {
              this.pathStack.pushPath({ name: 'PageOne0080', param: 'push pageOne MOVE_TO_TOP_SINGLETON' }, { launchMode: LaunchMode.MOVE_TO_TOP_SINGLETON });
            });

          Button('pushPath pageTwo POP_TO_SINGLETON')
            .id('pushPathPageTwoPopToSingletonBtn0080')
            .width(300)
            .height(50)
            .margin({ bottom: 10 })
            .onClick(() => {
              this.pathStack.pushPath({ name: 'PageTwo0080', param: 'push pageTwo POP_TO_SINGLETON' }, { launchMode: LaunchMode.POP_TO_SINGLETON });
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
        .navDestination(dynamicBuilderScene0080)
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

