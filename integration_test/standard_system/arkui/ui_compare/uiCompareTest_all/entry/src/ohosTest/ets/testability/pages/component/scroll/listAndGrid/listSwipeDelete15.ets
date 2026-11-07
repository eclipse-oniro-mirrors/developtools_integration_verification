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
struct ListSwipeDelete15 {
  private listData: string[] = [];
  @State actionAreaLog: string = '';

  aboutToAppear() {
    // 设置5-6个item
    for (let i = 0; i < 5; i++) {
      this.listData.push(`Item ${i + 1}`);
    }
  }

  @Builder
  deleteBuilder() {
    Text('Delete')
      .width(80)
      .height(100)
      .fontSize(16)
      .textAlign(TextAlign.Center)
      .backgroundColor(0xFF0000)
      .fontColor(Color.White)
  }

  build() {
    Column() {
      Text('用例编号：SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSWIPEDELETE_BUILDERCOMPONENT_0150')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 5 });

      Text(`ActionArea: ${this.actionAreaLog}`)
        .fontSize(12)
        .margin({ bottom: 10 });

      List({ space: 10 }) {
        ForEach(this.listData, (item: string, index: number) => {
          ListItem() {
            Text(item)
              .width('100%')
              .height(100)
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .backgroundColor(0xF5F5F5)
          }
          .id(`listItem_15_${index}`)
          .swipeAction({
            end: {
              builder: () => {
                this.deleteBuilder();
              },
              onAction: () => {
                console.info('Delete action triggered');
              },
              actionAreaDistance: 56,
              onEnterActionArea: () => {
                this.actionAreaLog = 'EnterActionArea';
                console.info('onEnterActionArea triggered');
              },
              onExitActionArea: () => {
                this.actionAreaLog = 'ExitActionArea';
                console.info('onExitActionArea triggered');
              }
            }
          })
        }, (item: string) => item)
      }
      .id('listSwipeDelete_15')
      .width('100%')
      .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor(0xFFFFFF)
  }
}

