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
struct ScrollToTop16 {
  private listData: string[] = [];

  aboutToAppear() {
    // 设置足够的数据用于滚动测试
    for (let i = 0; i < 6; i++) {
      this.listData.push(`Item ${i + 1}`);
    }
  }

  build() {
    Column() {
      Text('用例编号：SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0160')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 5 });

      Text('预置条件：1.打开hap 2.设置滚动组件联动动效为启用，划动组件 3.查看设备效果')
        .fontSize(12)
        .margin({ bottom: 10 });

      List({ space: 20 }) {
        ForEach(this.listData, (item: string) => {
          ListItem() {
            Text(item)
              .width('100%')
              .height(100)
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .backgroundColor(0xF5F5F5)
          }
        }, (item: string) => item)
      }
      .id('scrollToTopList_16')
      .width('100%')
      .layoutWeight(1)
      .chainAnimationOptions({ 
        minSpace: 10, 
        maxSpace: 30, 
        edgeEffect: ChainEdgeEffect.DEFAULT 
      }) // 设置滚动组件联动动效为启用
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor(0xFFFFFF)
  }
}

