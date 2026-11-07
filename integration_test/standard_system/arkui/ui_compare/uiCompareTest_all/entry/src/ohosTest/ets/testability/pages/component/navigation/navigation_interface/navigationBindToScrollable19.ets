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
 * NavigationBindToScrollable19
 * 
 * 测试用例：SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BINDTOSCROLLABLE_0190
 * 测试目的：验证Navigation标题栏工具栏支持跟手滑动隐藏显示(Navigation嵌套WaterFlow、WaterFlow再嵌套Grid场景)
 */

@Entry
@Component
export struct NavigationBindToScrollable19 {
  private pathStack: NavPathStack = new NavPathStack();
  private parentWaterFlowController: Scroller = new Scroller();
  private childGridController: Scroller = new Scroller();

  build() {
    Navigation(this.pathStack) {
      Column() {
        Text('用例编号：SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BINDTOSCROLLABLE_0190')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 });

        Text('Navigation标题栏工具栏支持跟手滑动隐藏显示(Navigation嵌套WaterFlow、WaterFlow再嵌套Grid场景)')
          .fontSize(14)
          .fontColor('#666666')
          .margin({ bottom: 20 });

        Button('NavDestination嵌套WaterFlow、WaterFlow再嵌套Grid')
          .id('navWaterFlowNestedGridBtn_19')
          .width(300)
          .height(50)
          .margin({ bottom: 10 })
          .onClick(() => {
            try {
              this.pathStack.pushDestination({ 
                name: 'pageOne', 
                param: null 
              });
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
  private parentWaterFlowController: Scroller = new Scroller();
  private childGridController: Scroller = new Scroller();
  private items: number[] = [1, 2, 3, 4, 5];

  build() {
    NavDestination() {
      Column() {
        Button('push pageOne')
          .id('pushPageOneBtn_19')
          .width(200)
          .height(50)
          .margin({ bottom: 10 })
          .onClick(() => {
            // 可以继续push页面
          });

        WaterFlow({ scroller: this.parentWaterFlowController }) {
          FlowItem() {
            Column() {
              Text('父WaterFlow Item 1')
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .margin({ bottom: 10 });

              Grid(this.childGridController) {
                ForEach(this.items, (item: number) => {
                  GridItem() {
                    Text(`子Grid Item ${item}`)
                      .width('100%')
                      .height('100%')
                      .backgroundColor('#E5E5E5')
                      .textAlign(TextAlign.Center)
                      .fontSize(14)
                  }
                }, (item: number) => item.toString())
              }
              .id('childGridComponent_19')
              .width('100%')
              .height('32.79%')
              .columnsTemplate('1fr 1fr 1fr')
              .rowsGap(10)
              .columnsGap(10)
              .scrollBar(BarState.Auto)
            }
            .width('100%')
            .height('100%')
            .padding(10)
          }
        }
        .id('parentWaterFlowComponent_19')
        .width('100%')
        .height('100%')
        .columnsTemplate('1fr')
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
