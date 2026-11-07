/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

@Entry
@Component
struct ScrollToTop34 {
  private gridData: string[] = [];
  private scrollController: Scroller = new Scroller();

  aboutToAppear() {
    // 设置足够的数据用于滚动测试
    for (let i = 0; i < 6; i++) {
      this.gridData.push(`Item ${i + 1}`);
    }
  }

  build() {
    Column() {
      Text('用例编号：SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0340')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 5 });

      Text('预置条件：1.打开hap 2.设置滚动组件BackToTop为true，点击状态栏 3.查看设备效果')
        .fontSize(12)
        .margin({ bottom: 10 });

      Grid(this.scrollController) {
        ForEach(this.gridData, (item: string) => {
          GridItem() {
            // 嵌套不同的滚动组件
            Scroll() {
              Column() {
                Text(item)
                  .fontSize(16)
                  .textAlign(TextAlign.Center)
                Text('嵌套滚动内容')
                  .fontSize(12)
                  .margin({ top: 10 })
              }
              .width('100%')
              .height('100%')
            }
            .width('100%')
            .height('100%')
            .backgroundColor(0xF5F5F5)
          }
        }, (item: string) => item)
      }
      .id('scrollToTopGrid_34')
      .columnsTemplate('1fr 1fr')
      .rowsTemplate('100px 100px 100px')
      .width('100%')
      .layoutWeight(1)
      .backToTop(true) // 设置滚动组件BackToTop为true
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor(0xFFFFFF)
  }
}

