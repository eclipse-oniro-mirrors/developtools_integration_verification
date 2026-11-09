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

import { PageOne0120Builder } from './pageOne0120';
import { PageTwo0120Builder } from './pageTwo0120';
import { BusinessError } from '@kit.BasicServicesKit';

@Builder
export function navigationScene0120Builder(name: string, param: Object) {
  NavigationScene0120()
}

@Builder
function dynamicBuilderScene0120(name: string, param: Object) {
  if (name === 'PageOne0120') {
    PageOne0120Builder(name, param);
  } else if (name === 'PageTwo0120') {
    PageTwo0120Builder(name, param);
  }
}

@Component
export struct NavigationScene0120 {
  pathStack: NavPathStack = new NavPathStack();

  async replaceDestinationPageOne(mode: LaunchMode) {
    try {
      await this.pathStack.replaceDestination({
        name: 'PageOne0120',
        param: `replaceDest pageOne ${mode === LaunchMode.MOVE_TO_TOP_SINGLETON ? 'MOVE_TO_TOP_SINGLETON' : 'POP_TO_SINGLETON'}`
      }, { launchMode: mode });
      console.info('replaceDestination pageOne succeeded');
    } catch (error) {
      const err = error as BusinessError;
      console.error(`replaceDestination pageOne failed, code is ${err.code}, message is ${err.message}`);
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

          Button('pushPath pageOne STANDARD')
            .id('pushPathPageOneStandardBtn0120')
            .width(300)
            .height(50)
            .margin({ bottom: 10 })
            .onClick(() => {
              this.pathStack.pushPath({ name: 'PageOne0120', param: 'push pageOne STANDARD' });
            });

          Button('pushPath pageTwo STANDARD')
            .id('pushPathPageTwoStandardBtn0120')
            .width(300)
            .height(50)
            .margin({ bottom: 10 })
            .onClick(() => {
              this.pathStack.pushPath({ name: 'PageTwo0120', param: 'push pageTwo STANDARD' });
            });

          Button('replaceDest pageOne MOVE_TO_TOP_SINGLETON')
            .id('replaceDestPageOneMoveToTopSingletonBtn0120')
            .width(300)
            .height(50)
            .margin({ bottom: 10 })
            .onClick(async () => {
              await this.replaceDestinationPageOne(LaunchMode.MOVE_TO_TOP_SINGLETON);
            });

          Button('pushPath pageTwo STANDARD')
            .id('pushPathPageTwoStandardBtn0120_2')
            .width(300)
            .height(50)
            .margin({ bottom: 10 })
            .onClick(() => {
              this.pathStack.pushPath({ name: 'PageTwo0120', param: 'push pageTwo STANDARD' });
            });

          Button('pushPath pageTwo STANDARD')
            .id('pushPathPageTwoStandardBtn0120_3')
            .width(300)
            .height(50)
            .margin({ bottom: 10 })
            .onClick(() => {
              this.pathStack.pushPath({ name: 'PageTwo0120', param: 'push pageTwo STANDARD' });
            });

          Button('replaceDest pageOne POP_TO_SINGLETON')
            .id('replaceDestPageOnePopToSingletonBtn0120')
            .width(300)
            .height(50)
            .margin({ bottom: 10 })
            .onClick(async () => {
              await this.replaceDestinationPageOne(LaunchMode.POP_TO_SINGLETON);
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
        .navDestination(dynamicBuilderScene0120)
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

