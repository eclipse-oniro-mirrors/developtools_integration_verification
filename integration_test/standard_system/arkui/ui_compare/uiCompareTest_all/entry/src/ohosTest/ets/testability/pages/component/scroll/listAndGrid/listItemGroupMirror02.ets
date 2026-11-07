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
struct ListItemGroupMirror02 {
  private testData: string[] = ['Item A', 'Item B', 'Item C', 'Item D'];

  build() {
    Column() {
      Text('ListItemGroup镜像测试 - 横竖屏切换02')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })

      List({ space: 15 }) {
        ListItemGroup({ 
          header: this.itemHeader('分组1'),
          footer: this.itemFooter('共4项')
        }) {
          ForEach(this.testData, (item: string) => {
            ListItem() {
              Text(item)
                .width('100%')
                .height(70)
                .fontSize(16)
                .textAlign(TextAlign.Center)
                .backgroundColor(0xE0E0E0)
            }
          }, (item: string) => item)
        }
        .divider({ strokeWidth: 1, color: Color.Gray })
      }
      .id('list_mirror_02')
      .width('90%')
      .layoutWeight(1)
      .direction(Direction.Auto)
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

  @Builder
  itemFooter(text: string) {
    Text(text)
      .fontSize(14)
      .width('100%')
      .height(40)
      .textAlign(TextAlign.Center)
      .backgroundColor(0xCCDDFF)
  }
}

