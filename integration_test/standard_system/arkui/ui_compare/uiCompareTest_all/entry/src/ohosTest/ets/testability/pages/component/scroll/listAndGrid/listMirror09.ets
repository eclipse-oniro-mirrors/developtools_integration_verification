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
struct ListMirror09 {
  @State childrenMainSize: ChildrenMainSize | null = null;
  private listData: string[] = [];

  aboutToAppear() {
    // 设置5-6个item
    for (let i = 0; i < 5; i++) {
      this.listData.push(`Item ${i + 1}`);
    }
    // 初始化childrenMainSize
    this.childrenMainSize = new ChildrenMainSize(this.listData.length);
    for (let i = 0; i < this.listData.length; i++) {
      this.childrenMainSize!.update(i, 100);
    }
  }

  build() {
    Column() {
      Text('用例编号：SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_MIRROR_0480')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 5 });

      Button('update')
        .id('updateButton_09')
        .onClick(() => {
          // update接口为(2,500)，第三个listItem的高度为500
          if (this.childrenMainSize) {
            this.childrenMainSize.update(2, 500);
          }
        })
        .margin({ bottom: 10 });

      if (this.childrenMainSize) {
        List({ space: 10 }) {
          ListItemGroup() {
            ForEach(this.listData, (item: string, index: number) => {
              ListItem() {
                Text(item)
                  .width('100%')
                  .fontSize(16)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xF5F5F5)
              }
              .id(`listItem_09_${index}`)
            }, (item: string) => item)
          }
          .childrenMainSize(this.childrenMainSize)
        }
        .id('listMirror_09')
        .width('100%')
        .layoutWeight(1)
        .childrenMainSize(this.childrenMainSize)
      }
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor(0xFFFFFF)
  }
}

