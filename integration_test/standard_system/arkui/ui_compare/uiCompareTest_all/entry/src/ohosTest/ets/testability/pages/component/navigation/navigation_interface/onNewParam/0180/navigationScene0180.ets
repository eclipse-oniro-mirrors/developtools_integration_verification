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

import { PageOne0180Builder } from './pageOne0180';
import { PageTwo0180Builder } from './pageTwo0180';

@Builder
export function navigationScene0180Builder(name: string, param: Object) {
  NavigationScene0180()
}

@Builder
function dynamicBuilderScene0180(name: string, param: Object) {
  if (name === 'PageOne0180') {
    PageOne0180Builder(name, param);
  } else if (name === 'PageTwo0180') {
    PageTwo0180Builder(name, param);
  }
}

@Component
export struct NavigationScene0180 {
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

          Button('OnReady pageOne STANDARD')
            .id('onReadyPageOneStandardBtn0180')
            .width(300)
            .height(50)
            .margin({ bottom: 10 })
            .onClick(() => {
              this.pathStack.pushPath({ name: 'PageOne0180', param: 'onReady pageOne STANDARD' });
            });

          Button('OnReady pageTwo STANDARD')
            .id('onReadyPageTwoStandardBtn0180')
            .width(300)
            .height(50)
            .margin({ bottom: 10 })
            .onClick(() => {
              this.pathStack.pushPath({ name: 'PageTwo0180', param: 'onReady pageTwo STANDARD' });
            });

          Button('OnReady pageOne MOVE_TO_TOP_SINGLETON')
            .id('onReadyPageOneMoveToTopSingletonBtn0180')
            .width(300)
            .height(50)
            .margin({ bottom: 10 })
            .onClick(() => {
              this.pathStack.pushPath({ name: 'PageOne0180', param: 'onReady pageOne MOVE_TO_TOP_SINGLETON' }, { launchMode: LaunchMode.MOVE_TO_TOP_SINGLETON });
            });

          Button('OnReady pageTwo POP_TO_SINGLETON')
            .id('onReadyPageTwoPopToSingletonBtn0180')
            .width(300)
            .height(50)
            .margin({ bottom: 10 })
            .onClick(() => {
              this.pathStack.pushPath({ name: 'PageTwo0180', param: 'onReady pageTwo POP_TO_SINGLETON' }, { launchMode: LaunchMode.POP_TO_SINGLETON });
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
        .navDestination(dynamicBuilderScene0180)
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

