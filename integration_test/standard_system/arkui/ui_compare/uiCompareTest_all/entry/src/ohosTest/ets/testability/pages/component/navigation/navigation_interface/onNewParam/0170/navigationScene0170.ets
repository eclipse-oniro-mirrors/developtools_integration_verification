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

import { PageOne0170Builder } from './pageOne0170';
import { PageTwo0170Builder } from './pageTwo0170';

// 定义派生类
class DerivedNavPathStack extends NavPathStack {
  pushPathDerived(info: NavPathInfo, options?: NavigationOptions): void {
    this.pushPath(info, options);
  }
}

@Builder
export function navigationScene0170Builder(name: string, param: Object) {
  NavigationScene0170()
}

@Builder
function dynamicBuilderScene0170(name: string, param: Object) {
  if (name === 'PageOne0170') {
    PageOne0170Builder(name, param);
  } else if (name === 'PageTwo0170') {
    PageTwo0170Builder(name, param);
  }
}

@Component
export struct NavigationScene0170 {
  pathStack: DerivedNavPathStack = new DerivedNavPathStack();

  build() {
    NavDestination() {
      Column() {
        // 按钮区域 - 始终可见
        Column() {
          Text('Navigation Scene')
            .fontSize(24)
            .fontWeight(FontWeight.Bold)
            .margin({ bottom: 20 });

          Button('DerivedNavPathStack pushPath pageOne STANDARD')
            .id('derivedPushPathPageOneStandardBtn0170')
            .width(300)
            .height(50)
            .margin({ bottom: 10 })
            .onClick(() => {
              this.pathStack.pushPathDerived({ name: 'PageOne0170', param: 'push pageOne STANDARD' });
            });

          Button('DerivedNavPathStack pushPath pageTwo STANDARD')
            .id('derivedPushPathPageTwoStandardBtn0170')
            .width(300)
            .height(50)
            .margin({ bottom: 10 })
            .onClick(() => {
              this.pathStack.pushPathDerived({ name: 'PageTwo0170', param: 'push pageTwo STANDARD' });
            });

          Button('DerivedNavPathStack pushPath pageOne MOVE_TO_TOP_SINGLETON')
            .id('derivedPushPathPageOneMoveToTopSingletonBtn0170')
            .width(300)
            .height(50)
            .margin({ bottom: 10 })
            .onClick(() => {
              this.pathStack.pushPathDerived({ name: 'PageOne0170', param: 'push pageOne MOVE_TO_TOP_SINGLETON' }, { launchMode: LaunchMode.MOVE_TO_TOP_SINGLETON });
            });

          Button('DerivedNavPathStack pushPath pageTwo POP_TO_SINGLETON')
            .id('derivedPushPathPageTwoPopToSingletonBtn0170')
            .width(300)
            .height(50)
            .margin({ bottom: 10 })
            .onClick(() => {
              this.pathStack.pushPathDerived({ name: 'PageTwo0170', param: 'push pageTwo POP_TO_SINGLETON' }, { launchMode: LaunchMode.POP_TO_SINGLETON });
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
        .navDestination(dynamicBuilderScene0170)
        .width('100%')
        .layoutWeight(1)
      }
      .width('100%')
      .height('100%')
    }
    .title('Navigation Scene')
    .mode(NavDestinationMode.STANDARD)
    .onReady((context: NavDestinationContext) => {
      // 注意：对于DerivedNavPathStack，不能替换pathStack，必须保持使用初始化的DerivedNavPathStack实例
      // 否则会丢失pushPathDerived方法
    })
  }
}
