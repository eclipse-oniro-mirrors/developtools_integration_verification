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

import { PageTwo0340Builder } from './pageTwo0340';
import { PageFour0340Builder } from './pageFour0340';

// 定义参数类型
interface NavParam0340 {
  autoPushPageTwo?: boolean;
}

// 辅助函数：从 param 中提取 autoPushPageTwo 标志
function getAutoPushPageTwoFlag(param: Object): boolean {
  if (param && typeof param === 'object') {
    const navParam = param as NavParam0340;
    return navParam.autoPushPageTwo === true;
  }
  return false;
}

@Builder
export function navigationB0340Builder(name: string, param: Object) {
  NavigationB0340({ autoPushPageTwo: getAutoPushPageTwoFlag(param) })
}

@Builder
function dynamicBuilderB0340(name: string, param: Object) {
  if (name === 'PageTwo0340') {
    PageTwo0340Builder(name, param);
  } else if (name === 'PageFour0340') {
    PageFour0340Builder(name, param);
  }
}

@Component
export struct NavigationB0340 {
  private pathStackB: NavPathStack = new NavPathStack();
  private autoPushPageTwo: boolean = false;

  aboutToAppear() {
    // If autoPushPageTwo is true, automatically push PageTwo0340 when NavigationB appears
    if (this.autoPushPageTwo) {
      // Use setTimeout to ensure Navigation is fully initialized
      setTimeout(() => {
        this.pathStackB.pushPath({ name: 'PageTwo0340', param: null });
      }, 100);
    }
  }

  build() {
    NavDestination() {
      Navigation(this.pathStackB) {
        Column() {
          Text('NavigationB')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .margin({ bottom: 20 });

          Button('NavigationB push pageTwo')
            .id('navigationBPushPageTwoBtn0340')
            .width(300)
            .height(50)
            .margin({ bottom: 10 })
            .onClick(() => {
              this.pathStackB.pushPath({ name: 'PageTwo0340', param: null });
            });

          Button('NavigationB push pageFour')
            .id('navigationBPushPageFourBtn0340')
            .width(300)
            .height(50)
            .margin({ bottom: 10 })
            .onClick(() => {
              this.pathStackB.pushPath({ name: 'PageFour0340', param: null });
            });
        }
        .width('100%')
        .height('100%')
        .padding(20)
        .justifyContent(FlexAlign.Center)
        .backgroundColor('#E5E5E5')
      }
      .title('NavigationB')
      .navDestination(dynamicBuilderB0340)
    }
    .title('NavigationB')
    .mode(NavDestinationMode.STANDARD)
  }
}
