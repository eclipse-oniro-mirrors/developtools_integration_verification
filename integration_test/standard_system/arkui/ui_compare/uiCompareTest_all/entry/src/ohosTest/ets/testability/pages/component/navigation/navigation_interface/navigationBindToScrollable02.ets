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
 * NavigationBindToScrollable02
 * 
 * 测试用例：SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BINDTOSCROLLABLE_0020
 * 测试目的：验证Navigation标题栏工具栏支持跟手滑动隐藏显示(Navigation嵌套Grid场景)
 */

@Entry
@Component
export struct NavigationBindToScrollable02 {
  private pathStack: NavPathStack = new NavPathStack();
  private gridController: Scroller = new Scroller();

  build() {
    Navigation(this.pathStack) {
      Column() {
        Text('用例编号：SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BINDTOSCROLLABLE_0020')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 });

        Text('Navigation标题栏工具栏支持跟手滑动隐藏显示(Navigation嵌套Grid场景)')
          .fontSize(14)
          .fontColor('#666666')
          .margin({ bottom: 20 });

        Button('NavDestination嵌套Grid')
          .id('navGridBtn_02')
          .width(200)
          .height(50)
          .margin({ bottom: 10 })
          .onClick(() => {
            try {
              this.pathStack.pushDestination({ name: 'pageOne', param: this.gridController });
            } catch (e) {
              console.error('pushDestination error:', e);
            }
          });
      }
      .width('100%')
      .height('100%')
      .padding(20)
      .backgroundColor('#FFFFFF')
    }
    .title('Navigation BindToScrollable Test')
    .toolbarConfiguration([
      {
        value: '工具栏',
        action: () => {}
      }
    ])
    .navDestination(pageOneBuilder)
  }
}

@Builder
export function pageOneBuilder(name: string, param: Object) {
  PageOne()
}

@Component
export struct PageOne {
  private gridController: Scroller = new Scroller();
  private items: number[] = [1, 2, 3, 4, 5];

  build() {
    NavDestination() {
      Column() {
        Button('push pageOne')
          .id('pushPageOneBtn_02')
          .width(200)
          .height(50)
          .margin({ bottom: 10 })
          .onClick(() => {
            // 可以继续push页面
          });

        Grid(this.gridController) {
          ForEach(this.items, (item: number) => {
            GridItem() {
              Text(`Grid Item ${item}`)
                .width('100%')
                .height('100%')
                .backgroundColor('#E5E5E5')
                .textAlign(TextAlign.Center)
                .fontSize(16)
            }
          }, (item: number) => item.toString())
        }
        .id('gridComponent_02')
        .width('100%')
        .height('100%')
        .columnsTemplate('1fr 1fr 1fr')
        .rowsGap(10)
        .columnsGap(10)
        .scrollBar(BarState.Auto)
      }
      .width('100%')
      .height('100%')
      .padding(20)
      .backgroundColor('#F5F5F5')
    }
    .title('PageOne')
  }
}

