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

/**
 * NavigationMTBF07
 * 
 * 测试用例：SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0070
 * 测试目的：Navigation组件页面跳转测试（pushDestination + pop场景）
 */

@Entry
@Component
export struct NavigationMTBF07 {
  private pathStack: NavPathStack = new NavPathStack();

  build() {
    Navigation(this.pathStack) {
      Column() {
        Text('页面切换')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 20 });

        Button('pushDestination pageOne')
          .id('pushDestinationPageOneBtn')
          .width(300)
          .height(50)
          .margin({ bottom: 10 })
          .onClick(() => {
            try {
              this.pathStack.pushDestination({ name: 'pageOne', param: null });
            } catch (e) {
              console.error('pushDestination pageOne error:', e);
            }
          });
      }
      .width('100%')
      .height('100%')
      .padding(20)
      .backgroundColor('#FFFFFF')
    }
    .title('Navigation MTBF Test')
    .navDestination(pageOneBuilder)
  }
}

@Builder
export function pageOneBuilder(name: string, param: Object) {
  PageOne()
}

@Component
export struct PageOne {
  private pathStack: NavPathStack | null = null;

  build() {
    NavDestination() {
      Column() {
        Text('PageOne')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 20 });

        Button('pop')
          .id('popBtnMTBF07')
          .width(200)
          .height(50)
          .margin({ bottom: 10 })
          .onClick(() => {
            try {
              this.pathStack?.pop();
            } catch (e) {
              console.error('pop error:', e);
            }
          });
      }
      .width('100%')
      .height('100%')
      .padding(20)
      .backgroundColor('#F5F5F5')
    }
    .title('PageOne')
    .onReady((context: NavDestinationContext) => {
      this.pathStack = context.pathStack;
    })
  }
}

