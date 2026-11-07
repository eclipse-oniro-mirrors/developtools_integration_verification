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

import { PageOne0100Builder } from './pageOne0100';
import { PageTwo0100Builder } from './pageTwo0100';
import { BusinessError } from '@kit.BasicServicesKit';

@Builder
export function navigationScene0100Builder(name: string, param: Object) {
  NavigationScene0100()
}

@Builder
function dynamicBuilderScene0100(name: string, param: Object) {
  if (name === 'PageOne0100') {
    PageOne0100Builder(name, param);
  } else if (name === 'PageTwo0100') {
    PageTwo0100Builder(name, param);
  }
}

@Component
export struct NavigationScene0100 {
  pathStack: NavPathStack = new NavPathStack();

  async pushDestinationPageOne(mode: LaunchMode) {
    try {
      await this.pathStack.pushDestination({
        name: 'PageOne0100',
        param: `pushDestination pageOne ${mode === LaunchMode.MOVE_TO_TOP_SINGLETON ? 'MOVE_TO_TOP_SINGLETON' : 'POP_TO_SINGLETON'}`
      }, { launchMode: mode });
      console.info('pushDestination pageOne succeeded');
    } catch (error) {
      const err = error as BusinessError;
      console.error(`pushDestination pageOne failed, code is ${err.code}, message is ${err.message}`);
    }
  }

  async pushDestinationPageTwo(mode: LaunchMode) {
    try {
      await this.pathStack.pushDestination({
        name: 'PageTwo0100',
        param: `pushDestination pageTwo ${mode === LaunchMode.MOVE_TO_TOP_SINGLETON ? 'MOVE_TO_TOP_SINGLETON' : 'POP_TO_SINGLETON'}`
      }, { launchMode: mode });
      console.info('pushDestination pageTwo succeeded');
    } catch (error) {
      const err = error as BusinessError;
      console.error(`pushDestination pageTwo failed, code is ${err.code}, message is ${err.message}`);
    }
  }

  build() {
    NavDestination() {
      Column() {
        // 按钮区域 - 始终可见
        Column() {
          Text('Navigation Scene')
            .fontSize(24)
            .fontWeight(FontWeight.Bold)
            .margin({ bottom: 20 });

          Button('pushDestination pageOne STANDARD')
            .id('pushDestinationPageOneStandardBtn0100')
            .width(300)
            .height(50)
            .margin({ bottom: 10 })
            .onClick(async () => {
              await this.pathStack.pushDestination({ name: 'PageOne0100', param: 'pushDestination pageOne STANDARD' });
            });

          Button('pushDestination pageTwo STANDARD')
            .id('pushDestinationPageTwoStandardBtn0100')
            .width(300)
            .height(50)
            .margin({ bottom: 10 })
            .onClick(async () => {
              await this.pathStack.pushDestination({ name: 'PageTwo0100', param: 'pushDestination pageTwo STANDARD' });
            });

          Button('pushDestination pageOne MOVE_TO_TOP_SINGLETON')
            .id('pushDestinationPageOneMoveToTopSingletonBtn0100')
            .width(300)
            .height(50)
            .margin({ bottom: 10 })
            .onClick(async () => {
              await this.pushDestinationPageOne(LaunchMode.MOVE_TO_TOP_SINGLETON);
            });

          Button('pushDestination pageTwo POP_TO_SINGLETON')
            .id('pushDestinationPageTwoPopToSingletonBtn0100')
            .width(300)
            .height(50)
            .margin({ bottom: 10 })
            .onClick(async () => {
              await this.pushDestinationPageTwo(LaunchMode.POP_TO_SINGLETON);
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
        .navDestination(dynamicBuilderScene0100)
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

