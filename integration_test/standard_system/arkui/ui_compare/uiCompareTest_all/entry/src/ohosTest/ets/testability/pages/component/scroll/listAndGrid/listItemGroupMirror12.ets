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

@Entry
@Component
struct ListItemGroupMirror12 {
  @State childrenMainSize: ChildrenMainSize | null = null;
  private testData: string[] = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5'];

  aboutToAppear() {
    // 初始化childrenMainSize - 构造函数可能需要初始容量参数
    this.childrenMainSize = new ChildrenMainSize(this.testData.length);
    for (let i = 0; i < this.testData.length; i++) {
      this.childrenMainSize!.update(i, 100);
    }
  }

  build() {
    Column() {
      Text('ListItemGroup镜像测试 - childrenMainSize update(2,500)')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })

      Button('update')
        .id('update_button_12')
        .width(120)
        .height(40)
        .margin({ bottom: 10 })
        .onClick(() => {
          // 更新第三个listItem的高度为500
          if (this.childrenMainSize) {
            this.childrenMainSize.update(2, 500);
          }
        })

      if (this.childrenMainSize) {
        List({ space: 10 }) {
          ListItemGroup({ 
            header: this.itemHeader('分组标题')
          }) {
            ForEach(this.testData, (item: string, index?: number) => {
              ListItem() {
                Text(item)
                  .width('100%')
                  .fontSize(16)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xE0E0E0)
              }
            }, (item: string) => item)
          }
          .childrenMainSize(this.childrenMainSize)
          .divider({ strokeWidth: 1, color: Color.Blue })
        }
        .id('list_mirror_12')
        .width('90%')
        .layoutWeight(1)
        .direction(Direction.Rtl)
        .childrenMainSize(this.childrenMainSize)
      }
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor(0xF5F5F5)
  }

  @Builder
  itemHeader(title: string) {
    Text(title)
      .fontSize(18)
      .fontWeight(FontWeight.Bold)
      .width('100%')
      .height(50)
      .textAlign(TextAlign.Center)
      .backgroundColor(0xAABBCC)
  }
}

